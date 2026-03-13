source("config.R")

contagem <- table(df$Ano)

anos <- as.numeric(names(contagem))
valores <- as.numeric(contagem)

plot(anos, valores,
     type = "l",
     col = "blue",
     lwd = 2,
     xlab = "Ano",
     ylab = "Quantidade",
     main = "Registros por Ano")
