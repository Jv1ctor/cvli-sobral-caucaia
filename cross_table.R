library(gmodels)
library(gt)
library(gtsummary)
library(dplyr)
library(tidyr)
source("config.R")

make_crosstable_n_percent <- function(data, var1, var2, titulo,
  tipo = "row", # "row", "col", "total"
  arquivo_saida = NULL) {
  # Tabela de frequência
  tab <- table(data[[var1]], data[[var2]])
  # Percentual
  prop <- switch(tipo,
                 "row" = prop.table(tab, 1),
                 "col" = prop.table(tab, 2),
                 "total" = prop.table(tab)
  )
  
  # Transformar em data.frame
  df_freq <- as.data.frame(tab)
  df_prop <- as.data.frame(prop)
  
  # Combinar n + %
  df_final <- df_freq %>%
    mutate(
      percent = round(df_prop$Freq * 100, 1),
      valor = paste0(Freq, " (", percent, "%)")
    ) %>%
    select(Var1, Var2, valor) %>%
    pivot_wider(names_from = Var2, values_from = valor)
  
  # Criar tabela acadêmica
  tabela <- df_final %>%
    gt() %>%
    tab_header(
      title = titulo,
      subtitle = paste(
        "Valores apresentados como n (%) por", 
        switch(
          tipo, 
          "row" = "linha", 
          "col" = "coluna", 
          "total" = "total"
        )
    )) %>%
    cols_align(align = "center", -Var1) %>%
    cols_align(align = "left", Var1) %>%
    cols_label(Var1 = "") %>%
    tab_source_note(
      source_note = "Fonte: SSPDS-CE (2026)"
    ) %>%
    tab_options(
      table.font.size = "small"
    )
  
  return(tabela)
}

make_crosstable_n_percent(
  df,
  "Meio.Empregado",
  "Gênero",
  "Tabela 1. Meio empregado por gênero",
  tipo = "row",
)

make_crosstable_n_percent(
  df,
  "Escolaridade.da.Vítima",
  "Raça.da.Vítima",
  "Tabela 2. Escolaridade por Raça",
  tipo = "row",
)



# CrossTable(df$Meio.Empregado, df$Gênero,
#           prop.chisq = FALSE,
#           prop.t = FALSE,
#           format = "SPSS")


# CrossTable(df$Escolaridade.da.Vítima, df$Raça.da.Vítima,
#           prop.chisq = FALSE,
#           prop.t = FALSE,
#           format = "SPSS")