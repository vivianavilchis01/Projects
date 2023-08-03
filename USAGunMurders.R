# Cargar las bibliotecas y los datos
library(tidyverse)
library(dslabs)
data(murders)

# Configurar el objeto murders
murders <- murders %>%
    mutate(murder_rate = total/population * 100000)
    
# Ordenar por la columna de población, de menor a mayor
murders %>% arrange(population) %>% head()
# Ordenar por tasa de asesinatos, de menor a mayor
murders %>% arrange(murder_rate) %>% head()
# Ordenar por tasa de asesinatos en orden descendente
murders %>% arrange(desc(murder_rate)) %>% head()
# Ordenar por región alfabéticamente, luego por tasa de asesinatos dentro de cada región
murders %>% arrange(region, murder_rate) %>% head()
# Mostrar los 10 estados con la tasa de asesinatos más alta, no ordenados por tasa
murders %>% top_n(10, murder_rate)
# Mostrar los 10 estados con la tasa de asesinatos más alta, ordenados por tasa
murders %>% arrange(desc(murder_rate)) %>% top_n(10)
# Creación de gráficos
p <- murders %>% ggplot(aes(population/10^6, total, label = abb)) +
  geom_text(nudge_x = 0.075) +
  scale_x_log10() +
  scale_y_log10() +
  xlab("Poblaciones en millones (escala logarítmica)") +
  ylab("Número total de asesinatos (escala logarítmica)") +
  ggtitle("Asesinatos por armas de fuego en EE.UU. 2010")
p + geom_point(aes(col=region), size = 3)
