source("config.R")

tab_meio_genero <- table(df$Meio_Empregado, df$Genero)
perc_meio_genero <- prop.table(tab_meio_genero, margin = 2) * 100

cat("\n--- Tabela Cruzada: Meio Empregado vs Género ---\n")
print(tab_meio_genero)
cat("\n--- Percentagem por Género (Coluna) ---\n")
print(round(perc_meio_genero, 2))

tab_escola_raca <- table(df$Escolaridade, df$Raca)
perc_escola_raca <- prop.table(tab_escola_raca, margin = 2) * 100

cat("\n--- Tabela Cruzada: Escolaridade vs Raça ---\n")
print(tab_escola_raca)
cat("\n--- Percentagem por Raça (Coluna) ---\n")
print(round(perc_escola_raca, 2))