#EXERCICE 1 : 

#creer une fonction : 
salaire_net_cadre = function(salaire_brut=2500,tempstravail=0.5)
  {
    if (!is.numeric(salaire_brut)) 
    {return("Erreur")}
  
  if (!is.numeric(tempstravail) & (tempstravail <= 0) & (tempstravail >= 1)) 
    {return("Erreur")}
  
  salaire_net_cadre = salaire_brut * 0.75 * tempstravail
  return(salaire_net_cadre)   }



#test de la fonction : 
salaire_net_cadre(salaire_brut = 5000,
                  tempstravail = 1)







#salaire_net = function(salaire_brut=2500, tempstravail=0.5,statut)
#{
  if(statut ==2)
  {salairenet=salaire_brut*0.78*tempstravail
    return(salairenet)
  
  } else{salairenet=salaire_brut*0.75*tempstravail
  return(salairenet)} 

            

salaire_net_cadre(salaire_brut = 5000,
                  tempstravail = 1, statut=1)







salairenetCorr = function(salaire_brut = 2500,temps_travail = 1, statut) 
{
  
  if (!is.numeric(salaire_brut))
    {return("Erreur")}
  
  if (is.numeric(temps_travail) & (temps_travail >= 0) & (temps_travail <= 1)) 
    {return("Erreur")}
  
  if (!statut %in% c("cadre","non cadre")) 
    {return("Erreur")}
  
  if (statut == "cadre") {
    salaire_net_avant_impot = salaire_brut * temps_travail * 0.75
  } else {
    salaire_net_avant_impot = salaire_brut * temps_travail * 0.78
  }
  
  if (salaire_net_avant_impot <= 1591) {
    salaire_net_apres_impot = salaire_net_avant_impot
  } else if (salaire_net_avant_impot <= 2006) {
    salaire_net_apres_impot = salaire_net_avant_impot * (1 - 0.029)
  } else if (salaire_net_avant_impot <= 3476) {
    salaire_net_apres_impot = salaire_net_avant_impot * (1 - 0.099)
  } else if (salaire_net_avant_impot <= 8557) {
    salaire_net_apres_impot = salaire_net_avant_impot * (1 - 0.20)
  } else {
    salaire_net_apres_impot = salaire_net_avant_impot * (1 - 0.43)
  }
  return(salaire_net_avant_impot) 
}

salairenetCorr(salaire_brut = 2000, statut = "cadre")
salairenetCorr(salaire_brut = 2000, statut = "non cadre")




resultat=0
for(i in c(1,2,3,4,5)) {resultat=resultat+i}
print(resultat)
rm(i)


i = 1
resultat=1
while (resultat<50) {resultat=resultat+i
print(paste("le resultat est : ",resultat))
print(paste("le programme s'est arrêté à la valeur : ", i))
i = i + 1}

for(i in col(iris)
    )

























