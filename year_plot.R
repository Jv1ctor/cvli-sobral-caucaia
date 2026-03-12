library(gplots)

df <- data.frame(base)

# plot for year

df$Data <- as.Date(df$Data)
df <- df[!is.na(df$Data), ]
df$Ano <- format(df$Data, "%Y")

print(df$Ano)


contagem <- table(df$Ano)

anos <- as.numeric(names(contagem))
valores <- as.numeric(contagem)

plot(anos, valores,
     type = "l",
     lwd = 2,
     xlab = "Ano",
     ylab = "Quantidade",
     main = "Registros por Ano")
