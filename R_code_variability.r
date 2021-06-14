#R_code_variability.r
#inserire le librerie necessarie

library(raster)
library(RStoolbox)

#fare il set della working directory
setwd("D:/lab/")

#importiamo l'immagine
sent <- brick("sentinel.png")
