#R_code_spectral_signatures.r

#importiamo i pacchetti necessari

library(raster)
library(rgdal)
library(ggplot2)

#fare il set della working directory

setwd("D:/lab/")

#carichiamo il dataset

defor2 <- brick("defor2.jpg") 

#segue un plot e inseriamo le bande che ci interessano, NIR, red, green

plotRGB(defor2, 1,2,3, stretch="Lin") #possiamo farlo anche con HIST

#utilizziamo l'immagine per ottenere delle firme spettrali con la funzione click(cliccando sulla mappa otterremo le info sulla riflettanza)

click(defor2, id=T, xy=T, cell=T, type="p", pch=16, col="magenta") 

#cliccando sulla mappa su una zona con vegetazione otteniamo  x     y   cell defor2.1 defor2.2 defor2.3
1 131.5 245.5 166476      187        9       21 con riflettanza molto bassa nel rosso
#se clicchiamo dove c'è un corso d'acqua otteniamo x     y   cell defor2.1 defor2.2 defor2.3
1 191.5 177.5 215292       59       52       83 notiamo una riflettanza molto bassa in NIR ma molto alta in rosso e blu

#creiamo un dataframe e con ggplot2 creiamo le firme spettrali
#definiamo le colonne del dataset
band <- c(1,2,3)
forest <- c(187, 9, 19)
water <- c(59, 52, 83)

#mettiamo tutto insieme nel creare il dataframe

output <- data.frame(band,forest,water)

#possiamo ora fare il plot con ggplot2

ggplot(output, aes(x=band)) + 
    geom_line(aes(y = forest), color = "green")+
    geom_line(aes(y = water), color = "blue", linetype = "dotted")+
    labs(x="wavelength", y="reflectance")
    
#analisi multitemporale
#utilizziamo defor1

defor1 <- brick("defor1.jpg")

plotRGB(defor1, 1,2,3, stretch="Lin")

#firme spettrali defor1

click(defor1, id=T, xy=T, cell=T, type="p", pch=16, col="magenta")

click(defor2, id=T, xy=T, cell=T, type="p", pch=16, col="magenta")

#creiamo il dataset 




