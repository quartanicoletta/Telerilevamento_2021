#R_code_exam.r
#Cambiamento della temperatura globale degli oceani e dei mari dal 2002 al 2021 (vedere ogni quanti anni)
#inserire le librerie necessarie
library(raster)
library(rasterVis)
library (RStoolbox)
library(gridExtra) 
library(ggplot2)
library(viridis) 
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


temp02 <- brick("temp2002.nc")
plot(temp02)
cls <- colorRampPalette(c("red","magenta","yellow"))(100)
plot(temp02, col=cls)
plotRGB(temp02, r=1, g=2, b=3, stretch="lin")

temp07 <- brick("temp2007.nc")
plot(temp07)
cls <- colorRampPalette(c("red","magenta","yellow"))(100)
plot(temp07, col=cls)
plotRGB(temp07, r=1, g=2, b=3, stretch="lin")

temp14 <- brick("temp2014.nc")
plot(temp14)
cls <- colorRampPalette(c("red","magenta","yellow"))(100)
plot14(temp14, col=cls)
plotRGB(temp14, r=1, g=2, b=3, stretch="lin")

temp21 <- brick("temp2021.nc")
plot(temp21)
cls <- colorRampPalette(c("red","magenta","yellow"))(100)
plot(temp21, col=cls)
plotRGB(temp21, r=1, g=2, b=3, stretch="lin")


par(mfrow=c(4,1))
plot(temp02, col=cls)
plot(temp07, col=cls)
plot(temp14, col=cls)
plot(temp21, col=cls)



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

#utilizziamo un intero blocco con una singola legenda e plottiamo tutto insieme
levelplot(TAq)
cl <- colorRampPalette(c("blue","light blue","pink","red"))(100)
#assegno i nomi
levelplot(TAq,col.regions=cl, main="Variation of sea surface temperature",names.attr=c("2001","2007", "2014", "2021"))

annuallist <- list.files(pattern="temp")
annual_import <- lapply(annuallist,raster)
#raggruppo i file importati
annual <- stack(annual_import)
annual
#posso fare un level plot solo ora con dati melt
levelplot(annual)


TAqaggr<- aggregate(TAq, fact=10)
plotRGB(TAqaggr, r=4, g=3, b=2, stretch="lin")
TAqaggrPCA <- rasterPCA(TAqaggr)
summary(TAqaggrPCA$model)
plot(TAqaggrPCA$map)
TAqaggrPCA
plotRGB(TAqaggrPCA$map, r=1,g=2,b=3, stretch="lin")
str(TAqaggrPCA)

#calcolo della deviazione standard
#per l'analisi controlliamo le componenti della mappa all'interno di sent, e leghiamo il tutto alla prima variabile PC1

pc1 <- TAqaggrPCA$map$PC1
pc1sd5 <- focal(pc1, w=matrix(1/25, nrow=5, ncol=5), fun=sd)
clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100)
plot(pc1sd5, col=clsd)

#rappresentiamo graficamente i dati con funzione ggplot

t1 <- ggplot() +
geom_raster(pc1sd5, mapping = aes(x = x, y = y, fill = layer)) +
scale_fill_viridis(option = "magma")  +
ggtitle("Standard deviation of PC1 by magma colour scale")

t2 <- ggplot() +
geom_raster(pc1sd5, mapping = aes(x = x, y = y, fill = layer)) +
scale_fill_viridis(option = "turbo")  +
ggtitle("Standard deviation of PC1 by turbo colour scale")

t3 <- ggplot() +
geom_raster(pc1sd5, mapping = aes(x = x, y = y, fill = layer)) +
scale_fill_viridis(option = "mako")  +
ggtitle("Standard deviation of PC1 by magma colour scale")

t4 <- ggplot() +
geom_raster(pc1sd5, mapping = aes(x = x, y = y, fill = layer)) +
scale_fill_viridis(option = "inferno")  +
ggtitle("Standard deviation of PC1 by turbo colour scale")
grid.arrange(p1, p2, p3, p4, nrow = 2)
























