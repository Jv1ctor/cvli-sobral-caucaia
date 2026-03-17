library(dplyr)
library(gt)
library(gtsummary)
source("config.R")


make_academic_table <- function(data, col_name, titulo, arquivo_saida = NULL) {
  tabela <- data %>%
    gt() %>%
    
    # Renomear colunas
    cols_label(
      !!sym(col_name) := "Variável",
      freq_simples = "n",
      freq_relativa = "%"
    ) %>%
    
    # Título
    tab_header(
      title = titulo
    ) %>%
    
    # Formatação
    cols_align(
      align = "center",
      c(freq_simples, freq_relativa)
    ) %>%
    
    cols_align(
      align = "left",
      all_of(col_name)
    ) %>%
    
    # Casas decimais
    fmt_number(
      columns = freq_relativa,
      decimals = 1
    ) %>%
    
    # Estilo acadêmico (limpo)
    tab_options(
      table.font.size = "small",
      data_row.padding = px(4)
    ) %>%
    
    # Fonte
    tab_source_note(
      source_note = "Fonte: SSPDS-CE (2026)"
    )
  
  return(tabela)
}


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

tabela_natureza <- df %>% 
  freq_simple_relative(fcolumn = Natureza) %>% 
  make_academic_table(col_name = "Natureza", titulo = "Tabela 1. Natureza dos casos")

tabela_empregado <- df %>% 
  freq_simple_relative(fcolumn = Meio.Empregado) %>% 
  make_academic_table(col_name = "Meio.Empregado", titulo = "Tabela 2. Meio empregado nos casos")

tabela_genero <- df %>% 
  freq_simple_relative(fcolumn = Gênero) %>% 
  make_academic_table(col_name = "Gênero", titulo = "Tabela 3. Gênero da vítima nos casos")

tabela_escolaridade <- df %>% 
  freq_simple_relative(fcolumn = Escolaridade.da.Vítima) %>% 
  make_academic_table(col_name = "Escolaridade.da.Vítima", titulo = "Tabela 4. Escolaridade da vítima nos casos")

tabela_raca <- df %>% 
  freq_simple_relative(fcolumn = Raça.da.Vítima) %>% 
  make_academic_table(col_name = "Raça.da.Vítima", titulo = "Tabela 5. Raça da vítima nos casos")

tabela_dia_semana <- df %>% 
  freq_simple_relative(fcolumn = Dia.da.Semana) %>% 
  make_academic_table(col_name = "Dia.da.Semana", titulo = "Tabela 6. Dia da semana dos casos")



tabela_natureza
tabela_empregado
tabela_genero
tabela_escolaridade
tabela_raca
tabela_dia_semana 
