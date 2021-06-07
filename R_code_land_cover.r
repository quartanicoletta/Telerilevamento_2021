#R_code_land_cover.r
#importiamo le librerie e  il set della working directory
library(raster)
library(RStoolbox)
#install.packages("ggplot2")
library(ggplot2)
# install.packages("gridExtra")
library(gridExtra) 

stewd("D:/lab/")
defor1 <- brick ("defor1.jpg")
plotRGB (defor1, r=1, g=2, b=3, stretch="lin")
ggRGB(defor1, r=1, g=2, b=3, stretch="lin") # partendo da tre bande dell'immagine satellitare, possiamo unirle per creare un immagine a banda singola

defor2 <- brick ("defor2.jpg")
plotRGB (defor2, r=1, g=2, b=3, stretch="lin")
ggRGB(defor2, r=1, g=2, b=3, stretch="lin")

par(mfrow=c(1,2)) 
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")

# con gridExtra possiamo utulizzare ggplot per dati raster e utlizziamo la funzione grid.Arrange e mette insieme i pezzi in un grafico, denominiamo i due plot e li mettiamo insieme
p1 <- ggRGB(defor1, r=1, g=2, b=3, stretch="lin")
p2 <- ggRGB(defor2, r=1, g=2, b=3, stretch="lin")
grid.arrange(p1, p2, nrow=2) #così possiamo arrangiare ogni tipo di griglia
