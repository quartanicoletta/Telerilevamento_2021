# il mio primo codice in R per il telerilevamento!
#importo la cartella dal mio sitema operativo 
setwd("D:/lab/") # Windows
#install.packages("raster")
library(raster)
# la funzione brick genera file multistrato o bande
p224r63_2011 <- brick("p224r63_2011_masked.grd")
p224r63_2011
plot(p224r63_2011)
#plottaggio singole bande, così da ottenere le info su ogni banda
#colour ramp palette è un vettore che ci permette di assegnare una tavolozza di colori per il file
cl <- colorRampPalette(c("black","grey","light grey"))(100)
#fare plot della nuova immagine
plot(p224r63_2011, col=cl)
#colour change-> new
cls <- colorRampPalette(c("magenta","red","yellow","green","orange"))(100)
plot(p224r63_2011, col=cls)
# Bande Landsat 
#B1 Blue
#B2 Green
#B3 Red
#B4 NIR
#B5 SWIR
#B6 TIRS
#B7 SWIR
# will clean the current graph
dev.off()
#$ comando per legare immagine a una banda
plot(p224r63_2011$B1_sre)
# plot band 1 with a predefined colut ramp palette
cls <- colorRampPalette(c("magenta","red","yellow","green","orange"))(100)
plot(p224r63_2011$B1_sre, col=cls)
#par= settare dei parametri grafici di più grafici da allegare mf=multiframe mfrow=su righe mfcol= su colonne
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)
par(mfrow=c(1,2))
#plottare le prime 4 bande di landsat
par(mfrow=c(4,1))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)
plot(p224r63_2011$B3_sre)
plot(p224r63_2011$B4_sre)
#due righe due colonne
par(mfrow=c(2,2))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)
plot(p224r63_2011$B3_sre)
plot(p224r63_2011$B4_sre)
#per ogni banda una color ramp palette che mi richiami ogni banda
par(mfrow=c(2,2))
clb <- colorRampPalette(c("dark blue","blue","light blue"))(100)
plot(p224r63_2011$B1_sre, col=clb)
clg <- colorRampPalette(c("dark green","green","light green"))(100)
plot(p224r63_2011$B1_sre, col=clg)
clr <- colorRampPalette(c("dark red","red","light pink"))(100)
plot(p224r63_2011$B1_sre, col=clr)
clnir <- colorRampPalette(c("red","orange","yellow"))(100)
plot(p224r63_2011$B1_sre, col=clnir)
#visualizing data by RGB plotting
library(raster)
setwd("D:/lab/")
p224r63_2011 <- brick("p224r63_2011_masked.grd")
# Bande Landsat 
#B1 Blue
#B2 Green
#B3 Red
#B4 NIR
#B5 SWIR
#B6 TIRS
#B7 SWIR
#schema RGB utilizza il plot per unire 3 bande per costruire un'immagine con i colori naturali
plotRGB(p224r63_2011,r=3,g=2,b=1,stretch="Lin")
#aggiunta del Nir eliminando una delle bande già presenti, aggiungi 4 elimini 1
plotRGB(p224r63_2011,r=4,g=3,b=2,stretch="Lin")
#si possono fare ulteriori inversioni spostando le bande su diversi componenti
plotRGB(p224r63_2011,r=3,g=4,b=2,stretch="Lin")
plotRGB(p224r63_2011,r=3,g=2,b=4,stretch="Lin")
#ex MF 2x2
par(mfrow=c(2,2))
plotRGB(p224r63_2011,r=3,g=2,b=1,stretch="Lin")
plotRGB(p224r63_2011,r=4,g=3,b=2,stretch="Lin")
plotRGB(p224r63_2011,r=3,g=4,b=2,stretch="Lin")
plotRGB(p224r63_2011,r=3,g=2,b=4,stretch="Lin")
#creare pdf dell'immagine caricata su R
pdf("il_mio_primo_pdf_con_R.pdf")
par(mfrow=c(2,2))
plotRGB(p224r63_2011,r=3,g=2,b=1,stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011,r=3,g=4,b=2,stretch="Lin")
plotRGB(p224r63_2011,r=3,g=2,b=4,stretch="Lin")
dev.off()
# immagine con Histogram stretch=hist
plotRGB(p224r63_2011,r=3,g=4,b=2,stretch="Lin")
plotRGB(p224r63_2011,r=3,g=4,b=2,stretch="hist")
#funzione par con colori naturali, falsi colori, e falsi histogram stretch
par(mfrow=c(3,1))
plotRGB(p224r63_2011,r=3,g=2,b=1,stretch="Lin")
plotRGB(p224r63_2011,r=3,g=4,b=2,stretch="Lin")
plotRGB(p224r63_2011,r=3,g=4,b=2,stretch="hist")
#colorist= plot nello spazio e nel tempo nel sistema RGB
#installare install.packages("RStoolbox")
#library(RStoolbox)
#da oggi si utilizzerà il file p224r63_1988_masked
library(raster)
setwd("D:/lab/")
p224r63_2011 <- brick("p224r63_2011_masked.grd")
#per vedere le particolarità dell'immagine satellitare inserisco p224r63_2011 su R
#ora inseriamo anche p224r63_1988
#multitemporal set
p224r63_1988 <- brick("p224r63_1988_masked.grd")
#facciamo il plot di p224r63_1988 per visualizzare ogni banda
plot(p224r63_1988)
# Bande Landsat per RGB
#B1 Blue
#B2 Green
#B3 Red
#B4 NIR
#B5 SWIR
#B6 TIRS
#B7 SWIR
plotRGB(p224r63_1988, r=3, g=2, b=1, stretch="Lin")
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin") #Plot con infrarosso
#fare par con 1988 e 2011
par(mfrow=c(2,1))
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
par(mfrow=c(2,2))
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="hist")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="hist")
#creare pdf dell'immagine caricata su R
pdf("confronto_p224r63_1988_p224r63_2011.pdf")
par(mfrow=c(2,2))
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="hist")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="hist")
dev.off()
