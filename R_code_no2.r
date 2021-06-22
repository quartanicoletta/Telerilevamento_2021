#R code no2.r

#1. Facciamo il set della working directory:

setwd("D:/lab/EN")

#2. Importiamo i dati con funzione raster, quindi carichiamo il pacchetto:

library(raster)

#3. Ora importiamo la prima immagine, per singola banda:

EN1 <- raster("EN_0001.png")

#3. Fare il plot dell'immagine importata, utilizzando la palette di colori preferita:

cls <- colorRampPalette(c("pink","blue","yellow"))(100)

plot(EN1, col= cls) #il giallo evidenzia le zone con NO2 più alto nel mese di gennaio

#4. Importiamo l'ultima immagine e la plottiamo:

EN13 <- raster("EN_0013.png")

cls <- colorRampPalette(c("pink","blue","yellow"))(100)

plot(EN13, col=cls)

#5. Evidenziare le differenze tra i due plot:

ENdif <- EN1 - EN13

plot(ENdif, col= cls)

#6. Plottare tutto insieme:

par(mfrow=c(3,1))
plot(EN1, col=cls, main:"NO2 in January")
plot(EN13, col=cls, main:"NO2 in March")
plot(ENdif, col=cls, main:"Difference (January - March)")



