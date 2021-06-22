#R code no2.r

#1. Facciamo il set della working directory:

setwd("D:/lab/EN")

#2. Importiamo i dati con funzione raster, quindi carichiamo il pacchetto:

library(raster)
library(RStoolbox) #per l'analisi multivariata

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

#7.  Importare tutte le immagini:

rlist <- list.files(pattern="EN") #per importare interi set
rlist

import <- lapply (rlist,ratser)
import

EN <- stack(import)
plot (EN, col=cls)

#8. Replicare il plot dell'immagine 1 e 13, usando stack

par (mfrow=c(2,1))

plot(EN$EN_0001, col=cls)
plot(EN$EN_0013, col=cls)

#9. Effettuare una PCA sulle 13 immagni, tramite stack

ENpca <- rasterPCA(EN)
summary(ENpca$model)

dev.off()
plotRGB(ENpca$map, r=1, g=2, b=3, stretch="lin")

#10. calcolare la variabilità nella prima ed ultima immagine, della prima variabile di PCA

PC1sd <- focal(ENpca$map$PC1, w=matrix(1/9, nrow=3, ncol=3), fun=sd)

plot(PC1sd, col=cls)




