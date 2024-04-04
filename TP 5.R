library(tools)
print(fichiers[1])
nom_fichier = basename(path = fichiers[1])
nom_fichier_sans_extension = file_path_sans_ext(x = nom_fichier)
print(nom_fichier_sans_extension)



assign(x = nom_fichier_sans_extension, 
       value = read.csv(fichiers[1],
                        sep = ",",
                        dec = "."))

# Boucle pour lire chaque fichier CSV :
for (fichier in fichiers) {
  # Extraire le nom du fichier sans extension :
  nom_objet = file_path_sans_ext(basename(fichier))
  
  # Lire le fichier CSV et l'affecter à une variable avec le nom du fichier
  start_time=Sys.time()
  assign(nom_objet, read.csv(fichier, 
                             sep = ",",
                             dec = "."))
  end_time = Sys.time()
  # Calcul du temps écoulé
  execution_time = end_time - start_time
  cat("Importation : ",nom_objet, "=" , execution_time , "\n")
}

#CMB MATCH A LOS ANGELES DEPUIS CREATION NBA :

df_x = subset(team,city =="Los Angeles", select =c ("id","city"))
df_y = subset(game, select = c("game_id","team_id_home"))
dfjoin=merge(x=df_x, y=df_y,
             by.x="id",
             by.y="team_id_home",
             all.x=TRUE)

nrow(dfjoin)



#affluence moyenne de spectateur durant matchs LA : 
df_x= dfjoin
df_y= subset(game_info, select = c("game_id","attendance"))
dfjoin= merge(x=df_x, y=df_y,
             by.x="game_id",
             all.x=TRUE)
mean(dfjoin$attendance,na.rm=TRUE)

#CMB arbitres différents saison 2020 : 
df_x = subset(game_summary, season == 2020,
              select ="game_id")
dfjoin= merge(x=df_x,y=officials,
      by.x="game_id",
      all.x=TRUE)

#CMB MATCH DICK BAVETTA : 
df_x= subset(officials,last_name=="Bavetta",
             select = c("game_id"))
nrow(df_x)



