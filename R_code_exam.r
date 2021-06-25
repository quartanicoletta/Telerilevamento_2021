#R_code_exam.r
#Cambiamento della temperatura globale degli oceani e dei mari dal 2002 al 2021 (vedere ogni quanti anni)
#inserire le librerie necessarie
library(raster)
library(rasterVis)
library (RStoolbox)
library(gridExtra) 
#fare il set della working directory
setwd("D:/lab/AQUA")



#inserire le immagini, dare una color ramp palette e plottarle
#temp21 <- brick("temp2021.nc")
#plot(temp21)
#cls <- colorRampPalette(c("red","magenta","yellow"))(100)
#plot(temp21, col=cls)

#temp02 <- brick("temp2002.nc")
#plot(temp02)
#cls <- colorRampPalette(c("red","magenta","yellow"))(100)
#plot(temp02, col=cls)

#constatere le differenze di temperatura con con la funzione differenza e plottarle
#tempdif <- temp21 - temp02
#plot(tempdif, col= cls)


temp01 <- brick("temp2002.nc")
plotRGB(temp02, r=1, g=2, b=3, stretch="lin")
ggRGB(temp02, r=1, g=2, b=3, stretch="lin")
temp07 <- brick("temp2002.nc")
plotRGB(temp07, r=1, g=2, b=3, stretch="lin")
ggRGB(temp07, r=1, g=2, b=3, stretch="lin")
temp14 <- brick("temp2003.nc")
plotRGB(temp14, r=1, g=2, b=3, stretch="lin")
ggRGB(temp14, r=1, g=2, b=3, stretch="lin")
temp21 <- brick("temp2021.nc")
plotRGB(temp21, r=1, g=2, b=3, stretch="lin")
ggRGB(temp21, r=1, g=2, b=3, stretch="lin")


#per importare tutta la lista di files utilizzo lapply
tlist <- list.files(pattern="temp")
tlist
import <- lapply(tlist,raster)
TAq <- stack(import)
#plot per vedere tutte le immagini insieme
plot(TAq)
#immagini sovrapposte con schema RGB
plotRGB(TAq, 1, 2, 3, stretch="Lin")
#ggRGB(TAq, r=1, g=2, b=3, stretch="lin") # partendo da tre bande dell'immagine satellitare, possiamo unirle per creare un immagine a banda singola

levelplot(TAq)
cl <- colorRampPalette(c("blue","light blue","pink","red"))(100)
#assegno i nomi
levelplot(TAq,col.regions=cl, main="Variation of sea surface temperature",names.attr=c("2001","2007", "2014", "2021"))



























ES21 <- raster("EarthSurface2021.jpg")
cls <- colorRampPalette(c("red","blue","yellow"))(100)
plot(ES21, col=cls)

ES02 <- raster("EarthSurface2002.jpg")
cls <- colorRampPalette(c("red","blue","yellow"))(100)
plot(ES02, col=cls)

ESdif <- ES21 - ES02
plot(ESdif, col= cls)

par(mfrow=c(2,1))
plot(ES21, col=cls, main:"Temperature in 2021")
plot(ES02, col=cls, main:"Temperature in 2002")

par (mfrow=c(2,1))

plot(ES21$EarthSurface2021.jpg, col=cls)
plot(ES02$EarthSurface2002.jpg, col=cls)
