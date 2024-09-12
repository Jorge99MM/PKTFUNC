
#' aaaaa
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
