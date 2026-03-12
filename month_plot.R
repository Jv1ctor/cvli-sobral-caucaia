library(gplots)
source("config.R")

contagem <- table(df$Mes_Num)

mes_num <- as.numeric(names(contagem))
valores <- as.numeric(contagem)

plot(mes_num, valores,
     type = "l",
     lwd = 2,
     col= "blue",
     xaxt = "n",
     xlab = "Mes",
     ylab = "Quantidade",
     main = "Registros por Mes")

axis(1, at = 1:12,labels = meses_pt, las = 2, cex.axis = 0.7)
