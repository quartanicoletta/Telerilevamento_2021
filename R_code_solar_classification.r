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
