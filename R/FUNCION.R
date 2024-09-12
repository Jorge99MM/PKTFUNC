
library(tidyverse)
library(readxl)
options(scipen=999)



#EJEMPLOS TABLAS 2000/2012

#Cartera



PERM2020_1OIND <-data.frame(
  Año = c(2012, 2011, 2010, 2009, 2008, 2007, 2006, 2005, 2004, 2003, 2002, 2001, 2000, 1999, 1998, 1997, 1996, 1995, 1994, 1993, 1992, 1991, 1990, 1989, 1988, 1987, 1986, 1985, 1984, 1983, 1982, 1981, 1980, 1979, 1978, 1977, 1976, 1975, 1974, 1973, 1972, 1971, 1970, 1969, 1968, 1967, 1966, 1965, 1964, 1963, 1962, 1961, 1960, 1959, 1958, 1957, 1956, 1955, 1954, 1953, 1952, 1951, 1950, 1949, 1948, 1947, 1946, 1945, 1944, 1943, 1942, 1941, 1940, 1939, 1938, 1937, 1936, 1935, 1934, 1933, 1932, 1931, 1930, 1929, 1928, 1927, 1926, 1925, 1924, 1923, 1922, 1921, 1920, 1919, 1918, 1917, 1916, 1915, 1914, 1913, 1912, 1911, 1910, 1909, 1908, 1907, 1906, 1905, 1904, 1903, 1902, 1901, 1900, 1899, 1898, 1897, 1896, 1895, 1894, 1893, 1892),
  HombreQx = c(1.9791825, 0.1254475, 0.1083, 0.0929575, 0.07942, 0.06859, 0.0604675, 0.055955, 0.0532475, 0.0532475, 0.055955, 0.06137, 0.0694925, 0.0821275, 0.09747, 0.11552, 0.135375, 0.1579375, 0.1805, 0.2012575, 0.2193075, 0.232845, 0.243675, 0.250895, 0.25631, 0.261725, 0.2680425, 0.27436, 0.283385, 0.294215, 0.30685, 0.3221925, 0.33934, 0.359195, 0.3835625, 0.4124425, 0.44764, 0.49096, 0.54511, 0.61009, 0.687705, 0.7770525, 0.88084, 0.9972625, 1.1290275, 1.2752325, 1.43678, 1.61367, 1.8077075, 2.0170875, 2.243615, 2.4863875, 2.745405, 3.0188625, 3.3076625, 3.61, 3.9231675, 4.243555, 4.564845, 4.88794, 5.214492627, 5.963965076, 6.702620131, 7.425796135, 8.091977124, 8.675108407, 9.178520071, 9.647874616, 10.14981038, 10.75460918, 11.59327334, 12.76552076, 14.34800397, 16.35576563, 18.74485292, 21.50499955, 24.66175103, 28.33171756, 32.61185585, 37.56804896, 43.12551206, 49.29428081, 56.04780789, 63.32721275, 71.01651774, 78.93344155, 86.96453706, 94.97787631, 102.8314427, 110.3991576, 117.5683023, 124.3955484, 133.0974965, 142.6859348, 154.9583241, 166.5600749, 179.0365306, 192.4257965, 206.9396905, 222.5991268, 239.5389285, 257.9148547, 277.9074627, 299.7266938, 323.6172424, 349.8646839, 378.8021251, 410.8166832, 446.3541052, 485.9177294, 530.053478, 579.3028235, 634.0843676, 694.417984, 759.3062472, 825.4087903, 884.5799335, 922.0103792, 930, 1000, 1000),
  MujerQx = c(1.96384, 0.1308625, 0.11191, 0.09386, 0.0785175, 0.0658825, 0.0568575, 0.0514425, 0.0478325, 0.0478325, 0.048735, 0.052345, 0.05776, 0.063175, 0.0694925, 0.0767125, 0.0839325, 0.092055, 0.0983725, 0.102885, 0.106495, 0.1092025, 0.1110075, 0.113715, 0.1164225, 0.1200325, 0.124545, 0.1308625, 0.1380825, 0.1471075, 0.1579375, 0.16967, 0.18411, 0.2012575, 0.222015, 0.2463825, 0.27436, 0.30685, 0.34295, 0.3835625, 0.4286875, 0.48013, 0.53789, 0.601065, 0.67146, 0.74727, 0.828495, 0.91694, 1.0108, 1.110075, 1.214765, 1.323065, 1.4358775, 1.5513975, 1.6687225, 1.7878525, 1.9069825, 2.0243075, 2.1398275, 2.25264, 2.27157449, 2.719273681, 3.177724676, 3.612342304, 3.992017091, 4.326657805, 4.659864451, 5.049489172, 5.507987483, 6.051551294, 6.669949679, 7.383954395, 8.257076823, 9.327298621, 10.61803727, 12.17933531, 14.0724785, 16.34037856, 18.99759411, 22.10124542, 25.65798362, 29.76179378, 34.43291664, 39.78912742, 45.76252663, 52.37305615, 59.5269627, 66.99388121, 74.70611483, 82.71529587, 91.00055777, 99.28453306, 107.459584, 115.6873039, 127.7386836, 138.7554836, 150.532217, 163.1481052, 176.7120372, 191.2903424, 206.9956576, 223.9572017, 242.3237194, 262.2669857, 283.9859471, 307.7115571, 333.7122882, 362.3001402, 393.8366072, 428.7373041, 467.4723748, 510.5564862, 558.5152106, 611.7996277, 670.5887689, 734.3513224, 800.9065865, 864.5744447, 935, 1000, 1000),
  FactorHombre = c(0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.039187279, 0.038247101, 0.037164244, 0.035918241, 0.03449585, 0.032898367, 0.031162036, 0.02938632, 0.027694695, 0.026182142, 0.024918082, 0.023940104, 0.023242052, 0.022771418, 0.022453436, 0.022216407, 0.022019316, 0.021843089, 0.021689835, 0.021581742, 0.02155272, 0.021633911, 0.021839273, 0.022177248, 0.022631596, 0.023065429, 0.023531767, 0.023982793, 0.024288095, 0.024514947, 0.024740944, 0.024665998, 0.024598127, 0.024451589, 0.024238864, 0.023864577, 0.023523312, 0.02309944, 0.022572837, 0.022024227, 0.021235488, 0.020504463, 0.019544561, 0.018581928, 0.017557735, 0.016510958, 0.015464668, 0.014431812, 0.013424437, 0.012453932, 0.011325564, 0.010237659, 0.009187634, 0.00817697, 0.007208722, 0.006281341, 0.005581341, 0.004881341, 0.004181341, 0.003481341, 0.002981341, 0.002481341, 0.001981341, 0.001481341, 0.000981341, 0.000481341, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
  FactorMujer = c(0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.039521, 0.039077, 0.038832, 0.038713, 0.038636, 0.038534, 0.038366, 0.038129, 0.037842, 0.037541, 0.037264, 0.037046, 0.036908, 0.036854, 0.036873, 0.036937, 0.037013, 0.03707, 0.037091, 0.037068, 0.037004, 0.036901, 0.03675, 0.036531, 0.03621, 0.035755, 0.035148, 0.034395, 0.033528, 0.032599, 0.031667, 0.030782, 0.029974, 0.029242, 0.028558, 0.027874, 0.027139, 0.026309, 0.025362, 0.024305, 0.023169, 0.02201, 0.020897, 0.019902, 0.019089, 0.018504, 0.018169, 0.018082, 0.01822, 0.018546, 0.019019, 0.019602, 0.020266, 0.020996, 0.021788, 0.022642, 0.023562, 0.024543, 0.025473, 0.026427, 0.027374, 0.028179, 0.028906, 0.029625, 0.030012, 0.030347, 0.030517, 0.03051, 0.030216, 0.029827, 0.02924, 0.028455, 0.027582, 0.026437, 0.025346, 0.024041, 0.022757, 0.021428, 0.020087, 0.018759, 0.017468, 0.016228, 0.01505, 0.013739, 0.012495, 0.011313, 0.010186, 0.009104, 0.008057, 0.007039, 0.006044, 0.005344, 0.004644, 0.004144, 0.003644, 0.003144, 0.002644, 0.002144, 0.001644, 0.001144, 0.000644, 0.000144, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
)

PERM2020_1OIND


usethis::use_r("PERM2020_1OIND")

PERM2020_2OIND <- data.frame(
  Año = c(2012, 2011, 2010, 2009, 2008, 2007, 2006, 2005, 2004, 2003, 2002, 2001, 2000, 1999, 1998, 1997, 1996, 1995, 1994, 1993, 1992, 1991, 1990, 1989, 1988, 1987, 1986, 1985, 1984, 1983, 1982, 1981, 1980, 1979, 1978, 1977, 1976, 1975, 1974, 1973, 1972, 1971, 1970, 1969, 1968, 1967, 1966, 1965, 1964, 1963, 1962, 1961, 1960, 1959, 1958, 1957, 1956, 1955, 1954, 1953, 1952, 1951, 1950, 1949, 1948, 1947, 1946, 1945, 1944, 1943, 1942, 1941, 1940, 1939, 1938, 1937, 1936, 1935, 1934, 1933, 1932, 1931, 1930, 1929, 1928, 1927, 1926, 1925, 1924, 1923, 1922, 1921, 1920, 1919, 1918, 1917, 1916, 1915, 1914, 1913, 1912, 1911, 1910, 1909, 1908, 1907, 1906, 1905, 1904, 1903, 1902, 1901, 1900, 1899, 1898, 1897, 1896, 1895, 1894, 1893, 1892),
  HombreQx = c(2.193, 0.139, 0.12, 0.103, 0.088, 0.076, 0.067, 0.062, 0.059, 0.059, 0.062, 0.062, 0.068, 0.077, 0.091, 0.108, 0.128, 0.15, 0.175, 0.2, 0.223, 0.243, 0.258, 0.27, 0.278, 0.284, 0.29, 0.297, 0.304, 0.314, 0.326, 0.34, 0.357, 0.376, 0.398, 0.425, 0.457, 0.496, 0.544, 0.604, 0.676, 0.762, 0.861, 0.976, 1.105, 1.251, 1.413, 1.592, 1.788, 2.003, 2.235, 2.486, 2.755, 3.042, 3.345, 3.665, 4, 4.347, 4.702, 5.058, 5.416, 5.776551043, 6.600957472, 7.409485, 8.194434049, 8.910887704, 9.530991439, 10.06085725, 10.55219798, 11.07936948, 11.71909032, 12.61235133, 13.86802907, 15.56689158, 17.72214284, 20.28444207, 23.24111051, 26.61244311, 30.52328976, 35.08160053, 40.35236194, 46.25711902, 52.81152861, 59.98909118, 67.72239626, 75.89667387, 85.03488035, 94.30748008, 103.5424121, 112.5624888, 121.2116418, 129.4355498, 138.6473527, 149.525, 162.9744872, 176.8037341, 191.2835804, 206.9094586, 222.5157962, 239.3538998, 257.5687404, 277.3278008, 298.8252287, 322.2867675, 347.9755295, 376.1985849, 407.314113, 441.7383691, 479.9506508, 522.4921821, 569.9499764, 622.9062619, 681.8111479, 746.6860043, 816.4583304, 887.5363336, 951.1612188, 991.4090099, 1000, 1000, 1000),
  MujerQx = c(2.176, 0.145, 0.124, 0.104, 0.087, 0.073, 0.063, 0.057, 0.053, 0.053, 0.054, 0.054, 0.058, 0.064, 0.07, 0.077, 0.085, 0.093, 0.102, 0.109, 0.114, 0.118, 0.121, 0.123, 0.126, 0.129, 0.133, 0.138, 0.145, 0.153, 0.163, 0.175, 0.188, 0.204, 0.223, 0.246, 0.273, 0.304, 0.34, 0.38, 0.425, 0.475, 0.532, 0.596, 0.666, 0.744, 0.828, 0.918, 1.016, 1.12, 1.23, 1.346, 1.466, 1.591, 1.719, 1.849, 1.981, 2.113, 2.243, 2.371, 2.496, 2.516980044, 3.01304563, 3.521024572, 4.00259535, 4.423287635, 4.79408067, 5.163284711, 5.595001852, 6.103033222, 6.705319994, 7.39052596, 8.174420895, 9.127876214, 10.28935314, 11.6810091, 13.35453433, 15.37471703, 17.78254277, 20.59583056, 23.87259172, 27.62784928, 31.95725736, 36.89372832, 42.55521649, 48.88114359, 56.52179027, 64.810887, 73.47542508, 82.48457656, 91.87161479, 101.4755048, 111.0377278, 120.5954875, 133.2518384, 146.3498141, 159.9092328, 174.4899521, 188.9968312, 204.5886015, 221.3857301, 239.5264189, 259.1697534, 280.4994499, 303.7282856, 329.1032697, 356.9115382, 387.486781, 421.2156227, 458.5425712, 499.9704543, 546.0497178, 597.3424712, 654.3311526, 717.2072395, 785.4024838, 856.5845845, 924.6785505, 1000, 1000, 1000),
  FactorHombre = c(0.035, 0.035, 0.035, 0.035, 0.035, 0.035, 0.035, 0.035, 0.035, 0.035, 0.035, 0.035, 0.035, 0.035, 0.035, 0.035, 0.035, 0.035, 0.035, 0.035, 0.035, 0.035, 0.035, 0.035, 0.035, 0.035, 0.035, 0.035, 0.035, 0.035, 0.035, 0.035, 0.035, 0.035, 0.035, 0.035, 0.035, 0.035, 0.035, 0.035, 0.035, 0.035, 0.0341873, 0.0332471, 0.0321642, 0.0309182, 0.0294958, 0.0278984, 0.026162, 0.0243863, 0.0226947, 0.0211821, 0.0199181, 0.0189401, 0.0182421, 0.0177714, 0.0174534, 0.0172164, 0.0170193, 0.0168431, 0.0166898, 0.0165817, 0.0165527, 0.0166339, 0.0168393, 0.0171772, 0.0176316, 0.0181654, 0.0187318, 0.0192828, 0.0197881, 0.0202149, 0.0205409, 0.020766, 0.0208981, 0.0209516, 0.0209389, 0.0208646, 0.0207233, 0.0204994, 0.0201728, 0.0197242, 0.0191355, 0.0184045, 0.0175446, 0.0165819, 0.0154705, 0.0143366, 0.0132065, 0.012096, 0.0110201, 0.0099897, 0.0090076, 0.008071, 0.0071796, 0.0063368, 0.005542, 0.0049813, 0.0044813, 0.0039813, 0.0034813, 0.0029813, 0.0024813, 0.0019813, 0.0014813, 0.0009813, 0.0004813, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
  FactorMujer = c(0.035, 0.035, 0.035, 0.035, 0.035, 0.035, 0.035, 0.035, 0.03452118, 0.03407703, 0.03383229, 0.03383229, 0.03371313, 0.03363635, 0.0335336, 0.03336645, 0.0331293, 0.03284247, 0.03254108, 0.03226415, 0.03204568, 0.03190751, 0.03185446, 0.03187338, 0.03193715, 0.03201266, 0.03207032, 0.03209108, 0.03206846, 0.03200449, 0.031901, 0.0317504, 0.03153082, 0.03120962, 0.03075459, 0.03014762, 0.02939472, 0.02852801, 0.02759927, 0.02666722, 0.0257824, 0.02497385, 0.02424168, 0.02355773, 0.02287449, 0.02213922, 0.02130899, 0.02036221, 0.0193045, 0.01816872, 0.01701001, 0.01589726, 0.01490246, 0.01408946, 0.0135043, 0.01316934, 0.01308227, 0.01322002, 0.01354604, 0.01401914, 0.01460174, 0.01526598, 0.01599624, 0.0167878, 0.01764239, 0.01856204, 0.01954318, 0.02057271, 0.02162707, 0.02267448, 0.02367922, 0.02460634, 0.02542528, 0.02611164, 0.02664683, 0.02701665, 0.02720956, 0.02721575, 0.02702738, 0.02664013, 0.02605526, 0.02528161, 0.02433662, 0.02324585, 0.02204103, 0.02075696, 0.01931647, 0.01786544, 0.01643635, 0.01505429, 0.01373688, 0.01249437, 0.01132994, 0.01024043, 0.00921772, 0.00825073, 0.00732789, 0.00643925, 0.00564417, 0.00514417, 0.00464417, 0.00414417, 0.00364417, 0.00314417, 0.00264417, 0.00214417, 0.00164417, 0.00114417, 0.00064417, 0.00014417, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
)

PERM2020_2OIND
usethis::use_r("PERM2020_2OIND")




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



