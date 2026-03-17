library(lubridate)
source("config.R")

df$Hora_Cheia <- floor_date(df$Hora, unit = "hour")

contagem <- table(df$Hora_Cheia)


horas_completas <- seq(from = min(df$Hora_Cheia, na.rm = TRUE),
                       to   = max(df$Hora_Cheia, na.rm = TRUE),
                       by   = "hour")


contagem_df <- data.frame(
    Hora_Cheia = as_datetime(names(contagem)),
    Quantidade = as.numeric(contagem)
)


horas_df <- data.frame(Hora_Cheia = horas_completas)
contagem_completa <- merge(horas_df, contagem_df, by = "Hora_Cheia", all.x = TRUE)
contagem_completa$Quantidade[is.na(contagem_completa$Quantidade)] <- 0

eixo_x <- contagem_completa$Hora_Cheia
valores <- contagem_completa$Quantidade

plot(eixo_x, valores,
     type = "l",
     lwd = 2,
     xaxt = "n",
     col= "blue",
     xlab = "Horário",
     ylab = "Quantidade",
     main = "Registros por Hora")

axis.POSIXct(1, at = eixo_x, format = "%H:%M", las = 2)
