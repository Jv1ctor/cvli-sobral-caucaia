library(dplyr)
source("config.R")

#' Frequência Simples e Relativa
#' @param fdataframe Um data frame ou tibble.
#' @param fcolumn A coluna para contar (suporta tidy-select).
#' @export
freq_simple_relative <- function(fdataframe, fcolumn){
  result <- data.frame(
    fdataframe %>%
      count({{ fcolumn }}, name = "freq_simples") %>%
      mutate(freq_relativa = round(freq_simples / sum(freq_simples) * 100, 1)) %>%
      arrange(desc(freq_simples)) %>%
      select({{ fcolumn }}, freq_simples, freq_relativa)
  ) 
  
  return (result)
}

tabela_natureza <- df %>% freq_simple_relative(fcolumn = Natureza)
tabela_empregado <- df %>% freq_simple_relative(fcolumn = Meio.Empregado)
tabela_genero <- df %>% freq_simple_relative(fcolumn = Gênero)
tabela_escolaridade <- df %>% freq_simple_relative(fcolumn = Escolaridade.da.Vítima)
tabela_raca <- df %>% freq_simple_relative(fcolumn = Raça.da.Vítima)
tabela_dia_semana <- df %>% freq_simple_relative(fcolumn = Dia.da.Semana)


tabela_natureza
tabela_empregado
tabela_genero
tabela_escolaridade
tabela_raca
tabela_dia_semana


