library(readxl)
base <- read_excel("base.xlsx")
View(base)

meses_pt <- c("Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", 
              "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro")
df <- data.frame(base)

df$Data <- as.Date(df$Data)
df <- na.omit(df)
df$Ano <- format(df$Data, "%Y")

idx_mes <- as.numeric(format(df$Data, "%m"))

df$Mes_Num <- idx_mes
df$Mes <- meses_pt[idx_mes]


hora_formatada <- as.POSIXct(df$Hora, format="%H:%M")

df$Hora <- hora_formatada
