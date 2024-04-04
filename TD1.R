#Exercice 1 - Les objets et les vecteurs
a = 10
b = 5
resultat = a * b
print(resultat) 
A = 7.2   # variable différente de a
B= 10.1 # variable différente de b
resultat = A+B
rm(list=ls())  


#Exercice2
#VECTEUR
v1=c(1,2,3,4,5)
class(v1)
v1[3] #afficher 3eme valeur vecteur
V1=c(1:5) #2e facon 1 a 5 vecteur
v2=v1+3 #+3 a chaque valeur de v1
v3=c(1:6)
v4=v3^2
v5=v4 / 2
vj=c("Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi", "Dimanche")
vj[c(2,7)] #afficher 2 et 7e valeur vecteur chr
vbol=c(TRUE, FALSE, TRUE, FALSE, TRUE) #valeur bolenne
class(vbol)
vna=c(1, 2, NA, 4, 5)#vecteur NA
class(vna)



#SEQUENCE
seq1=seq(from = 1, to = 10)
length(seq1)
seqpaire=seq(from = 2, to = 20, by = 2)
length(seqpaire)
seqdecr=seq(from = 0, to = -5)
length(seqdecr)
seq2=seq(from = 5, to = 50, by = 5)
length(seq2)


#REPETER VECTEUR  
#Répéter  3 cinq fois 
vecteur=rep(3, times=5)
#vecteur répétant les lettres 'A', 'B', 'C' trois fois chacune.
vecteur=rep(c('A', 'B', 'C'), times = 3)
#vecteur répétant les valeurs TRUE et FALSE quatre fois chacune.
vecteur=rep(c(TRUE, FALSE), times = 4)




#Les fonctions runif(), mean(), median(), min(), max()
vecteuralea=runif(n=5, min=0, max=1)
mean(vecteuralea)
median(vecteuralea)
min(vecteuralea)
max(vecteuralea)
#séquence de 10 nombres aléatoires compris entre -5 et 5 
seqalea=runif(n = 10, min = -5, max = 5)
mean(seqalea)
median(seqalea)
min(seqalea)
max(seqalea)

#échantillon de 100 nombres aléatoires entre 10 et 20
echantillon=runif(n = 100, min = 10, max = 20)
mean(echantillon)
median(echantillon)
min(echantillon)
max(echantillon)




#Les fonctions rnorm(), mean(), sd(), hist(), quantile()
#avec representation graphique
#un échantillon de 20 nombres aléatoires avec une moyenne de -2 et un écart-type de 3.
#Calculez la moyenne et l'écart-type de cet échantillon.

echantillon1=rnorm(n=20, mean=-2,sd=3)
moyenne=mean(echantillon1)
ecarttype=sd(echantillon1)
hist(echantillon1)

#Calculez les quantiles à 25%, 50%, puis 75% de cet échantillon précédent.
quantile(echantillon1, probs = c(0.25))
quantile(echantillon1, probs = c(0.50))
quantile(echantillon1, probs = c(0.75))

#Calculez les déciles de cet échantillon précédent.
quantile(echantillon1, probs=seq(0.1,0.1)) 
#Calculez les centiles de cet échantillon précédent.
quantile(echantillon1, probs=seq(0.1,0.01))

#Les fonctions sum() , round()
#un échantillon de 3000 salaires aléatoires  avec une moyenne de 2400€ et un écart-type de 300€. 
#Calculez la moyenne et l'écart-type de cet échantillon.
salairealea=rnorm(n=3000, mean=2400, sd=300)
mean(salairealea)
sd(salairealea)

#Arrondir les salaires avec deux décimales.
salairealea=round(salairealea, 2)

#calculer la masse salariale
sum(salairealea)

#salaire median ?
median(salairealea)

#Interpréter le quantile 99%
quantile(salairealea, probs = 0.99)





#Les fonctions sample(), table(), prop.table() , unique(), sort()
#Simuler un lancé de dé avec la fonction sample().
sample(x=c(1,2,3,4,5,6),size=1)
#Simuler un lancé de dé 12 fois et stocker la simulation dans imulation.
simulation=sample(x = c(1,2,3,4,5,6), size = 12, replace = TRUE)
print(simulation)
unique(simulation) #chaque valeur apparue
table(simulation)
sort(table(simulation),decreasing=TRUE )
prop.table(table(simulation))
print("Non, ce n'est pas le cas")
