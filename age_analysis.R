source("config.R")

df$Idade <- as.numeric(df$Idade)
idade_limpa <- df$Idade[!is.na(df$Idade)]

media_idade <- mean(idade_limpa)
mediana_idade <- median(idade_limpa)

get_moda <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}
moda_idade <- get_moda(idade_limpa)

desvio_padrao <- sd(idade_limpa)
variancia <- var(idade_limpa)
amplitude <- diff(range(idade_limpa))

quartis <- quantile(idade_limpa, probs = c(0.25, 0.5, 0.75))

cat("--- Estatística Descritiva: Idade da Vítima ---\n")
cat("Média:", media_idade, "\n")
cat("Mediana:", mediana_idade, "\n")
cat("Moda:", moda_idade, "\n")
cat("Desvio Padrão:", desvio_padrao, "\n")
cat("Variância:", variancia, "\n")
cat("Quartis (25%, 50%, 75%):\n")
print(quartis)

boxplot(idade_limpa, 
        main = "Distribuição de Idade das Vítimas (Boxplot)",
        ylab = "Idade",
        col = "lightblue",
        border = "darkblue",
        outline = TRUE)