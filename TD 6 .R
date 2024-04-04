df=read.csv(file = "nba2014_2015.csv", sep = ",",
               header = TRUE, dec = ".")
nrow(nba) --> nrow(df)
ncol(nba) --> ncol(df)
colname(nba) --> colnames(df)
df$Period = as.factor(df$Period) --> df$PERIOD=as.factor(df$PERIOD)
df$PTSTYPE = as.factor(df$PTSTYPE) --> df$PTS_TYPE=as.factor(df$PTS_TYPE)
df$SHOOTER = as.factor(df$shooter) --> df$SHOOTER=as.factor(df$SHOOTER)






#/////////////////#SCRIPT N°2 :////////////////////////

lenght(level(df$Period)) -->length(levels(df$PERIOD))
lenght(df$PTSTYPE) --> length(df$PTS_TYPE)
lenght(df$SHOTER) --> length(df$SHOOTER)
summary(ddf) --> summary(df)

sd(DF$SHOT_DIST --> sd(df$SHOT_DIST)
sd[df$SHOT_CLOCK] --> sd(df$SHOT_CLOCK, na.rm = TRUE)

table(df[ "SHOT_RESULTS" , ]) --> table(df$SHOT_RESULT)

liste_game=unique(df$GAME_ID)) --> nb_match=unique(df$GAME_ID)
length(listegame) --> length(nb_match)

df$SHOOTER=as_factor(df$SHOOTER)--> df$SHOOTER=as.factor(df$SHOOTER)
nlevel(df$SHOOTER--> nlevels(df$SHOOTER)
nba$SHOT_DIST_METRE == SHOT_DIST * 0.30 -> df$SHOT_DIST_METRE= df$SHOT_DIST*0.30
df$PTS_MARQUES=ifelse(df$SHOT_RESULT = "made", yes = df$PTS_TYPE, 0) --> df$PTS_MARQUES= ifelse(df$SHOT_RESULT == "made",yes=df$PTS_TYPE,0)
#On supprime la variable GAME_RESULT car elle n'est pas utile
df$GAME_RESULT=NUL --> rm(df$GAME_RESULT)
df2=df[ -1  ,  ] --> df2=df[,-1 ]





#/////////////////#SCRIPT N°3 :////////////////////////
rang=order(df$SHOT_DIST, decreasing = TRUE)  
df<-df[rang,]
df3=df[ 1 : 100 ; ] --> df3 <-df3[1:100,]

#Les 100 tirs réussis les plus loin
df4 = subset(df3, SHOT_RESULT = "made") --> df4=subset(df,df$SHOT_RESULT=="made")
df4 <- df[ 1 : 100 ; ]--> df4<- df4[1:100,]

#Combien de tirs à 3 points a réussi Kobe Bryant ?
df_kobe = subset(df,SHOT_RESULT = made &
                   PTS_TYPE = 3 & 
                   SHOOTER = "Kobe BRYANT")

df_kobe=subset(df, SHOT_RESULT== "made" &
                   PTS_TYPE==3 &
                   SHOOTER== "kobe bryant")
dim(df_kobe)



#Le TOP5 des joueurs qui ont marqués le plus de points dans la saison
df_total <- aggregate(PTS_MARQUES ~ SHOOTER, data = df, FUN = sum)
df_total_tri <- df_total[-order(df_total$PTS_MARQUES)]
df_top5 <-  df_total_tri[  5  ,  ]




