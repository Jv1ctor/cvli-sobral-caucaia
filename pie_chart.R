source("config.R")

fat_genero <- table(df$Genero)
pie(fat_genero, 
    main = "Distribuição por Género", 
    col = c("pink", "lightblue"),
    labels = paste0(names(fat_genero), " (", round(prop.table(fat_genero)*100, 1), "%)"))

fat_meio <- table(df$Meio_Empregado)
pie(fat_meio, 
    main = "Meio Empregado nas Ocorrências", 
    col = rainbow(length(fat_meio)),
    labels = paste0(names(fat_meio), " (", round(prop.table(fat_meio)*100, 1), "%)"))