source("config.R")


gerar_tabela <- function(coluna, nome_var) {
  freq_abs <- table(coluna)
  freq_rel <- prop.table(freq_abs) * 100
  tabela <- cbind(Frequencia = freq_abs, Percentagem = round(freq_rel, 2))
  cat("\n--- Tabela de Frequência:", nome_var, "---\n")
  print(tabela)
  return(tabela)
}

tab_natureza <- gerar_tabela(df$Natureza_da_Vitima, "Natureza da vítima")

tab_meio <- gerar_tabela(df$Meio_Empregado, "Meio Empregado")

tab_genero <- gerar_tabela(df$Genero_da_Vitima, "Genero da vítima")

tab_escolaridade <- gerar_tabela(df$Escolaridade_da_Vitima, "Escolaridade da vítima")

tab_raca <- gerar_tabela(df$Raca_da_Vitima, "Raça da vítima")

tab_dia <- gerar_tabela(df$Dia_Semana, "Dia da Semana")