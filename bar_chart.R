source("config.R")

# Ajuste do nome da coluna conforme a base da SSPDS
cont_dia <- table(df$Dia_da_Semana) 

barplot(cont_dia,
        main = "Ocorrências por Dia da Semana",
        col = "orange",
        las = 2,
        cex.names = 0.8)

# Ajuste da escolaridade (geralmente é Escolaridade_Vitima ou Escolaridade)
cont_esc <- table(df$Escolaridade_Vitima)

barplot(cont_esc,
        main = "Escolaridade das Vítimas",
        col = "darkgreen",
        las = 2,
        cex.names = 0.7)
