#EXERCICE 1 :

df = read.csv(file = "velov.csv", header = TRUE, sep = ";", dec = "," )
summary(df)
df$status = as.factor(df$status)
df$CodePostal= as.factor(df$CodePostal)
summary(df)
df$bornes <- ifelse(df$capacity != df$bikes+df$stands, "ko","ok")




#EXERCICE 2 : 

#Construit un histogramme :
hist(x = df$capacity, 
     main = "Distribution de \n la capacité des stations")

#Construire le même graphique mais avec 6 classes :
hist(x = df$capacity, 
     main = "Distribution de \n la capacité des stations",
     breaks = 6)

#Construire le même graphique mais en rouge :
hist(x = df$capacity, 
     main = "Distribution de \n la capacité des stations",
     breaks = 6,
     col = "red")

#Renommer l'axe des abscisses par Capacity : 
hist(x = df$capacity, 
     main = "Distribution de \n la capacité des stations",
     breaks = 6,
     col = "red",
     xlab = "Capacity")

#ajouter une ligne bleu : 
abline(h = 100, col = "blue", lty = 2)

#Construire le même graphique mais avec la densité plutôt que les effectifs : 
hist(x = df$capacity, 
     main = "Distribution de \n la capacité des stations",
     col = "red",
     probability = TRUE,
     xlab = "Capacity")

#Ajouter la courbe densité de cette distribution à l'aide des fonctions lines() et density() : 
lines(density(df$capacity),
      lty = 2,
      col = "blue",
      lwd = 4)

#Pour voir la courbe density en entier,
#modifier les bornes de l'axe des ordonnées de l'histogramme avec l'argument ylim
hist(x = df$capacity, 
     main = "Distribution de \n la capacité des stations",
     col = "red",
     probability = TRUE,
     xlab = "Capacity",
     ylim = c(0,0.08))

lines(density(df$capacity),
      lty = 2,
      col = "blue",
      lwd = 2)





#EXERCICE 3 : 

#Construire une boîte à moustache de la distribution des capacity :
boxplot(x = df$capacity, 
        main = "Boxplot de \n la capacité des stations")

#Construire le même graphique en le remettant à la verticale et en n'affichant pas les valeurs atypiques :
boxplot(x = df$capacity, 
        main = "Boxplot de \n la capacité des stations",
        horizontal = FALSE,
        outline = FALSE)
#ajouter un point supplémentaire qui correspond à la moyenne de la série :
points(moy, col = "red", pch = 15, cex = 2)




#On souhaite comparer les vélos disponibles sur le 7ème et le 8ème arrondissement.
par(mfrow=c(1,2)) #fenêtre sur 1 ligne et 2 colonnes
#7ème
df7 = subset(df, CodePostal == "69007")
boxplot(x = df7$bikes, 
        main = "Boxplot nb vélos \n 69007",
        ylim = c(0,40))
#8ème
df8 = subset(df, CodePostal == "69008")
boxplot(x = df8$bikes, 
        main = "Boxplot nb vélos \n 69008",
        ylim = c(0,40))

#on souhaite analyser le nombre de vélos disponibles en fonction de la variable bonus.
boxplot(formula = bikes ~ bonus,
        data = df, 
        main = "Dispo vélos vs Stations Bonus")





#EXO 4 : 

#Créer un diagramme en barre : 
effectif = table(df$bonus)
barplot(height = effectif,
        main = "Répartition du nombre \n de station bonus")

#Diagramme en pourcentage : 
frequence = prop.table(effectif)
barplot(height = frequence,
        main = "Répartition en % du nombre \n de station bonus",
        horiz = TRUE)

#Créer un diagramme circulaire : 
pie(x = effectif,
    main = "Répartition du nombre \n de station bonus",
    col = c("yellow","green"))

#diagramme en barre le top 10 des codes postaux avec le plus de station velo'v : 
effectif = table(df$CodePostal)
top10 = sort(effectif, decreasing = TRUE)[1:10]
barplot(height = top10,
        main = "Top 10 sur le \n nombre de station",
        col = palette())

#Exporter ce graphique dans un format .PNG à l'aide de la fonction dev.print() :
dev.print(device = png, file = "export.png", width = 600)


#construire un nuage de point :
plot(x = df$stands, y = df$capacity,
     main = "Place disponible vs Capacité")







