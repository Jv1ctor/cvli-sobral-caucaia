library(dplyr)



tabela_res <- data.frame(
  df %>%
  count(Natureza, name = "freq_simples") %>%
  mutate(freq_relativa = round(freq_simples / sum(freq_simples) * 100, 1)) %>%
  arrange(desc(freq_simples)) %>%
  select(Natureza, freq_simples, freq_relativa)
) 

tabela_res
table(df$Natureza)
