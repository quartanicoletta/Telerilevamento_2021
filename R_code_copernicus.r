#visualizing copernicus data
#install library ncdf4
install.packages("ncdf4")
library(raster)
library(ncdf4)
#lettura dati
setwd("D:/lab/")
#dare un nome al dataset
albedo <- raster("albedo.nc") 
albedo
#facciamo il plot, il sistema non è RGB perchè è un singolo strato quindi usiamo la colorramppalette
cl <- colorRampPalette(c('light blue','green','red','yellow'))(100)
plot(albedo, col=cl)
#resampling=ricampionare e diminuire la dimensione dei pixel, è un ricampionamento bilineare
#estraggo da un pixel la media dei valori più grandi utilizzando la funzione fact, diminuisco linearmente
albedores <- aggregate(albedo, fact=100)
plot(albedores, col=cl)
