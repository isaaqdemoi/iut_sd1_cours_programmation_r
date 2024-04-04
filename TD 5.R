#EXERCICE 1 :

#Simuler une loi normale :
loinorm = rnorm(n = 10000, mean = 0, sd = 1)

#construire l'histogramme 
hist(loinorm,
     main = "Loi normale centrée réduite",
     probability = TRUE)

#sa courbe densité :
lines(density(loinorm))

#Calcul mediane de la loi :
median(loinorm)

#Calcul quartiles de la loi : 
quantile(loinorm)

#Calcul centile de la loi : 
quantile(loinorm,
         probs = seq(from = 0, to = 1, by=0.01))

#PNORM ET QNORME :
#Calcul valeur théorique :
qnorm(0.95, mean = 0, sd = 1)
pnorm(1.644854, mean = 0, sd= 1)

qnorm(0.975, mean = 0, sd = 1) # P(X < x) = 0.975.
pnorm(1.96, mean = 0, sd= 1) #P(X >= 1.96) = p.





#EXERCICE 2 :

indices_lignes = seq(from = 0, to = 3.9, by =0.1)
#creation vecteur vide : 
allprobas=c()
for(i in indices_lignes){ proba =pnorm(q=i,mean=0,sd=0)
                          allprobas=c(allprobas,proba)
                          allprobas=round(allprobas,digits = 4)}



# 2) La taille moyenne des français est de 171cm avec un écart-type de 9 centimètres.
#population simulée de 10.000.000 de français répartis suivant une loi normale (171,9)
moyenne_pop=171
sd_pop=9
population=rnorm(n = 1e7, 
                  mean=moyenne_pop, 
                  sd=sd_pop)
#Etablir l'histogramme de la taille
hist(population)

#Combien de personnes ont une taille inférieur à 190cm ? 
#Combien devriez-vous en trouver théoriquement ?
is.data.frame(population)
#observé
pop190 = population[population < 190]
length(pop190)
length(pop190) / length(population)

#en théorie
pnorm(q = 190, mean=moyenne_pop, sd=sd_pop)*1e7




#EXERCICE 3 :
#taille moyenne dans un echantillon :
taille_ech=100
echantillon=sample(x = population, 
                    size = taille_ech, 
                    replace = TRUE)
mean(echantillon)
sd(echantillon)
#calculez la largeur int confiance, et bornes inf et sup.
largeur=qnorm(p = 0.975,mean=0,sd=1)*sd_pop/sqrt(taille_ech)
borne_inf=moyenne_pop-largeur
borne_sup=moyenne_pop+largeur

#tirez 1000 échantillons de taille 100
taille_ech=100
nb_replicat=1000
echantillons=replicate(n = nb_replicat,
                        expr =  sample(population,
                                       taille_ech, 
                                       replace = TRUE))

moyennes=apply(X = echantillons,
                MARGIN = 2,
                FUN = function(x) mean(x))
ecart_types=apply(echantillons,
                   MARGIN = 2,
                   FUN = function(x) sd(x))

#Combien d'échantillons ont moyenne sup à 172,8cm ? Quel est le nombre théorique ?
#observé
moy172 = moyennes[moyennes > 172]
length(moy172)
length(moy172) / length(moyennes)

#en théorie
proba_inf_172 = pnorm(q = 172, 
                      mean=moyenne_pop, 
                      sd=sd_pop/sqrt(taille_ech))
1 - proba_inf_172


#Construire un dataframe avec ces 3 vecteurs.
resultat = data.frame(largeur,borne_inf_IC,borne_sup_IC)
View(resultat)