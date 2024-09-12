
#' aaaaa

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
