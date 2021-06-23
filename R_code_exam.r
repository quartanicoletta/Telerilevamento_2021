 library(raster)
library(RStoolbox)

setwd("D:/lab/AQUA")

temp21 <- brick("temp2021.nc")
plot(temp21)
cls <- colorRampPalette(c("red","magenta","yellow"))(100)
plot(temp21, col=cls)

temp02 <- brick("temp2002.nc")
plot(temp02)
cls <- colorRampPalette(c("red","magenta","yellow"))(100)
plot(temp02, col=cls)

tempdif <- temp21 - temp02
plot(tempdif, col= cls)


























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
