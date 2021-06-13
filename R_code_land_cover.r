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



