
#' aaaaa


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
