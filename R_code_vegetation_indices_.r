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
