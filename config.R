meses_pt <- c("Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", 
              "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro")
df <- data.frame(base)

# derive date/time fields (year, month, hour) for plotting

df$Data <- as.Date(df$Data)
df <- df[!is.na(df$Data), ]
df$Ano <- format(df$Data, "%Y")

idx_mes <- as.numeric(format(df$Data, "%m"))

df$Mes_Num <- idx_mes
df$Mes <- meses_pt[idx_mes]


hora_formatada <- as.POSIXct(df$Hora, format="%H:%M")

df$Hora <- hora_formatada

