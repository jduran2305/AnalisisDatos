---
  title: "Actividad3_analisis"
author: "Jduran"
date: "25/2/2021"
output: html_document
---


#ruta = "D:\\1- Master - BigData\\Asignaturas\\4. Analisis e interpretaci�n de datos\\Actividades\\Actividad 3\\Encuesta_movilidad_2.csv"


datos <- read.csv2('https://raw.githubusercontent.com/jduran2305/AnalisisDatos/main/Encuesta_movilidad_2.csv')
datos <- datos[datos$MUNICIPIO_DESTINO=="BOGOTA-DC 11001",]
datos <- datos[datos$MUNICIPIO_ORIGEN=="BOGOTA-DC 11001",]


#Se validan los tipos de datos 
str(datos)

#Se extraen los registros con medio de transprote bicileta  y su duraci�n
bicicletas <- datos[datos$MEDIO_PREDOMINANTE=="BICICLETA, BICICLETA CON MOTOR", ]
#duracionAutos <- autos["DURACION"]


#Estadistica descriptiva

summary(bicicletas["DURACION"])

#str(bicicletas["DURACION"])


hist(x = bicicletas$DURACION, breaks = 48 , main = "Duraci�n viajes en Bicicleta", 
     xlab = "Duraci�n[minutos]", ylab = "Frecuencia",
     col = "ivory")

boxplot(bicicletas$DURACION, main = "Duraci�n viajes en Bicicleta")


#Cuasivarianza
CV = var(bicicletas["DURACION"])
CV = 1114.978
s= sqrt(CV)
n= dim(bicicletas["DURACION"])
n= n[1]
x = 51
xu = 45.85

#Contraste de hip�tesis
texp = x-xu/ (s/sqrt(n))

#Valor critico
qt(c(.025, .975), df=n) 

#P-valor
2*pt(-abs(texp),df=n-1)


###******** Contraste con los autos *************

#Se extraen los registros con medio de transprote AUTO  y suduraci�n
autos <- datos[datos$MEDIO_PREDOMINANTE=="AUTO", ]
#duracionAutos <- autos["DURACION"]

#Estadistica descriptiva
summary(autos["DURACION"])

str(autos["DURACION"])

hist(x = autos$DURACION, breaks = 48 , main = "Duraci�n viajes en auto", 
     xlab = "Duraci�n[minutos]", ylab = "Frecuencia",
     col = "ivory")

boxplot(autos$DURACION, main = "Duraci�n viajes en auto")


#Cuasivarianza
CVa = var(autos["DURACION"])
CVa = 1055.703
sa= sqrt(CV)
na= dim(autos["DURACION"])
na= na[1]


#Diferencia de medias 
xb = 45.85
xa = 51.2 

#Contraste de hip�tesis
texp = xa-xb/ sqrt((CV/n)+(CVa/na))
texp

#Valor critico
qt(c(.025, .975), df=n+na-2) 








