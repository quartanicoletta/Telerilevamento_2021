# il mio primo codice in R per il telerilevamento!
setwd("D:/lab/") # Windows
#install.packages("raster")
library(raster)
p224r63_2011 <- brick("p224r63_2011_masked.grd")
p224r63_2011
plot(p224r63_2011)
#plottaggio singole bande
#colour change
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
#$ comando peer legare immagine a una banda
plot(p224r63_2011$B1_sre)
# plot band 1 with a predefined colut ramp palette
cls <- colorRampPalette(c("magenta","red","yellow","green","orange"))(100)
plot(p224r63_2011$B1_sre, col=cls)
#par= settare dei parametri grafici di più grafici da allegare mf=multiframe mfrow=su righe
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)
par(mfrow=c(1,2))
# se usi prima le colonne usi mfcol
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
