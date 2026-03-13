library(lubridate)
source("config.R")

df$Hora_Cheia <- floor_date(df$Hora, unit = "hour")

# Contagem por hora, garantindo inclusão de horas sem registros
contagem <- table(df$Hora_Cheia)

# Sequência completa de horas entre o mínimo e o máximo observado
horas_completas <- seq(from = min(df$Hora_Cheia, na.rm = TRUE),
                       to   = max(df$Hora_Cheia, na.rm = TRUE),
                       by   = "hour")

# Converter tabela de contagem em data frame
contagem_df <- data.frame(
    Hora_Cheia = as_datetime(names(contagem)),
    Quantidade = as.numeric(contagem)
)

# Juntar com a sequência completa e preencher NAs com zero
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
