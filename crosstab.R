library(gmodels)
source("config.R")


CrossTable(df$Meio.Empregado, df$Gênero_da_Vítima,
           prop.chisq = FALSE,
           prop.t = FALSE,
           format = "SPSS")


CrossTable(df$Escolaridade_da_Vítima, df$Raça_da_Vítima,
           prop.chisq = FALSE,
           prop.t = FALSE,
           format = "SPSS")