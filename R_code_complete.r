#R code complete-Telerilevamento Geo-Ecologico

#--------------------------------------------------------------------------

#Summary:

#1. Remote sensing- first code
#2. R code time series
#3. R code copernicus data
#4. R code Knitr
#5. R code multivariate analisys
#6. R code solar classification
#7. R code ggplot2
#8. R code vegetation indices
#9. R code land cover
#10. R code variability

#--------------------------------------------------------------------------

#1. Remote sensing- first code:

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


#--------------------------------------------------------------------------

#2. R code time series:

# Time series analysis
# Greenland increase of temperature
# Data and code from Emanuela Cosma
library(raster)
library(rasterVis)
setwd("D:/lab/greenland")
#carichiamo il primo dei file del set, sono singoli dati. Non si usa brick ma raster
#raster:carichiamo singoli dati, importiamo il primo
lst_2000 <- raster("lst_2000.tif")
#possiamo plottarlo
plot(lst_2000)
#procediamo con il file successivo
lst_2005 <- raster("lst_2005.tif")
plot(lst_2005)
#anche gli ultimi due
lst_2010 <- raster("lst_2010.tif")
lst_2015 <- raster("lst_2015.tif")
#mettiamo insieme i plot
par(mfrow=c(2,2))
plot(lst_2000)
plot(lst_2005)
plot(lst_2010)
plot(lst_2015)
#vogliamo importare i file tutti insieme invece di usare raster e importarli uno per volta, usiamo quindi lapply
#lapply: applicare la funzione raster a una lista di file (rlist), nel nostro caso i file lst
#la list.files: crea la lista che R utilizzerà per applicare la funzione lapply
list.files()
#con pattern ricerchiamo i file che ci servono in base alle caratteristiche comuni nel nome,come il fatto che tutti si chiamano lst
rlist <- list.files(pattern="lst")
rlist
#lapply: x=lista dove applicare la funzione FUN= funzione raster da applicare (il tutto si applica a tutti i file lst)
import <- lapply(rlist,raster)
import
#ora possiamo creare un unico pacchetto di file con tutti quelli importati, lo facciamo con la funzione stack
#stack function: abbiamo una lista di file raster e li mettiamo tutti insieme
TGr <- stack(import) 
#ci servirà per ottenere il plot di tutti i file insieme
plot(TGr)
#immagini sovrapposte con schema RGB
plotRGB(TGr, 1, 2, 3, stretch="Lin")
plotRGB(TGr, 2, 3, 4, stretch="Lin") #plot con valori della temperatura
#installazione pacchetto metodi di visualizzazione per dati raster
install.packages("rasterVis") 
library(rasterVis)
setwd("D:/lab/greenland")
rlist <- list.files(pattern="lst")
rlist
import <- lapply(rlist,raster)
import
TGr <- stack(import)
TGr
# levelplots R package: utilizziamo un intero blocco con una singola legenda e plottiamo tutto insieme
levelplot(TGr)
cl <- colorRampPalette(c("blue","light blue","pink","red"))(100)
#poi riplottare
levelplot(TGr, col.regions=cl)
#possiamo cambiare i titoli delle immagini con la funzione names.attr (per nominare i singoli attributi)
#main è l'argomento, quindi nel nostro caso il titolo dellla mappa, messo tra virgolette perchè un testo
levelplot(TGr,col.regions=cl, main="LST variation in time",names.attr=c("July 2000","July 2005", "July 2010", "July 2015"))
#dati melt, creiamo una lista dei file con pattern comune "melt" o "annual"
meltlist <- list.files(pattern="melt")
#importo i file
melt_import <- lapply(meltlist,raster)
#raggruppo i file importati
melt <- stack(melt_import)
melt
#posso fare un level plot solo ora con dati melt
levelplot(melt)
#valori più alti >scioglimento
#metricsalgebra applicato alle matrici per lo studio di dati temporali, facciamo la sottrazione tra primo e ultimo dato, mettiamo $ per legare uno strato all'altro
melt_amount <- melt$X2007annual_melt - melt$X1979annual_melt
#creo una nuova colorramppalette
clb <- colorRampPalette(c("blue","white","red"))(100)
#sia plot che levelplot
plot(melt_amount, col=clb)
levelplot(melt_amount, col.regions=clb)

#--------------------------------------------------------------------------

#3. R code copernicus data:

#visualizing copernicus data
#install library ncdf4
install.packages("ncdf4")
library(raster)
library(ncdf4)
#lettura dati
setwd("D:/lab/")
#dare un nome al dataset
albedo <- raster("albedo.nc") 
albedo
#facciamo il plot, il sistema non è RGB perchè è un singolo strato quindi usiamo la colorramppalette
cl <- colorRampPalette(c('light blue','green','red','yellow'))(100)
plot(albedo, col=cl)
#resampling=ricampionare e diminuire la dimensione dei pixel, è un ricampionamento bilineare
#estraggo da un pixel la media dei valori più grandi utilizzando la funzione fact, diminuisco linearmente
albedores <- aggregate(albedo, fact=100)
plot(albedores, col=cl)


#--------------------------------------------------------------------------

#4. R code Knitr:

#codice knitr
install.packages("knitr")
install.packages("RStoolbox")
setwd("D:/lab/")
library(knitr)

#--------------------------------------------------------------------------

5. R code multivariate analisys:

#R_code_multivariate_analysis.r
library(raster)
library (RStoolbox)
setwd("D:/lab/") 
#con brick carico un pacchetto di dati che importo dal sistema operativo 
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

#PCA ANALISI IMPATTANTE quindi si ricampiona il dato in modo che sia più leggero con la funzione Aggregate, cambiamo quindi la risoluzione iniziale 
#richiamare le librerie e cartelle di riferimento
library(raster)
library (RStoolbox)
setwd("D:/lab/")
p224r63_2011 <-brick ("p224r63_2011_masked.grd")
#aggregate: resampling o ricampionamento, aggreghiamo le celle, il fact è il fattore di ingrandimento del pixel, fun serve ad aggregare i valori 
p224r63_2011res <- aggregate(p224r63_2011, fact=10)
#facciamo il plot per visualizzare l'immagine e li mettiamo a confronto
par(mfrow=c(2,1))
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="lin")
plotRGB(p224r63_2011res, r=4, g=3, b=2, stretch="lin")
#la funzione per fare la PCA, dove prendiamo i dati originali e facciamo passare un asse per i dati di variabilità maggiore e uno per il minore
#rasterPCA prende il pacchetto di dati e lo compatta in un numero minore di bande
p224r63_2011res_pca <- rasterPCA(p224r63_2011res)
#vediamo la varianza utilizzando la funzione summary, che è molto generica e base,dà un sommario del nostro modello
summary(p224r63_2011res_pca$model) #così vediamo la varianza nelle varie bande
#con plot, prendo l'immagine modello la unisco alla mappa
plot(p224r63_2011res_pca$map)
p224r63_2011res_pca
#plottiamo quindi in rgb tutta l'immagine
plotRGB(p224r63_2011res_pca$map, r=1,g=2,b=3, stretch="lin") #vediamo un'immagine che utilizza tutte e tre le componenti principali
#per ottenere informazioni più complesse del file utilizzo la funzione str (structure)
str(p224r63_2011res_pca)

#--------------------------------------------------------------------------

6. R code solar classification:

#R code classification 
#codice per classificare immagini
library(raster)
library(RStoolbox)
setwd("D:/lab/")
#caricare immagine solar orbiter data con funzione brick
so <- brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")
#visualizziamo i dettagli
so
#visualizziamo i livelli RGB
plotRGB(so, 1,2,3, stretch="lin")
#classifichiamo le immagini con la funzione nel pacchetto RStoolbox 
#funzione che opera la classificazione non supervisionata (unsupervised classification)= unsuperClass
#nClasses è il numero di classi, la associamo a un oggetto soc
soc <- unsuperClass(so, nClasses=3)
#plottiamo l'immagine per vedere cosa è stato creato in uscita
#ciò che plottiamo è la mappa, una parte dell'immagine, soc legandolo con $ a map
plot(soc$map)
# funzione che fa in modo di utilizzare le stesse regole nei lavori= set.seed(42)
#classificazione con 20 classi
set.seed(42)
sod <- unsuperClass(so, nClasses=20)
plot(sod$map)
#nuova immagine
sun <- brick("The_Sun_viewed_by_Solar_Orbiter_s_PHI_instrument_on_18_June_2020.png")
sunc <- unsuperClass(sun, nClasses=20)
plot(sunc$map)
#classificazione immagni grand canyon data 
library(raster)
library(RStoolbox)
setwd("D:/lab/")
#caricare immagine RGB 
gc <- brick("dolansprings_oli_2013088_canyon_lrg.jpg")
#visualizziamo l'immagine
plotRGB(gc, r=1,g=2,b=3, stretch="lin")
#cambiamo il tipo di stretch in histogram
plotRGB(gc, r=1,g=2,b=3, stretch="hist")
#utilizziamo la classificazione del pacchetto
gcc <- unsuperClass(gc, nClasses=3)
#fare il plot dell'immagine
plot(gcc$map)
#facciamo la classificazione in 4 classi
gcc4 <- unsuperClass(gc, nClasses=4)
plot(gcc4$map)

#--------------------------------------------------------------------------

7. R code ggplot2:

library(raster)
library(RStoolbox)
library(ggplot2)
library(gridExtra)

setwd("~/lab/")

p224r63 <- brick("p224r63_2011_masked.grd")

ggRGB(p224r63,3,2,1, stretch="lin")
ggRGB(p224r63,4,3,2, stretch="lin")

p1 <- ggRGB(p224r63,3,2,1, stretch="lin")
p2 <- ggRGB(p224r63,4,3,2, stretch="lin")

grid.arrange(p1, p2, nrow = 2) # this needs gridExtra

#--------------------------------------------------------------------------

#8. R code vegetation indices:

#R_code_vegetation_indices_r.
#importiamo le librerie e  il set della working directory
library(raster)
library(RStoolbox)
stewd("D:/lab/")
#con funzione brick importiamo le immagini defor
defor1 <- brick("defor1.jpg")
defor2 <- brick("defor2.jpg")
#plottiamo con plotRGB
par(mfrow=c(2,1))
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")

#importiamo le librerie e  il set della working directory
library(raster) 
#require (raster) ha le stesse funzioni di library e può essere usata allo stesso modo
stewd("D:/lab/")
#carichiamo le immagini necessarie
defor1 <- brick("defor1.jpg")
defor2 <- brick("defor2.jpg")
#riplottiamo le medesime immagini
par(mfrow=c(2,1))
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")
#calcoliamo un indice di vegetazione,facendo la differenza tra le bande del NIR e red del defor1, uniamo la banda all'immagine con $
#per ogni pixel abbiamo preso la banda del NIR  e del red, medesimo pixel per le stesse bande, fatto la differenza ottenendo la diffrence vegetation index
dvi1 <- defor1$defor1.1 - defor1$defor1.2 
#facendo il plot otteniamo un'immagine più pulita facendo prima il dev.off()
plot(dvi1)
#facciamo una color ramp palette per ottenere una classificazione migliore nel nostro plot
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) 
plot(dv1, col=cl, main="DVI at time 1")
#facciamo la stessa cosa per il calcolo del DVI2
dvi2 <- defor2$defor2.1 - defor2$defor2.2
plot(dvi2, col=cl, main="DVI at time 2")
#vediamo ora i due dvi plottandoli insieme con la funzione par
par(mfrow=c(2,1))
plot(dvi1, col=cl, main="DVI at time 1")
plot(dvi2, col=cl, main="DVI at time 2")
#abbiamo quindi i due indici e cogliamo le forti differenze nella medesima zone in tempi diversi facendo la differenza tra i due dvi
difdvi <- dvi1 - dvi2
#visualizziamo con il plot cambiando la colorramppalette facendo un dev.off() per visualizzarla meglio
dev.off()
cld <- colorRampPalette(c('blue','white','red'))(100) 
plot(difdvi, col=cld)
#calcoliamo l'NDVI1 facendo un rapporto, facendo così una standardizzazione sulla loro somma, mettiamo le parentesi per evitare errori algebrici : (NIR-RED) / (NIR+RED)
ndvi1 <- (defor1$defor1.1 - defor1$defor1.2) / (defor1$defor1.1 + defor1$defor1.2)
plot(ndvi1, col=cl)
#possiamo utilizzare direttamente dvi1 perchè abbiamo già il calcolo della sottrazione ottenendo così la medesima immagine
#ndvi1 <- dvi1 / (defor1$defor1.1 + defor1$defor1.2)
# plot(ndvi1, col=cl)
#RStoolbox: troviamo spectralIndices con un solo comando posso controllare tutti gli indici
ndvi2 <- (defor2$defor2.1 - defor2$defor2.2) / (defor2$defor2.1 + defor2$defor2.2)
plot(ndvi2, col=cl)
#possiamo utilizzare direttamente dvi1 perchè abbiamo già il calcolo della sottrazione ottenendo così la medesima immagine
#ndvi2 <- dvi2 / (defor2$defor2.1 + defor2$defor2.2)
# plot(ndvi2, col=cl)

#spectralIndices, richiamiamo l'immagine e dove sono le bande usando il numero della banda
vi <- spectralIndices(defor1, green=3, red=2, nir=1)
plot(vi, col=cl) #calcolerà tutti gli indici spettrali mettendoli insieme
vi2 <- spectralIndices(defor2, green=3, red=2, nir=1)
plot(vi2, col=cl)
#utilizzare la differenza anche per ndvi
difndvi <- ndvi1 - ndvi2
dev.off()
cld <- colorRampPalette(c('blue','white','red'))(100) 
plot(difndvi, col=cld) #visualizziamo le aree in rosso che rappresentano le zone a maggior perdita di vegetazione


#importiamo le librerie e  il set della working directory
library(raster)
library(RStoolbox)
#install.packages("rasterdiv")
library(rasterdiv) #per lavorare con NDVI 

#copertura globale NDVI, farne un plot
plot(copNDVI)
#possiamo eliminare i pixel con cbind e i valori che non ci interessano (acqua) vengono riclassificati con reclassify
copNDVI <- reclassify (copNDVI, cbind (252, 255, NA))
plot(copNDVI)
#utilizziamo levevlplot contenuto in rastervis per originare i livelli, perciò richiamiamo la libreria
library(rasterVis)
levelplot(copNDVI)

#--------------------------------------------------------------------------

9. R code land cover:

#R_code_land_cover.r
#importiamo le librerie e  il set della working directory
library(raster)
library(RStoolbox)
#install.packages("ggplot2")
library(ggplot2)
# install.packages("gridExtra")
library(gridExtra) 

#selezionare la working direcotry
stewd("D:/lab/")
#carichiamo l'intero dataset con funzione brick
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

#utilizziamo la unsupervised classification cioè che le azioni che vengono svolte dal software sono scelte da noi, con un'immagine e un numero di campioni e classi da inserire
d1c <- unsuperClass(defor1, nClasses=2)
#visualizziamo i dati
plot(d1c$map) #leghiamo la mappa all'immagine e vediamo le due classi: con set.seed() visualizziamo foresta tropicale (1) e parte agricola (2)
d2c <- unsuperClass(defor2, nClasses=2)
plot(d2c$map)
#la visualizzazione delle classi si inverte e abbiamo: (1) agricola e (2) foresta tropicale
#con defor2 possiamo utilizzare 3 classi
d2c3 <- unsuperClass(defor2, nClasses=3)
plot(d2c3$map) #vengono distinte due zone nella parte agricola, probabilmente perchè vi sono zone a riflettanza nettamente differente

#calcoliamo ora la frequenza della mappa generata, dei pixel di una certa classe, quante volte questi si presentano nella zona foresta e nella zona agricola
freq(d1c$map) #freq function calcola la frequenza, i valori contenuti si rivelano # [1,] 1 306583 [2,]     2  34709, si fa quindi la proporzione 
# facciamo la somma con la funzione sum
s1 <- 306583 + 34709 
#calcoliamo la proporzione
prop1 <- freq(d1c$map) / s1
#otteniamo : # prop foresta: 0.8983012, prop zone agricole : 0.1016988
s2 <- 342726 #il numero di pixel è differente rispetto alla prima mappa
prop2 <- freq(d2c$map) / s2
#otteniamo: prop foresta: 0.5206958, prop zona agricola : 0.4793042

#possiamo usare le percentuali moltiplicando x100 le proporzioni

#generiamo un dataset o dataframe in R
#inseriamo i fattori che sono variabili categoriche, nel nostro caso foresta e zone agricole, inseriamo le percentuali di entrambe le classi, otterremo una tabella a 3 colonne
cover <- c("Forest","Agriculture")
percent_1992 <- c(89.83, 10.16)
percent_2006 <- c(52.06, 47.93)
#generiamo il dataframe con la funzione data.frame e diamo un nome e infine lo visualizziamo

percentages <- data.frame(cover, percent_1992, percent_2006)
percentages #visualizziamo le 3 colonne 
#generiamo un grafico con ggplot, la sintassi è particolare 
ggplot(percentages, aes(x=cover, y=percent_1992, color=cover)) + geom_bar(stat="identity", fill="white")
#ripetismo l'operazione del ggplot per il 2006
ggplot(percentages, aes(x=cover, y=percent_2006, color=cover)) + geom_bar(stat="identity", fill="white")

#associamo i plot generati a un nome
p1 <- ggplot(percentages, aes(x=cover, y=percent_1992, color=cover)) + geom_bar(stat="identity", fill="white")
p2 <- ggplot(percentages, aes(x=cover, y=percent_2006, color=cover)) + geom_bar(stat="identity", fill="white")
#utilizziamo grid.arrange per unire i ggplot ottenuti occorre avare la library gridExtra, otteniamo così i due grafici delle due annate si può così lavorare sui cambiamenti percentuali nel tempo
grid.arrange(p1, p2, nrow=1)

#--------------------------------------------------------------------------

10. R code variability:

#R_code_variability.r
#inserire le librerie necessarie

library(raster)
library(RStoolbox)
library(ggplot2)
library(gridExtra)
library(viridis) 

#fare il set della working directory
setwd("D:/lab/")

#importiamo l'immagine con funzione brick e la rinominiamo
sent <- brick("sentinel.png")

#segue un plottaggio RGB
plotRGB(sent, stretch="lin") 
# r=1, g=2, b=3 (standard in rgb)
#plotRGB(sent, r=1, g=2, b=3, stretch="lin")
# NIR 1, RED 2, GREEN 3 (la sequenza che noi vogliamo utilizzare)
#se cambiamo l'ordine otteniamo un'immagine evidenziata diversamente
plotRGB(sent, r=2, g=1, b=3, stretch="lin") 

#per il calcolo della dev.standard utilizziamo una sola banda, maggiore sarà la variabilità, maggiore sarà la dev.standard
#con la finestra mobile calcoliamo la dev.standard dell'area di pixel da noi selezionata, noi siamo liberi di spostarla riportando i valori sul pixel centrale
nir <- sent$sentinel.1
red <- sent$sentinel.2

#creiamo il singolo strato per il calcolo della dev.standard calcolando l'indice di vegetazione
ndvi <- (nir-red) / (nir+red)
plot(ndvi)
cl <- colorRampPalette(c('black','white','red','magenta','green'))(100)
plot(ndvi,col=cl)

#calcoliamo la dev.standard dell'immagine, utilizziamo la funzione focal, che calcolerà il tutto tramite la moving window
ndvisd3 <- focal(ndvi, w=matrix(1/9, nrow=3, ncol=3), fun=sd)
plot(ndvisd3)

#cambiamo la colorramppalette
clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100)
plot(ndvisd3, col=clsd)
#notiamo che là dove il colore tende al rosso e al giallo la dev.standard è più alta, dove invece è verde e blu più bassa

#calcoliamo la media dell'ndvi con funzione "mean" della dev.standard
ndvimean3 <- focal(ndvi, w=matrix(1/9, nrow=3, ncol=3), fun=mean)
clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100) 
plot(ndvimean3, col=clsd)

#cambiamo la grandezza della moving window cambiando il numero di pixel da selezionare, il calcolo potrebbe richiadere più tempo
ndvisd13 <- focal(ndvi, w=matrix(1/169, nrow=13, ncol=13), fun=sd)
clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100)
plot(ndvisd13, col=clsd)
ndvisd5 <- focal(ndvi, w=matrix(1/25, nrow=5, ncol=5), fun=sd)
clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100)
plot(ndvisd5, col=clsd)

#altra tecnica per compattare i dati è quella del calcolo del PCA, con rasterPCA, dell'immagine iniziale
sentpca <- rasterPCA(sent) 
plot(sentpca$map)
#nelle quattro immagini notiamo il cambiamento da un componente ad un altro, con una notevole perdita di info riscontrata nell'immagine 4

#vediamo la proporzione di variabilità del modello di ogni singola componente, dove la prima contiene il 67.36804% dell'informazione originale
summary(sentpca$model)

#per l'analisi controlliamo le componenti della mappa all'interno di sent, e leghiamo il tutto alla prima variabile PC1
pc1 <- sentpca$map$PC1
#pc1 verrà sempre associato alla funzione focal, dove invece dell'NDVI stiamo utilizzando pc1
pc1sd5 <- focal(pc1, w=matrix(1/25, nrow=5, ncol=5), fun=sd)
clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100)
plot(pc1sd5, col=clsd)

#funzione surce che salva il pezzo di codice da girare e lo facciamo partire in R,salviamo il pezzo di codice esternamente e lo possiamo poi importare a nostro piacimento
#pc1 <- sentpca$map$PC1
#pc1sd7 <- focal(pc1, w=matrix(1/49, nrow=7, ncol=7), fun=sd)
#plot(pc1sd7)
source("source_test_lezione.r") #sarà il calcolo di una DVstandard 7x7 su R
#un intero script da poter richiamare in R con funzione surce
#con mappa della DVstandard, si usa gglot per plottare e con gridArrange li uniamo tutti insieme, occorre assicurarsi di avere la libreria ggplot2 per questo ora si aggiunge, inseme a GridExtra e Viridis (per i colori in ggplot) 
source("source_ggplot.r")


# https://cran.r-project.org/web/packages/viridis/vignettes/intro-to-viridis.html
#creare la finestra in ggplot2,con funzione ggplot, dove inseriamo dei blocchi definendo la geometria della mappa, defianiamo i mapping e le aestetics (lo strato o layer)
#associamo ogni plot a un oggetto
p1 <- ggplot() +
geom_raster(pc1sd5, mapping = aes(x = x, y = y, fill = layer)) +
# Il pacchetto Viridis contiene otto scale di colori: "viridis", la scelta primaria, e cinque alternative con proprietà simili - "magma", "plasma", "inferno", "civids", "mako" e "razzo" - e una mappa dei colori dell'arcobaleno - "turbo".
scale_fill_viridis()  +
#aggiungiamo un titolo
ggtitle("Standard deviation of PC1 by viridis colour scale")

#ripetiamo l'azione cambiando la legenda, utilizzando la funzione option, cambiamo di conseguenza anche il titolo 
p2 <- ggplot() +
geom_raster(pc1sd5, mapping = aes(x = x, y = y, fill = layer)) +
scale_fill_viridis(option = "magma")  +
ggtitle("Standard deviation of PC1 by magma colour scale")

p3 <- ggplot() +
geom_raster(pc1sd5, mapping = aes(x = x, y = y, fill = layer)) +
scale_fill_viridis(option = "turbo")  +
ggtitle("Standard deviation of PC1 by turbo colour scale")

#con la funzione grid .arrange metto insieme le tre legende, definendo una sola riga
grid.arrange(p1, p2, p3, nrow = 1)

#--------------------------------------------------------------------------
