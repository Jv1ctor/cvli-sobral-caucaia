source("config.R")

cont_dia <- table(df$Dia_Semana)
barplot(cont_dia, 
        main = "Ocorrências por Dia da Semana", 
        col = "orange", 
        las = 2, 
        cex.names = 0.8)

cont_esc <- table(df$Escolaridade)
barplot(cont_esc, 
        main = "Escolaridade das Vítimas", 
        col = "darkgreen", 
        las = 2, 
        cex.names = 0.7)