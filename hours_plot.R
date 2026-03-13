library(lubridate)
source("config.R")

df$Hora_Cheia <- floor_date(df$Hora, unit = "hour")

contagem <- table(df$Hora_Cheia)

eixo_x <- as_datetime(names(contagem))
valores <- as.numeric(contagem)

plot(eixo_x, valores,
     type = "l",
     lwd = 2,
     xaxt = "n",
     col= "blue",
     xlab = "Horário",
     ylab = "Quantidade",
     main = "Registros por Hora")

axis.POSIXct(1, at = eixo_x, format = "%H:%M", las = 2)
