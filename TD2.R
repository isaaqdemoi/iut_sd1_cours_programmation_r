getwd() #mettre a jour fichier
setwd #ctrl shift h 
#pour pas retaper tout le chemin d acces pour chaque datafram
bodies_karts = read.csv(file = "bodies_karts.csv", header = TRUE, sep = ";", dec = ",")
tires = read.csv(file = "tires.csv", header = TRUE, sep = "\t", dec = ",")
gliders = read.csv(file = "gliders.csv", header = TRUE, sep = "|", dec = ".")
drivers = read.csv(file = "drivers.csv", header = TRUE, sep = ";", dec = ",")


dim(bodies_karts)
dim(tires)
dim(gliders)
dim(drivers)
# graphiquement un nuage de points le lien entre les statistiques des drivers sur Weight et Acceleration
plot(x=drivers$Weight,
     y=drivers$Acceleration,
     main= "Drivers : Weight/Acceleration")
#coefficient de correlation
coeffcor=cor(x=drivers$Weight,
     y=drivers$Acceleration)

#coefficient de determination
coeffdet=coeffcor^2


#matrice correlation variable quanti de drivers
matricecor=cor(drivers[,-1])
matricecor=round(matricecor,2)
View(matricecor)

#installation package : 
install.packages("corrplot")

#Construire une Corrélogramme:
library(corrplot)
corrplot(matricecor,method="circle")








#Manipulation de data frame
#Créer un object resultat avec uniquement le nom du Driver et son Weight.
resultat=drivers[,c("Driver","Weight")]
View(resultat)

#Créer un object resultat avec uniquement le nom du Driver et son Acceleration sur les 10 premières lignes.
resultat=drivers[1:10,c("Driver","Acceleration")]
View(resultat)

#Créer un object resultatsans les colonnes 5, 7 et 9
resultat=drivers[,-c(5,6,7)]
View(resultat)

#Créer un object resultatsans les colonnes Weight et Acceleration.
resultat = drivers[ , -c("Weight","Acceleration")] #cela fonctionne uniquement sur des index numériques.
resultat=drivers[,-c(2,3)]

resultat=drivers[,c("Driver","Acceleration","Weight")]
View(resultat)

#Créer un object resultat avec Driver et Weight en triant les conducteurs du plus léger au plus lourd 
rang=order(drivers$Weight)
resultat = drivers[ rang  , c("Driver", "Weight") ]

#Créer un object resultat avec  Driver et Acceleration en triant les conducteurs du plus rapide au moins rapide.
rang=order(drivers$Acceleration,decreasing=TRUE)
resultat=drivers[,c("Driver","Acceleration")]

#Créer un object resultat avec  Driver, Weight et Acceleration en triant les conducteurs du plus rapide au moins rapide et du plus léger au plus lourd.
rang = order(drivers$Acceleration, drivers$Weight, decreasing = c(TRUE,FALSE))
resultat = drivers[ rang  , c("Driver", "Acceleration","Weight") ]


#Creer un objet topdriver avec les perso dont l acceleration est la plus haute
topDriver = subset(x = drivers,
                   subset = Acceleration == max(Acceleration), 
                   select = c("Driver","Acceleration"))

