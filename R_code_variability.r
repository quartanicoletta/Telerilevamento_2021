#R_code_variability.r
#inserire le librerie necessarie

library(raster)
library(RStoolbox)

#fare il set della working directory
setwd("D:/lab/")

#importiamo l'immagine con funzione brick e la rinominiamo
sent <- brick("sentinel.png")

#segue un plottaggio RGB
plotRGB(sent, stretch="lin") 
# r=1, g=2, b=3 (standard in rgb)
#plotRGB(sent, r=1, g=2, b=3, stretch="lin")
# NIR 1, RED 2, GREEN 3 (la sequenza che noi vogliamo utilizzare)
#se cambiamo l'ordine otteniamo un'immagine evidenziata diversamente
plotRGB(sent, r=2, g=1, b=3, stretch="lin") 

#per il calcolo della dev.standard utilizziamo una sola banda, maggiore sarà la variabilità, maggiore sarà la dev.standard
#con la finestra mobile calcoliamo la dev.standard dell'area di pixel da noi selezionata, noi siamo liberi di spostarla riportando i valori sul pixel centrale
nir <- sent$sentinel.1
red <- sent$sentinel.2

#creiamo il singolo strato per il calcolo della dev.standard calcolando l'indice di vegetazione
ndvi <- (nir-red) / (nir+red)
plot(ndvi)
cl <- colorRampPalette(c('black','white','red','magenta','green'))(100)
plot(ndvi,col=cl)

#calcoliamo la dev.standard dell'immagine, utilizziamo la funzione focal, che calcolerà il tutto tramite la moving window
ndvisd3 <- focal(ndvi, w=matrix(1/9, nrow=3, ncol=3), fun=sd)
plot(ndvisd3)

#cambiamo la colorramppalette
clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100)
plot(ndvisd3, col=clsd)
#notiamo che là dove il colore tende al rosso e al giallo la dev.standard è più alta, dove invece è verde e blu più bassa

#calcoliamo la media dell'ndvi con funzione "mean" della dev.standard
ndvimean3 <- focal(ndvi, w=matrix(1/9, nrow=3, ncol=3), fun=mean)
clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100) 
plot(ndvimean3, col=clsd)

#cambiamo la grandezza della moving window cambiando il numero di pixel da selezionare, il calcolo potrebbe richiadere più tempo
ndvisd13 <- focal(ndvi, w=matrix(1/169, nrow=13, ncol=13), fun=sd)
clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100)
plot(ndvisd13, col=clsd)
ndvisd5 <- focal(ndvi, w=matrix(1/25, nrow=5, ncol=5), fun=sd)
clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100)
plot(ndvisd5, col=clsd)

#altra tecnica per compattare i dati è quella del calcolo del PCA, con rasterPCA, dell'immagine iniziale
sentpca <- rasterPCA(sent) 
plot(sentpca$map)
#nelle quattro immagini notiamo il cambiamento da un componente ad un altro, con una notevole perdita di info riscontrata nell'immagine 4

#vediamo la proporzione di variabilità del modello di ogni singola componente, dove la prima contiene il 67.36804% dell'informazione originale
summary(sentpca$model)

