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
#11. R code NO2 
#12. R code spectral signatures

#--------------------------------------------------------------------------

#1. Remote sensing- first code:

# il mio primo codice in R per il telerilevamento!
#importo la cartella dal mio sitema operativo 
setwd("D:/lab/") # Windows
#install.packages("raster") installo il pacchetto necessario per lavorare
library(raster)
# la funzione brick genera file multistrato o bande
p224r63_2011 <- brick("p224r63_2011_masked.grd")
p224r63_2011 #visualizzo le info sull'immagine
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
# con la seguente funzione ripulisco il mio grafico
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
#ex MF 2x2  #multiframe. Il primo parametro indica le righe, il secondo le colonne, la c è per creare il vettore
par(mfrow=c(2,2))
plotRGB(p224r63_2011,r=3,g=2,b=1,stretch="Lin") #visualizza l'immagine con i colori che l'occhio umano vede. stretch prende i valori delle singole bande e li dirada per fare in modo che non ci sia uno schiacciamento del colore
plotRGB(p224r63_2011,r=4,g=3,b=2,stretch="Lin") #la componente red visualizza le riflettanze nell'infrarosso (layer 4). La vegetazione è in rosso. Zone più scure indicano una maggiore umidità
plotRGB(p224r63_2011,r=3,g=4,b=2,stretch="Lin") #montando la banda 4 sul green il suolo nudo, senza vegetazione, viene indicato dal colore viola
plotRGB(p224r63_2011,r=3,g=2,b=4,stretch="Lin") #infrarosso nel blu. Il suolo nudo è giallo

#creare pdf dell'immagine caricata su R
pdf("il_mio_primo_pdf_con_R.pdf")
par(mfrow=c(2,2))
plotRGB(p224r63_2011,r=3,g=2,b=1,stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011,r=3,g=4,b=2,stretch="Lin")
plotRGB(p224r63_2011,r=3,g=2,b=4,stretch="Lin")
dev.off()
# immagine con Histogram stretch=hist otterrò un'immagine con una definizione molto più dettagliata
plotRGB(p224r63_2011,r=3,g=4,b=2,stretch="Lin")
plotRGB(p224r63_2011,r=3,g=4,b=2,stretch="hist") #evidenzia maggiormente le zone più umide, colorandole di viola
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
plotRGB(p224r63_1988, r=3, g=2, b=1, stretch="Lin") #il violetto sulla parte destra delle immagini sono delle interferenze
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin") #Plot con infrarosso si evidenzia la vegetazione
#fare par con 1988 e 2011
par(mfrow=c(2,1))
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin") #si vede nettamente il confine tra foresta e zone coltivate
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
#importo le librerie necessarie
library(raster)
library(rasterVis)
setwd("D:/lab/greenland")
#ogni immagine nella cartella greenland è uno strato che rappresenta la stima della temperatura
#carichiamo il primo dei file del set, sono singoli dati. Non si usa brick ma raster
#raster:carichiamo singoli dati, importiamo il primo
lst_2000 <- raster("lst_2000.tif")
#possiamo plottarlo
plot(lst_2000) #colori dal bianco al verde. La riflettanza viene data in bit (0/1)
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
rlist #lista di tutti i file dentro la cartella greenland con, nel loro nome, la parola lst
#lapply: x=lista dove applicare la funzione FUN= funzione raster da applicare (il tutto si applica a tutti i file lst)
import <- lapply(rlist,raster)
import #visualizza le informazioni relative ai 4 file
#ora possiamo creare un unico pacchetto di file con tutti quelli importati, lo facciamo con la funzione stack
#stack function: abbiamo una lista di file raster e li mettiamo tutti insieme
TGr <- stack(import) 
#ci servirà per ottenere il plot di tutti i file insieme
plot(TGr)
#immagini sovrapposte con schema RGB
plotRGB(TGr, 1, 2, 3, stretch="Lin")
#red (primo livello) ho messo lst_2000, perciò se ci sono zone in rosso avrò valori più alti di lst nel 2000.
#green (secondo livello) ho messo lst_2005, perciò se trovo dei colori verdi, significa che c'è un valore più alto nell'lst nel 2005.
#blue (terzo livello) ho messo lst_2010 ci sono zone in blu avrò valori più alti di lst nel 2010.
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
#ll grafico grigio sopra l'immagine indica la temperatura, come media della stessa colonnna o riga della griglia di bit.
#valori bassi di temperatura, indicati da numeri interi di bit, sono rappresentati dal colore blu (sulla Gronelandia)
#possiamo cambiare i titoli delle immagini con la funzione names.attr (per nominare i singoli attributi)
#main è l'argomento, quindi nel nostro caso il titolo dellla mappa, messo tra virgolette perchè un testo
levelplot(TGr,col.regions=cl, main="LST variation in time",names.attr=c("July 2000","July 2005", "July 2010", "July 2015"))
#Usiamo i dati che riguardano lo scioglimento (melt). Immagini raccolte dal satellite Nimbus 7.
#dati melt, creiamo una lista dei file con pattern comune "melt" o "annual"
meltlist <- list.files(pattern="melt")
#importo i file
melt_import <- lapply(meltlist,raster)
#raggruppo i file importati
melt <- stack(melt_import)
melt
#posso fare un level plot solo ora con dati melt
levelplot(melt) #mostra i valori dello scioglimento dei ghiacci.
#valori più alti >scioglimento
#metricsalgebra applicato alle matrici per lo studio di dati temporali, facciamo la sottrazione tra primo e ultimo dato, mettiamo $ per legare uno strato all'altro
melt_amount <- melt$X2007annual_melt - melt$X1979annual_melt
#creo una nuova colorramppalette
clb <- colorRampPalette(c("blue","white","red"))(100)
#sia plot che levelplot
plot(melt_amount, col=clb) #tutte le zone rosse sono quelle dove dal 2007 al 1979 è avvenuto il maggior tasso di scioglimento
levelplot(melt_amount, col.regions=clb) #il colore esterno è un NA, quindi assenza di valore

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


setwd("D:/lab/")
#funzione stitch:report automatico
library(knitr)
#inizialmente faccio copia e incolla del codice precedentemente fatto con i dati della Groellandia su blocco note di windows, e lo salvo come R_code_greenland.r" nella cartella lab
#applico la funzione stitch
stitch("R_code_greenland.r", template=system.file("misc", "knitr-template.Rnw", package="knitr"))
#Error in file(con, "r") : non posso aprire questa connessione
#Inoltre: Warning message:
#In file(con, "r") :
# cannot open file 'R_code_greenland.r': No such file or directory
#come risolvere il problema: ho salvato il file di testo R_code_greenland.r, e windows non mi mostrava l'estenzione"vera", per cui devo aggiungere io l'estenzione ".txt"
stitch("R_code_greenland.r.txt", template=system.file("misc", "knitr-template.Rnw", package="knitr"))
#si è generato un file nella cartella lab R_code_greenland.r.tex
#come generare un pdf da un file tex
#overleaf si possono usare file latex

#--------------------------------------------------------------------------

#5. R code multivariate analisys:

#R_code_multivariate_analysis.r
library(raster)
library (RStoolbox)
setwd("D:/lab/") 
#con brick carico un pacchetto di dati che importo dal sistema operativo 
p224r63_2011 <-brick ("p224r63_2011_masked.grd")
p224r63_2011
#class      : RasterBrick 
#dimensions : 1499, 2967, 4447533, 7  (nrow, ncol, ncell, nlayers)
#resolution : 30, 30  (x, y)
#extent     : 579765, 668775, -522705, -477735  (xmin, xmax, ymin, ymax)
#crs        : +proj=utm +zone=22 +datum=WGS84 +units=m +no_defs 
#source     : C:/lab/p224r63_2011_masked.grd 
#names      :       B1_sre,       B2_sre,       B3_sre,       B4_sre,       B5_sre,        B6_bt,       B7_sre 
#min values : 0.000000e+00, 0.000000e+00, 0.000000e+00, 1.196277e-02, 4.116526e-03, 2.951000e+02, 0.000000e+00 
#max values :    0.1249041,    0.2563655,    0.2591587,    0.5592193,    0.4894984,  305.2000000,    0.3692634
plot (p224r63_2011) #verranno visualizzate tutte le bande da B1 a  B7 e vedo la correlazione
#se la correlazione è perfetta positivamente R=+1, mentre se la correlaione è perfetta negativamente R=-1.
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
p224r63_2011res_pca <- rasterPCA(p224r63_2011res) #si crea una mappa in uscita e un modello
#vediamo la varianza utilizzando la funzione summary, che è molto generica e base,dà un sommario del nostro modello
summary(p224r63_2011res_pca$model) #così vediamo la varianza nelle varie bande
#Importance of components:
#                         Comp.1      Comp.2       Comp.3       Comp.4
#Standard deviation     1.2050671 0.046154880 0.0151509526 4.575220e-03
#Proportion of Variance 0.9983595 0.001464535 0.0001578136 1.439092e-05
#Cumulative Proportion  0.9983595 0.999824022 0.9999818357 9.999962e-01
#                             Comp.5       Comp.6       Comp.7
#Standard deviation     1.841357e-03 1.233375e-03 7.595368e-04
#Proportion of Variance 2.330990e-06 1.045814e-06 3.966086e-07
#Cumulative Proportion  9.999986e-01 9.999996e-01 1.000000e+00
#la prima componente spiega il 99% della varianza. Con le prime 3 bande spiego il 99,99%
#con plot, prendo l'immagine modello la unisco alla mappa
plot(p224r63_2011res_pca$map)
p224r63_2011res_pca
#plottiamo quindi in rgb tutta l'immagine
plotRGB(p224r63_2011res_pca$map, r=1,g=2,b=3, stretch="lin") #vediamo un'immagine che utilizza tutte e tre le componenti principali
#per ottenere informazioni più complesse del file utilizzo la funzione str (structure)
str(p224r63_2011res_pca)
#Analisi PCA: genera delle nuove componenti che diminuiscono la correlazione iniziale e, con un numero minore di componenti, possiamo spiegare tutta l'immagine togliendo la correlazione.
#E' importante fare la PCA per ridurre la correlazione tra le variabili quando, per esempio, si fa un'analisi con variabili molto correlate tra di loro a cui non è consigliato applicare un modello lineare.
#In generale si applica l'analisi delle componenti principali se si ha un set di dati con molte variabili 

#--------------------------------------------------------------------------

#6. R code solar classification:

#R code classification 
#codice per classificare immagini
library(raster)
library(RStoolbox)
setwd("D:/lab/")
#caricare immagine solar orbiter data con funzione brick, ha 3 layer e li unisce
so <- brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")
#visualizziamo i dettagli
so
#visualizziamo i livelli RGB
plotRGB(so, 1,2,3, stretch="lin") #livello energetico molto alto di colore chiaro, livello energetico basso di colore scuro e livello energetico intermedio con colori intermedi
#classifichiamo le immagini con la funzione nel pacchetto RStoolbox 
#funzione che opera la classificazione non supervisionata (unsupervised classification)= unsuperClass
#Capisce come i pixel si comportano in uno spazio multispettrale, creando alcune classi utilizzando dei pixel già conosciuti come campione (training set).
#nClasses è il numero di classi, la associamo a un oggetto soc
soc <- unsuperClass(so, nClasses=3)
#plottiamo l'immagine per vedere cosa è stato creato in uscita
#ciò che plottiamo è la mappa, una parte dell'immagine, soc legandolo con $ a map
plot(soc$map)
# funzione che fa in modo di utilizzare le stesse regole nei lavori= set.seed(42)
#classificazione con 20 classi
set.seed(42) #funzione per fare in modo che l'immagine sia sempre uguale, utilizzando lo stesso training set
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
plot(gcc$map) #la zona centrale può essere un tipo di roccia caratteristico. Ha un valore di riflettanzamaggiore a cui è stato associato il valore 1 
#facciamo la classificazione in 4 classi
gcc4 <- unsuperClass(gc, nClasses=4)
plot(gcc4$map)

#--------------------------------------------------------------------------

#7. R code ggplot2:

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
defor1
# names      : defor1.1, defor1.2, defor1.3 
# values :        0,        0,        0 
# max values :      255,      255,      255
# NIR=defor1.1, RED=defor1.2
#calcoliamo un indice di vegetazione,facendo la differenza tra le bande del NIR e red del defor1, uniamo la banda all'immagine con $
#per ogni pixel abbiamo preso la banda del NIR  e del red, medesimo pixel per le stesse bande, fatto la differenza ottenendo la diffrence vegetation index
dvi1 <- defor1$defor1.1 - defor1$defor1.2 
#facendo il plot otteniamo un'immagine più pulita facendo prima il dev.off()
plot(dvi1)
#facciamo una color ramp palette per ottenere una classificazione migliore nel nostro plot
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) 
plot(dvi1, col=cl, main="DVI at time 1")
defor2
# names      : defor2.1, defor2.2, defor2.3 
# min values :        0,        0,        0 
# max values :      255,      255,      255
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
levelplot(copNDVI) #I valori più alti sono nelle foreste amazzonica, del borneo, centro africa e del Nord America. Nel resto i valori sono molti bassi, per i deserti in Africa e in Asia e per la neve ai poli.

#--------------------------------------------------------------------------

#9. R code land cover:

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
#immagine, 3 layer e componenti e strecth. Plotta anche le coordinate spaziali sugli assi x e y

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
d1c
# $map
# class      : RasterLayer 
# dimensions : 478, 714, 341292  (nrow, ncol, ncell)
# resolution : 1, 1  (x, y)
# extent     : 0, 714, 0, 478  (xmin, xmax, ymin, ymax)
# crs        : NA 
# source     : memory
# names      : layer 
# values     : 1, 2  (min, max) 
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

#10. R code variability:

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

#11. R code no2.r

#1. Facciamo il set della working directory:

setwd("D:/lab/EN")

#2. Importiamo i dati con funzione raster, quindi carichiamo il pacchetto:

library(raster)
library(RStoolbox) #per l'analisi multivariata

#3. Ora importiamo la prima immagine, per singola banda:

EN1 <- raster("EN_0001.png")

#3. Fare il plot dell'immagine importata, utilizzando la palette di colori preferita:

cls <- colorRampPalette(c("pink","blue","yellow"))(100)

plot(EN1, col= cls) #il giallo evidenzia le zone con NO2 più alto nel mese di gennaio

#4. Importiamo l'ultima immagine e la plottiamo:

EN13 <- raster("EN_0013.png")

cls <- colorRampPalette(c("pink","blue","yellow"))(100)

plot(EN13, col=cls)

#5. Evidenziare le differenze tra i due plot:

#differenza tra marzo e gennaio
ENdif <- EN13 - EN1

plot(ENdif, col= cls)

#6. Plottare tutto insieme:

par(mfrow=c(3,1))
plot(EN1, col=cls, main="NO2 in January")
plot(EN13, col=cls, main="NO2 in March")
plot(ENdif, col=cls, main="Difference (March - January)")

#7.  Importare tutte le immagini di un intero set:

rlist <- list.files(pattern="EN") #per importare interi set come lista
rlist

import <- lapply (rlist,raster)
import #abbiamo tutti i singoli layer importati dalla lista grazie alla funzione raster

EN <- stack(import) #abbiamo compattato tutti i file con la funzione stack
plot (EN, col=cls)

#8. Replicare il plot dell'immagine 1 e 13, usando stack

par (mfrow=c(2,1)) #lego il dataset alle singole bande

plot(EN$EN_0001, col=cls)
plot(EN$EN_0013, col=cls)

#9. Analisi multivariata, effettuare una PCA sulle 13 immagni, tramite stack

ENpca <- rasterPCA(EN) #la funzione dell'intero blocco stack
summary(ENpca$model)

dev.off()
plotRGB(ENpca$map, r=1, g=2, b=3, stretch="lin") #capiamo che la maggior parte dell'informazione è nel red

#10. calcolare la variabilità nella prima ed ultima immagine, della prima variabile di PCA

PC1sd <- focal(ENpca$map$PC1, w=matrix(1/9, nrow=3, ncol=3), fun=sd) #mantengo i nomi delle componenti principali, come per il valore di PC1

plot(PC1sd, col=cls) #la dev. standard aumenta sulle linee di confine

#--------------------------------------------------------------------------

#12. R_code_spectral_signatures.r

#importiamo i pacchetti necessari

library(raster)
library(rgdal)
library(ggplot2)

#fare il set della working directory

setwd("D:/lab/")

#carichiamo il dataset

defor2 <- brick("defor2.jpg") 

#segue un plot e inseriamo le bande che ci interessano, NIR, red, green

#possiamo farlo anche con HIST, creando una curva logistica con differenze di colore molto più accentuate

#utilizziamo l'immagine per ottenere delle firme spettrali con la funzione click(cliccando sulla mappa otterremo le info sulla riflettanza)

click(defor2, id=T, xy=T, cell=T, type="p", pch=16, col="magenta") 

#cliccando sulla mappa su una zona con vegetazione otteniamo  
#x     y   cell defor2.1 defor2.2 defor2.3
#1 131.5 245.5 166476      187        9       21  notiamo che nella prima banda abbiamo un valore molto alto di riflettanza nel nir, nel socondo molto basso e nella terza medio basso
#se clicchiamo dove c'è un corso d'acqua otteniamo 
#x     y   cell defor2.1 defor2.2 defor2.3
#1 191.5 177.5 215292       59       52       83 notiamo una riflettanza molto bassa in NIR, ma molto alta in rosso e blu

#dobbiamo chiudere l'immagine per poter proseguire

#creiamo un dataframe e con ggplot2 creiamo le firme spettrali
#definiamo le colonne del dataset, otterremo una tabella a tre colonne
band <- c(1,2,3)
forest <- c(187, 9, 19)
water <- c(59, 52, 83)

#mettiamo tutto insieme nel creare il dataframe così da ottenere la tabella

output <- data.frame(band,forest,water)
output #la visualizziamo

#possiamo ora fare il plot con ggplot2, per le firme spettrali di un dataset nel mio caso output
#x è definita da funzione aestetics, ed assegnamo il valore band, per le y le due restanti colonne
#assegnamo le geometrie nel plot, connette le osservazioni a seconda dei dati definiti su x

ggplot(output, aes(x=band)) + 
    geom_line(aes(y = forest), color = "green")+ #notiamo un'altissima riflettanza nella banda1,una bassa nella 2 e medio bassa nella 3
    geom_line(aes(y = water), color = "blue", linetype = "dotted")+ #l'acqua si comporta diversamente rispetto alla vegetazione con valori molto simili ma con una riflettanza più bassa nel rosso, anche il nir ha comunque un valore molto basso
    labs(x="band", y="reflectance") #la funzione labs assegnamo il nome ai valori x e y

    
#analisi multitemporale calcolando la variabilità degli assi
#utilizziamo defor1 e defor2

defor1 <- brick("defor1.jpg")

plotRGB(defor1, 1,2,3, stretch="Lin")

#creiamo le firme spettrali defor1

click(defor1, id=T, xy=T, cell=T, type="p", pch=16, col="magenta")

#time1
#clicchiamo sopra l'ansa del fiume e prendiamo i primi 5 valori
     #x     y   cell defor1.1 defor1.2 defor1.3
#1 77.5 321.5 111462      225       13       35
     #x     y   cell defor1.1 defor1.2 defor1.3
#1 66.5 330.5 105025      213       12       30
     #x     y   cell defor1.1 defor1.2 defor1.3
#1 79.5 335.5 101468      210       13       33
      #x     y   cell defor1.1 defor1.2 defor1.3
#1 102.5 331.5 104347      226       13       33
     #x     y  cell defor1.1 defor1.2 defor1.3
#1 82.5 351.5 90047      168       66       62
     #x     y  cell defor1.1 defor1.2 defor1.3

plotRGB(defor2, 1,2,3, stretch="Lin")

click(defor2, id=T, xy=T, cell=T, type="p", pch=16, col="magenta")
#time2  
#x     y  cell defor2.1 defor2.2 defor2.3
#1 85.5 351.5 90428      181      168      162
     #x     y  cell defor2.1 defor2.2 defor2.3
#1 64.5 347.5 93275      190      181      172
     #x     y  cell defor2.1 defor2.2 defor2.3
#1 96.5 340.5 98326      204      163      159
     #x     y  cell defor2.1 defor2.2 defor2.3
#1 84.5 340.5 98314      195      166      152
     #x     y  cell defor2.1 defor2.2 defor2.3
#1 75.5 348.5 92569      125       63       52


#creiamo il dataset definiamo le colonne del dataset

band <- c(1,2,3)
time1 <- c(225, 13, 35)
time2 <- c( 181, 168, 162)
spectralst <- data.frame(band,time1,time2)
spectralst

ggplot(spectralst, aes(x=band)) + 
    geom_line(aes(y = time1), color = "red")+
geom_line(aes(y = time2), color = "blue", linetype = "dotted")+ 
 labs(x="band", y="reflectance")
#notiamo i pixel del time1 con altissima riflettanza in NIR e nel time2 nello stesso punto abbiamo un un rosso molto più alto
#aggiungiamo altri dati di pixel del primo e secondo tempo e riplottiamo

band <- c(1,2,3)
time1 <- c(225, 13, 35)
time1p2 <- c(213, 12, 30)
time2 <- c( 181, 168, 162)
time2p2 <- c(190, 181, 172)

spectralst <- data.frame(band,time1,time1p2,time2,time2p2)
spectralst

ggplot(spectralst, aes(x=band)) + 
    geom_line(aes(y = time1), color = "red")+
geom_line(aes(y = time1p2), color = "red") +
geom_line(aes(y = time2), color = "blue", linetype = "dotted")+ 
geom_line(aes(y = time2p2), color = "blue", linetype = "dotted")+
 labs(x="band", y="reflectance")
#abbiamo così 2 pixel per ogni momento, che mantengono lo stesso andamento in red e blue, se usiamo n pixel, occorre utilizzare una funzione extract che estrae i valori delle bande sui pixel randomizzati, generando il grafico.
#possiamo cambiare la dimensione della linea con l'argomento linetype

#Immagini da Earth observatory

EO <- brick("june_puzzler.jpg")
plotRGB(EO, 1,2,3, stretch="Lin") 
click(EO, id=T, xy=T, cell=T, type="p", pch=16, col="magenta")
#x     y   cell june_puzzler.1 june_puzzler.2 june_puzzler.3
#1 386.5 137.5 246627            224            222            101
#      x     y   cell june_puzzler.1 june_puzzler.2 june_puzzler.3
#1 347.5 163.5 227868             20            149             20
#      x     y   cell june_puzzler.1 june_puzzler.2 june_puzzler.3
#1 283.5 247.5 167324             26             34             11

band <- c(1,2,3)
strato1 <- c(224, 222, 101)
strato2 <- c(20,149, 20)
strato3 <- c( 26, 34,11)


spectralstrati <- data.frame(band,strato1, strato2, strato3)
spectralstrati

ggplot(spectralst, aes(x=band)) + 
    geom_line(aes(y = strato1), color = "yellow")+
geom_line(aes(y = strato2), color = "green")+
geom_line(aes(y = strato3), color = "black", linetype = "dotted")+ 
 labs(x="band", y="reflectance")

#notiamo 3 elevate differenze, nello strato1 e 2 notiamo un picco di riflettanza nella seconda banda, tutte e tre hanno bassa riflettanza nella banda 3





