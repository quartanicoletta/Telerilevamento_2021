# il mio primo codice in R per il telerilevamento!
setwd("D:/lab/") # Windows
#install.packages("raster")
library(raster)
p224r63_2011 <- brick("p224r63_2011_masked.grd
p224r63_2011
plot(p224r63_2011)
#plottaggio singole bande
#colour change
cl <- colorRampPalette(c("black","grey","light grey"))(100)
#fare plot della nuova immagine
plot(p224r63_2011, col=cl)
#colour change-> new
cl <- colorRampPalette(c("magenta","red","yellow","green","orange"))(100)
plot(p224r63_2011, col=cl)
