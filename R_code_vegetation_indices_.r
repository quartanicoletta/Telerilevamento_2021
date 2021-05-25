#R_code_vegetation_indices_r.
#importiamo le librerie e  il set della working directory
library(raster)
stewd("D:/lab/")
#con funzione brick importiamo le immagini defor
defor1 <- brick("defor1.jpg")
defor2 <- brick("defor2.jpg")
#plottiamo con plotRGB
par(mfrow=c(2,1))
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")

#importiamo le librerie e  il set della working directory
library(raster) 
#require (raster) ha le stesse funzioni di library e può essere usata allo stesso modo
stewd("D:/lab/")
#carichiamo le immagini necessarie
defor1 <- brick("defor1.jpg")
defor2 <- brick("defor2.jpg")
#riplottiamo le medesime immagini
par(mfrow=c(2,1))
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")
#calcoliamo un indice di vegetazione,facendo la differenza tra le bande del NIR e red del defor1, uniamo la banda all'immagine con $
#per ogni pixel abbiamo preso la banda del NIR  e del red, medesimo pixel per le stesse bande, fatto la differenza ottenendo la diffrence vegetation index
dvi1 <- defor1$defor1.1 - defor1$defor1.2 
#facendo il plot otteniamo un'immagine più pulita facendo prima il dev.off()
plot(dvi1)
#facciamo una color ramp palette per ottenere una classificazione migliore nel nostro plot
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) 
plot(dv1, col=cl, main="DVI at time 1")
#facciamo la stessa cosa per il calcolo del DVI2
dvi2 <- defor2$defor2.1 - defor2$defor2.2
plot(dvi2, col=cl, main="DVI at time 2")
#vediamo ora i due dvi plottandoli insieme con la funzione par
par(mfrow=c(2,1))
plot(dvi1, col=cl, main="DVI at time 1")
plot(dvi2, col=cl, main="DVI at time 2")
#abbiamo quindi i due indici e cogliamo le forti differenze nella medesima zone in tempi diversi facendo la differenza tra i due dvi
difdvi <- dvi1 - dvi2
#visualizziamo con il plot cambiando la colorramppalette facendo un dev.off() per visualizzarla meglio
dev.off()
cld <- colorRampPalette(c('blue','white','red'))(100) 
plot(difdvi, col=cld)
#calcoliamo l'NDVI1 facendo un rapporto, facendo così una standardizzazione sulla loro somma, mettiamo le parentesi per evitare errori algebrici : (NIR-RED) / (NIR+RED)
ndvi1 <- (defor1$defor1.1 - defor1$defor1.2) / (defor1$defor1.1 + defor1$defor1.2)
plot(ndvi1, col=cl)
#possiamo utilizzare direttamente dvi1 perchè abbiamo già il calcolo della sottrazione ottenendo così la medesima immagine
#ndvi1 <- dvi1 / (defor1$defor1.1 + defor1$defor1.2)
# plot(ndvi1, col=cl)
