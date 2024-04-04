install.packages("xlsx")
pokemon=readxl::read_excel(path = "C:/Users/isaaq/Downloads/pokemon.xlsx", sheet = "pokemon")

#facile : 
nb_ligne = nrow(pokemon) #nb ligne 
nb_dim = dim(pokemon) #nb dim
nb_col = ncol(pokemon) #nb colonne
summary(pokemon) #résumé du fichier 



#as factor: nomdata$variable=as.factor(nomdata$variable) :
pokemon$generation=as.factor(pokemon$generation)
pokemon$is_legendary=as.factor(pokemon$is_legendary)
pokemon$type=as.factor(pokemon$type)
summary(pokemon)


#creer un groupe dans un data :
mediane=median(pokemon$attack)
pokemon$attack_group=ifelse(pokemon$attack >= mediane, yes="attack+", no="attack-")
pokemon$attackgroup=as.factor(pokemon$attack_group)
summary(pokemon)


pokemon$water_fire=ifelse(pokemon$type %in% c("fire","water"), yes="water",no="fire")   #/!/
summary(pokemon)




attack_q3=quantile(pokemon$attack,probs=0.75)
defense_q3=quantile(pokemon$defense,probs=0.75)
speed_q3=quantile(pokemon$speed,probs=0.75)
pokemon$best=ifelse(pokemon$attack>=attack_q3 &
                    pokemon$defense>=defense_q3 &
                    pokemon$speed>=speed_q3, 
                    yes = "best", no="mid")
pokemon$best=as.factor(pokemon$best)
summary(pokemon)





#filtrer(regrouper)les données dans "requete" :
requete=subset(pokemon,is.na(pokemon$weight_kg))
View(requete)
requete=subset(pokemon,!is.na(pokemon$weight_kg))



medianekg=median(pokemon$weight_kg,na.rm = TRUE) #MEDIANE VALEUR NA
medianem=median(pokemon$height_m,na.rm = TRUE) #MEDIANE VALEUR NA


#remplacer valeurs  NA par leur valeurs médianne : 
pokemon$weight_kgNA=ifelse(is.na(pokemon$weight_kg),medianekg,pokemon$weight_kg)
pokemon$height_m=ifelse(is.na(pokemon$height_m),medianem,pokemon$height_m)
summary(pokemon)



# Regrouper en X tranches :
pokemon$weight_group=cut(pokemon$weight_kg,
                         breaks=3,
                         labels =c("leger","moyen","lourd"))


pokemon$height_m_group = cut(pokemon$height_m,
                             breaks = c(0,1,2,3,max(pokemon$height_m,
                                        na.rm = TRUE)))


#tranche par quantile :          
pokemon$defense_group = cut(pokemon$defense,
                            breaks = quantile(pokemon$defense,
                                      na.rm=TRUE),
                                      include.lowest = TRUE)
summary(pokemon$defense_group)





#calculer la moyenne attack par type : 
aggregate(x = attack ~ type,
              data=pokemon,
              FUN = function(x) mean(x))


#La Mediane attack par type+generation:
aggregate(x = attack  ~ type+generation,
              data=pokemon,
              FUN=function(x) median(x))


#Effectif par type
aggregate(x= pokedex_number ~ type,
             data=pokemon,
             FUN = function(x) length(x))

#moyenne  mediane de speed  pour chaque generation et type. Afficherles effectifs 
aggregate(speed ~ generation + type,
          data = pokemon, 
          FUN = function(x) c(moy = mean(x),
                              med = median(x),
                              eff = length(x) ))




























