
library(tidyverse)
library(readxl)
options(scipen=999)



#EJEMPLOS TABLAS 2000/2012

#Cartera

library(readxl)

PERM2020_1OIND <- data.frame(read_excel("TABLAS.xlsx", sheet = "PERM2020_1OIND")
)

PERM2020_2OIND <- data.frame(read_excel("TABLAS.xlsx", sheet = "PERM2020_2OIND")
)

PERM2020_1OCOL<- data.frame(read_excel("TABLAS.xlsx", sheet = "PERM2020_1OCOL")
)

PERM2020_2OCOL<- data.frame(read_excel("TABLAS.xlsx", sheet = "PERM2020_2OCOL")
)




usethis::use_data(PERM2020_1OIND, PERM2020_1OIND, PERM2020_1OIND, PERM2020_1OIND,
                  overwrite = TRUE, internal = FALSE)



PERM2000_CART<- data.frame(read_excel("TABLAS.xlsx", sheet = "PERM2000_CART")
)

usethis::use_data(PERM2000_CART, overwrite = TRUE)


PERM2000_NEWCONTR<- data.frame(read_excel("TABLAS.xlsx", sheet = "PERM2000_NEWCONTR")
)

usethis::use_data(PERM2000_NEWCONTR, overwrite = TRUE)

### TABLAS GENERACIONALES SOLO CON VALORES LX
#'@export
TablaGenAnual <-function(Generacion,AñoBase=2012,Tabla,Genero=FALSE){
  #Generacion es el año de Nacimiento de la Persona
  #Año Base es 2012 y es el prederteminado. Se puede cambiar si la tabla es del 2000 etc..
  # FALSE HOMBRE / TRUE MUJER . PREDETERMINADO HOMBRE
  G = 2
  FG = 4
  if(Genero){
    G = 3
    FG = 5
  }
  x <- as.numeric(0:(nrow(Tabla)-1))
  a<- as.numeric(0:(nrow(Tabla)-1))
  Lx=rep(1000000,nrow(Tabla))
  for (i in 0:nrow(Tabla)-1) {
    qxa<-as.numeric(Tabla[i+1,G]/1000)
    Factor<-as.numeric(Tabla[i+1,FG])
    Diff<- (Generacion+i)-AñoBase
    a[i+1]<-qxa*exp(-Factor*Diff)
  }
  for (o in 2:(nrow(Tabla))) {
    Lx[o]<-Lx[o-1]*(1-a[o-1])
  }
  return(data.frame(X=x,qx=a,Lx=Lx))
}

usethis::use_r("TablaGenAnual")

prueba <- TablaGenAnual(1998,AñoBase=2012,PERM2020_1OIND,)
(y <- sum(prueba$Lx))

prueba2 <- TablaGenAnual(1998,AñoBase=2012,PERM2020_1OIND,)
(x <-sum(prueba2$Lx))

error <- ((x-y)/x)
error

#'@export
TablaGenMensual<-function(Generacion,AñoBase=2012,Tabla,Genero=FALSE){
  TablaAnual<-TablaGenAnual(Generacion,AñoBase=2012,Tabla,Genero)
  PERM_mensual <- data.frame(X = rep(0:125, each = 12),m = rep(0:11, times = 126))
  PERM_mensual$x_mensual <- PERM_mensual$X * 12 + PERM_mensual$m

  PERM_mensual$Lx_mensual <- sapply(1:nrow(PERM_mensual), function(k) {
    x = PERM_mensual$X[k]
    m = PERM_mensual$m[k]
    Lx_actual = TablaAnual$Lx[TablaAnual$X == x]
    Lx_siguiente = TablaAnual$Lx[TablaAnual$X == (x + 1)]
    interpolacion = Lx_actual - (Lx_actual - Lx_siguiente) * (m / 12)
    return(interpolacion)
  })

  PERM_mensual$Lx_mensual <- as.numeric(PERM_mensual$Lx_mensual)
  PERM_mensual$Lx_mensual[is.na(PERM_mensual$Lx_mensual)]<-0
  return(PERM_mensual)
}

usethis::use_r("TablaGenMensual")




### TABLAS GENERACIONALES COMPLETAS INCLUYENDO SIMBOLOS DE CONMUTACION ###


#'@export
TablaGenAnualCompleta<-function(Generacion,AñoBase=2012,Tabla,Genero=FALSE,interes){
  #SI EL INTERES NO ES NUMERICO GENERAR ERROR
  if(is.numeric(interes)==FALSE){
    return("Error el interes no es numerico")
  }
  #CALCULAMOS EL RESTO DE VALORES

  TablaCompleta <- TablaGenAnual(Generacion,AñoBase=2012,Tabla,Genero)
  TablaCompleta$dx<-TablaCompleta$Lx*TablaCompleta$qx
  v = 1/(1+interes)

  ## SUPERVIVENCIA

  #CALCULAMOS DX
  TablaCompleta$Dx <- (v^TablaCompleta$X)*TablaCompleta$Lx

  #CALCULAMOS NX
  for (o in 1:nrow(TablaCompleta)) {
    TablaCompleta$Nx[o]<- sum(TablaCompleta$Dx[o:nrow(TablaCompleta)])
  }

  #CALCULAMOS SX
  for (o in 1:nrow(TablaCompleta)) {
    TablaCompleta$Sx[o]<- sum(TablaCompleta$Nx[o:nrow(TablaCompleta)])
  }

  ##MORTALIDAD

  #CX
  TablaCompleta$Cx<-(v^(TablaCompleta$X+1))*TablaCompleta$dx
  TablaCompleta$Cx2<-(v^(TablaCompleta$X+(1/2)))*TablaCompleta$dx


  #MX
  for (o in 1:nrow(TablaCompleta)) {
    TablaCompleta$Mx[o]<- sum(TablaCompleta$Cx[o:nrow(TablaCompleta)])
  }

  for (o in 1:nrow(TablaCompleta)) {
    TablaCompleta$Mx2[o]<- sum(TablaCompleta$Cx2[o:nrow(TablaCompleta)])
  }
  #RX

  for (o in 1:nrow(TablaCompleta)) {
    TablaCompleta$Rx[o]<- sum(TablaCompleta$Mx[o:nrow(TablaCompleta)])
  }

  for (o in 1:nrow(TablaCompleta)) {
    TablaCompleta$Rx2[o]<- sum(TablaCompleta$Mx2[o:nrow(TablaCompleta)])
  }
  return(TablaCompleta)

}

usethis::use_r("TablaGenAnualCompleta")

#'@export
TablaGenMensualCompleta<-function(Generacion,AñoBase=2012,Tabla,Genero=FALSE,interes){
  #SI EL INTERES NO ES NUMERICO GENERAR ERROR
  if(is.numeric(interes)==FALSE){
    return("Error el interes no es numerico")
  }
  #CALCULAMOS EL RESTO DE VALORES

  TablaCompleta <- TablaGenMensual(Generacion,AñoBase=2012,Tabla,Genero)
  interes_mensual <- (((1+interes)^(1/12))-1)
  v <- 1/(1+interes_mensual)


  #CALCULAMOS dx
  for (o in 1:nrow(TablaCompleta)) {
    TablaCompleta$dx[o]<-TablaCompleta$Lx_mensual[o]-TablaCompleta$Lx_mensual[o+1]

  }
  TablaCompleta$dx[is.na(TablaCompleta$dx)]<-0

  ## SUPERVIVENCIA

  TablaCompleta$Dx <- (v^TablaCompleta$x_mensual)*TablaCompleta$Lx_mensual



  #CALCULAMOS NX
  for (o in 1:nrow(TablaCompleta)) {
    TablaCompleta$Nx[o]<- sum(TablaCompleta$Dx[o:nrow(TablaCompleta)])
  }

  #CALCULAMOS SX
  for (o in 1:nrow(TablaCompleta)) {
    TablaCompleta$Sx[o]<- sum(TablaCompleta$Nx[o:nrow(TablaCompleta)])
  }

  ## MORTALIDAD

  #CX
  TablaCompleta$Cx<-(v^(TablaCompleta$x_mensual+1))*TablaCompleta$dx
  TablaCompleta$Cx2<-(v^(TablaCompleta$X+(1/2)))*TablaCompleta$dx
  #MX
  for (o in 1:nrow(TablaCompleta)) {
    TablaCompleta$Mx[o]<- sum(TablaCompleta$Cx[o:nrow(TablaCompleta)])
  }

  for (o in 1:nrow(TablaCompleta)) {
    TablaCompleta$Mx2[o]<- sum(TablaCompleta$Cx2[o:nrow(TablaCompleta)])
  }

  #RX

  for (o in 1:nrow(TablaCompleta)) {
    TablaCompleta$Rx[o]<- sum(TablaCompleta$Mx[o:nrow(TablaCompleta)])
  }

  for (o in 1:nrow(TablaCompleta)) {
    TablaCompleta$Rx2[o]<- sum(TablaCompleta$Mx2[o:nrow(TablaCompleta)])
  }


  return(TablaCompleta)

}

usethis::use_r("TablaGenMensualCompleta")

#'@export
TablaCompleta<-function(TablaCompleta,interes){
  #SI EL INTERES NO ES NUMERICO GENERAR ERROR
  if(is.numeric(interes)==FALSE){
    return("Error el interes no es numerico")
  }
  #CALCULAMOS EL RESTO DE VALORES
  v = 1/(1+interes)

  #CALCULAMOS dx
  for (o in 1:nrow(TablaCompleta)) {
    TablaCompleta$dx[o]<-TablaCompleta$Lx[o]-TablaCompleta$Lx[o+1]

  }
  TablaCompleta$dx[is.na(TablaCompleta$dx)]<-0

  ## SUPERVIVENCIA

  #CALCULAMOS DX
  TablaCompleta$Dx <- (v^TablaCompleta$X)*TablaCompleta$Lx

  #CALCULAMOS NX
  for (o in 1:nrow(TablaCompleta)) {
    TablaCompleta$Nx[o]<- sum(TablaCompleta$Dx[o:nrow(TablaCompleta)])
  }

  #CALCULAMOS SX
  for (o in 1:nrow(TablaCompleta)) {
    TablaCompleta$Sx[o]<- sum(TablaCompleta$Nx[o:nrow(TablaCompleta)])
  }

  ##MORTALIDAD

  #CX
  TablaCompleta$Cx<-(v^(TablaCompleta$X+1))*TablaCompleta$dx
  TablaCompleta$Cx2<-(v^(TablaCompleta$X+(1/2)))*TablaCompleta$dx
  #MX
  for (o in 1:nrow(TablaCompleta)) {
    TablaCompleta$Mx[o]<- sum(TablaCompleta$Cx[o:nrow(TablaCompleta)])
  }

  for (o in 1:nrow(TablaCompleta)) {
    TablaCompleta$Mx2[o]<- sum(TablaCompleta$Cx2[o:nrow(TablaCompleta)])
  }
  #RX

  for (o in 1:nrow(TablaCompleta)) {
    TablaCompleta$Rx[o]<- sum(TablaCompleta$Mx[o:nrow(TablaCompleta)])
  }


  for (o in 1:nrow(TablaCompleta)) {
    TablaCompleta$Rx2[o]<- sum(TablaCompleta$Mx2[o:nrow(TablaCompleta)])
  }
  return(TablaCompleta)

}



usethis::use_r("TablaCompleta")
#'@export
TablaGenAnualCompleta<-function(Generacion,AñoBase=2012,Tabla,Genero=FALSE,interes){
  #SI EL INTERES NO ES NUMERICO GENERAR ERROR
  if(is.numeric(interes)==FALSE){
    return("Error el interes no es numerico")
  }
  #CALCULAMOS EL RESTO DE VALORES

  TablaCompleta <- TablaGenAnual(Generacion,AñoBase=2012,Tabla,Genero)
  v = 1/(1+interes)

  #CALCULAMOS dx
  for (o in 1:nrow(TablaCompleta)) {
    TablaCompleta$dx[o]<-TablaCompleta$Lx[o]-TablaCompleta$Lx[o+1]

  }
  TablaCompleta$dx[is.na(TablaCompleta$dx)]<-0

  ## SUPERVIVENCIA

  #CALCULAMOS DX
  TablaCompleta$Dx <- (v^TablaCompleta$X)*TablaCompleta$Lx

  #CALCULAMOS NX
  for (o in 1:nrow(TablaCompleta)) {
    TablaCompleta$Nx[o]<- sum(TablaCompleta$Dx[o:nrow(TablaCompleta)])
  }

  #CALCULAMOS SX
  for (o in 1:nrow(TablaCompleta)) {
    TablaCompleta$Sx[o]<- sum(TablaCompleta$Nx[o:nrow(TablaCompleta)])
  }

  ##MORTALIDAD

  #CX
  TablaCompleta$Cx<-(v^(TablaCompleta$X+1))*TablaCompleta$dx
  TablaCompleta$Cx2<-(v^(TablaCompleta$X+(1/2)))*TablaCompleta$dx
  #MX
  for (o in 1:nrow(TablaCompleta)) {
    TablaCompleta$Mx[o]<- sum(TablaCompleta$Cx[o:nrow(TablaCompleta)])
  }
  for (o in 1:nrow(TablaCompleta)) {
    TablaCompleta$Mx2[o]<- sum(TablaCompleta$Cx2[o:nrow(TablaCompleta)])
  }
  #RX

  for (o in 1:nrow(TablaCompleta)) {
    TablaCompleta$Rx[o]<- sum(TablaCompleta$Mx[o:nrow(TablaCompleta)])
  }

  for (o in 1:nrow(TablaCompleta)) {
    TablaCompleta$Rx2[o]<- sum(TablaCompleta$Mx2[o:nrow(TablaCompleta)])
  }
  return(TablaCompleta)

}












Ejemplo_Anual<- TablaGenAnual(1998,Tabla = PERM2020_1OIND,AñoBase = 2012)


Ejemplo_Anual_Completo<- TablaGenAnualCompleta(1998,Tabla=PERM2020_1OIND,AñoBase = 2012,interes = 0.025)

Ejemplo_Mensual<-TablaGenMensual(1998,Tabla = PERM2020_1OIND,AñoBase = 2012)

Ejemplo_Mensual_Completo<-TablaGenMensualCompleta(1998,Tabla = PERM2020_1OIND,AñoBase = 2012,interes = 0.025)



