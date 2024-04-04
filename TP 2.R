getwd()
df=read.csv("fao.csv",header=TRUE,sep=";",dec=",")
nrow(df)
summary(df)
mean(df$Dispo_alim, na.rm=TRUE) #moyenne avec valeur manquante
sum(df$Population,na.rm=TRUE) #Somme avec valeur manquante
sd(df$Import_viande,na.rm = TRUE) #ET avec valeur manquante
sd(df$Export_viande,na.rm = TRUE)
median(df$Prod_viande,na.rm = TRUE) #Mediane avec valeur manquante
quantile(df$Dispo_alim) #quartile
quantile(df$Import_viande, seq(0,1,0.01)) #centiles


#extraire les lignes du dataset avec les 5 pays les moins peuplés.
rang=(order(df$Population))
resultat = head(df[ rang , ], n = 5)

#extraire les lignes du dataset avec les 5 pays les plus peuplés.
rang = order(df$Population, decreasing = TRUE)
resultat = head(df[ rang , ], n = 5)



resultat = subset(df, Dispo_alim>=2300)

resultat = subset(df, Dispo_alim > 3500  & Import_viande > 1000)
#Construire une requête pour extraire les lignes du dataset avec la France et la Belgique.
resultat=subset(df,Nom %in% c("France","Belgique"))
View(resultat )


#Exporter le nouveau dataframe dans un fichier csv nommé ExportTp2.csv avec la fonction write.table()
write.table(x = df, file = "ExportTp2.csv")
