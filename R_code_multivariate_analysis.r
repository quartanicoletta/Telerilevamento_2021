#R_code_multivariate_analysis.r
library(raster)
setwd("D:/lab/") 
p224r63_2011 <-brick ("p224r63_2011_masked.grd")
p224r63_2011
plot (p224r63_2011) #verranno visualizzate tutte le bande da B1 a  B7
#Facciamo il plot della B1 contro B2, cambiando colore, PCH aumentando la dimensione dei punti
plot(p224r63_2011$B1_sre,p224r63_2011$B2_sre, col="red", pch=19, cex=2)
#invertiamo le due bande
plot(p224r63_2011$B2_sre,p224r63_2011$B1_sre, col="red", pch=19, cex=2)
 #con la funzione pairs possiamo plottare tutte le correlazioni possibili di una serie di variabili di un dataset a due a due
pairs(p224r63_2011)
#varranno visualizzate anche gli indici di correlazione dove più le bande sono correlate più le dimensioni dei caratteri è maggiore
