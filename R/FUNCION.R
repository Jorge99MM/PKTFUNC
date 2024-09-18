
library(tidyverse)
library(readxl)
options(scipen=999)



#EJEMPLOS TABLAS 2000/2012

#Cartera



# Crear vectores para cada columna
PERM2020_1OIND <-data.frame(
  Año = c(2012, 2011, 2010, 2009, 2008, 2007, 2006, 2005, 2004, 2003, 2002, 2001, 2000, 1999, 1998, 1997, 1996, 1995, 1994, 1993, 1992, 1991, 1990, 1989, 1988, 1987, 1986, 1985, 1984, 1983, 1982, 1981, 1980, 1979, 1978, 1977, 1976, 1975, 1974, 1973, 1972, 1971, 1970, 1969, 1968, 1967, 1966, 1965, 1964, 1963, 1962, 1961, 1960, 1959, 1958, 1957, 1956, 1955, 1954, 1953, 1952, 1951, 1950, 1949, 1948, 1947, 1946, 1945, 1944, 1943, 1942, 1941, 1940, 1939, 1938, 1937, 1936, 1935, 1934, 1933, 1932, 1931, 1930, 1929, 1928, 1927, 1926, 1925, 1924, 1923, 1922, 1921, 1920, 1919, 1918, 1917, 1916, 1915, 1914, 1913, 1912, 1911, 1910, 1909, 1908, 1907, 1906, 1905, 1904, 1903, 1902, 1901, 1900, 1899, 1898, 1897, 1896, 1895, 1894, 1893, 1892),
  HombreQx = c(1.9791825, 0.1254475, 0.1083, 0.0929575, 0.07942, 0.06859, 0.0604675, 0.055955, 0.0532475, 0.0532475, 0.055955, 0.055955, 0.06137, 0.0694925, 0.0821275, 0.09747, 0.11552, 0.135375, 0.1579375, 0.1805, 0.2012575, 0.2193075, 0.232845, 0.243675, 0.250895, 0.25631, 0.261725, 0.2680425, 0.27436, 0.283385, 0.294215, 0.30685, 0.3221925, 0.33934, 0.359195, 0.3835625, 0.4124425, 0.44764, 0.49096, 0.54511, 0.61009, 0.687705, 0.7770525, 0.88084, 0.9972625, 1.1290275, 1.2752325, 1.43678, 1.61367, 1.8077075, 2.0170875, 2.243615, 2.4863875, 2.745405, 3.0188625, 3.3076625, 3.61, 3.9231675, 4.243555, 4.564845, 4.88794, 5.214492627, 5.963965076, 6.702620131, 7.425796135, 8.091977124, 8.675108407, 9.178520071, 9.647874616, 10.14981038, 10.75460918, 11.59327334, 12.76552076, 14.34800397, 16.35576563, 18.74485292, 21.50499955, 24.66175103, 28.33171756, 32.61185585, 37.56804896, 43.12551206, 49.29428081, 56.04780789, 63.32721275, 71.01651774, 79.60269951, 88.3000936, 96.94126791, 105.3540144, 113.3863012, 120.9819254, 129.4716848, 139.4897887, 151.8902268, 164.6264498, 177.9968259, 192.4257965, 206.9396905, 222.5991268, 239.5389285, 257.9148547, 277.9074627, 299.7266938, 323.6172424, 349.8646839, 378.8021251, 410.8166832, 446.3541052, 485.9177294, 530.053478, 579.3028235, 634.0843676, 694.417984, 759.3062472, 825.4087903, 884.5799335, 922.0103792, 930, 1000, 1000),
  MujerQx = c(1.96384, 0.1308625, 0.11191, 0.09386, 0.0785175, 0.0658825, 0.0568575, 0.0514425, 0.0478325, 0.0478325, 0.048735, 0.048735, 0.052345, 0.05776, 0.063175, 0.0694925, 0.0767125, 0.0839325, 0.092055, 0.0983725, 0.102885, 0.106495, 0.1092025, 0.1110075, 0.113715, 0.1164225, 0.1200325, 0.124545, 0.1308625, 0.1380825, 0.1471075, 0.1579375, 0.16967, 0.18411, 0.2012575, 0.222015, 0.2463825, 0.27436, 0.30685, 0.34295, 0.3835625, 0.4286875, 0.48013, 0.53789, 0.601065, 0.67146, 0.74727, 0.828495, 0.91694, 1.0108, 1.110075, 1.214765, 1.323065, 1.4358775, 1.5513975, 1.6687225, 1.7878525, 1.9069825, 2.0243075, 2.1398275, 2.25264, 2.27157449, 2.719273681, 3.177724676, 3.612342304, 3.992017091, 4.326657805, 4.659864451, 5.049489172, 5.507987483, 6.051551294, 6.669949679, 7.383954395, 8.257076823, 9.327298621, 10.61803727, 12.17933531, 14.0724785, 16.34037856, 18.99759411, 22.10124542, 25.65798362, 29.76179378, 34.43291664, 39.78912742, 45.76252663, 52.96921503, 60.77144912, 68.92193961, 77.37584185, 86.16748833, 95.14254541, 104.0533128, 112.9447306, 124.7258387, 136.9193503, 149.5508225, 163.1481052, 176.7120372, 191.2903424, 206.9956576, 223.9572017, 242.3237194, 262.2669857, 283.9859471, 307.7115571, 333.7122882, 362.3001402, 393.8366072, 428.7373041, 467.4723748, 510.5564862, 558.5152106, 611.7996277, 670.5887689, 734.3513224, 800.9065865, 864.5744447, 935, 1000, 1000),
  FactorHombre = c(0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.0391873, 0.0382471, 0.0371642, 0.0359182, 0.0344958, 0.0328984, 0.031162, 0.0293863, 0.0276947, 0.0261821, 0.0249181, 0.0239401, 0.0232421, 0.0227714, 0.0224534, 0.0222164, 0.0220193, 0.0218431, 0.0216898, 0.0215817, 0.0215527, 0.0216339, 0.0218393, 0.0221772, 0.0226316, 0.0230654, 0.0235318, 0.0239828, 0.0242881, 0.0245149, 0.0247409, 0.024666, 0.0245981, 0.0244516, 0.0242389, 0.0238646, 0.0235233, 0.0230994, 0.0225728, 0.0220242, 0.0212355, 0.0205045, 0.0195446, 0.0185819, 0.0174705, 0.0163366, 0.0152065, 0.014096, 0.0130201, 0.0118897, 0.010691, 0.0095376, 0.0084296, 0.0073701, 0.0063586, 0.0055813, 0.0048813, 0.0041813, 0.0034813, 0.0029813, 0.0024813, 0.0019813, 0.0014813, 0.0009813, 0.0004813, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
  FactorMujer = c(0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, 0.039521181, 0.039077027, 0.038832287, 0.038832287, 0.038713133, 0.038636346, 0.038533595, 0.038366451, 0.038129296, 0.037842473, 0.037541083, 0.037264149, 0.037045681, 0.036907515, 0.036854462, 0.036873384, 0.036937146, 0.037012659, 0.037070315, 0.037091076, 0.037068462, 0.037004485, 0.036901001, 0.036750401, 0.036530816, 0.036209624, 0.03575459, 0.035147621, 0.034394722, 0.033528015, 0.032599267, 0.031667219, 0.030782397, 0.029973852, 0.029241678, 0.028557732, 0.027874488, 0.02713922, 0.026308991, 0.025362207, 0.0243045, 0.023168723, 0.022010011, 0.020897262, 0.019902462, 0.019089456, 0.018504302, 0.018169344, 0.018082272, 0.018220016, 0.018546039, 0.019019135, 0.019601738, 0.020265978, 0.020996237, 0.021787805, 0.022642395, 0.02356204, 0.024543182, 0.025472708, 0.026427066, 0.02737448, 0.028179224, 0.028906337, 0.029625281, 0.030011636, 0.030346829, 0.030516648, 0.030509562, 0.030215747, 0.029827383, 0.029240132, 0.028455263, 0.027581613, 0.026436617, 0.025345851, 0.024041028, 0.022756958, 0.021316468, 0.019865444, 0.018436348, 0.017054292, 0.015736883, 0.014394366, 0.013013269, 0.011707099, 0.010467719, 0.009284065, 0.008144555, 0.00703925, 0.006044165, 0.005344165, 0.004644165, 0.004144165, 0.003644165, 0.003144165, 0.002644165, 0.002144165, 0.001644165, 0.001144165, 0.000644165, 0.000144165, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)

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



