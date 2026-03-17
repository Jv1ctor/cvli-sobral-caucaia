library(lubridate)
source("config.R")


df$Hora_Cheia <- floor_date(df$Hora, unit = "hour")

contagem <- table(df$Hora_Cheia)

contagem_df <- data.frame(
  Hora_Cheia = as_datetime(names(contagem)),
  Quantidade = as.numeric(contagem)
)

plot(contagem_df$Hora_Cheia, contagem_df$Quantidade, 
     type = "l", 
     main = "Picos de Ocorrências por Horário",
     xlab = "Hora do Dia", 
     ylab = "Quantidade de Crimes",
     col = "blue", 
     lwd = 2)
