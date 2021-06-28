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

#differenza tra marzo e gennaio
ENdif <- EN13 - EN1

plot(ENdif, col= cls)

#6. Plottare tutto insieme:

par(mfrow=c(3,1))
plot(EN1, col=cls, main="NO2 in January")
plot(EN13, col=cls, main="NO2 in March")
plot(ENdif, col=cls, main="Difference (March - January)")

#7.  Importare tutte le immagini di un intero set:

rlist <- list.files(pattern="EN") #per importare interi set come lista
rlist

import <- lapply (rlist,raster)
import #abbiamo tutti i singoli layer importati dalla lista grazie alla funzione raster

EN <- stack(import) #abbiamo compattato tutti i file con la funzione stack
plot (EN, col=cls)

#8. Replicare il plot dell'immagine 1 e 13, usando stack

par (mfrow=c(2,1)) #lego il dataset alle singole bande

plot(EN$EN_0001, col=cls)
plot(EN$EN_0013, col=cls)

#9. Analisi multivariata, effettuare una PCA sulle 13 immagni, tramite stack

ENpca <- rasterPCA(EN) #la funzione dell'intero blocco stack
summary(ENpca$model)

dev.off()
plotRGB(ENpca$map, r=1, g=2, b=3, stretch="lin") #capiamo che la maggior parte dell'informazione è nel red

#10. calcolare la variabilità nella prima ed ultima immagine, della prima variabile di PCA

PC1sd <- focal(ENpca$map$PC1, w=matrix(1/9, nrow=3, ncol=3), fun=sd) #mantengo i nomi delle componenti principali, come per il valore di PC1

plot(PC1sd, col=cls) #la dev. standard aumenta sulle linee di confine




