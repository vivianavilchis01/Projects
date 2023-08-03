# importar datos e inspeccionar
library(tidyverse)
library(dslabs)
data(us_contagious_diseases)
str(us_contagious_diseases)
# asignar a dat la tasa de sarampión por 10,000, eliminando Alaska y Hawaii y ajustando por semanas reportadas
la_enfermedad <- "Measles"
dat <- us_contagious_diseases %>%
  filter(!state %in% c("Hawaii", "Alaska") & disease == la_enfermedad) %>%
  mutate(rate = count / population * 10000 * 52/weeks_reporting) %>%
  mutate(state = reorder(state, rate))

# trazar las tasas de enfermedades por año en California
dat %>% filter(state == "California" & !is.na(rate)) %>%
  ggplot(aes(year, rate)) +
  geom_line() +
  ylab("Casos por 10,000") +
  geom_vline(xintercept=1963, col = "hotpink")

# calcular la tasa promedio de sarampión en los Estados Unidos por año
promedio <- us_contagious_diseases %>%
  filter(disease == la_enfermedad) %>% group_by(year) %>%
  summarize(us_rate = sum(count, na.rm = TRUE)/sum(population, na.rm = TRUE)*10000)

# hacer un gráfico de líneas de la tasa de sarampión por año por estado
dat %>%
  filter(!is.na(rate)) %>%
  ggplot() +
  geom_line(aes(year, rate, group = state), color = "pink", 
            show.legend = FALSE, alpha = 0.2, size = 1) +
  geom_line(mapping = aes(year, us_rate), data = promedio, size = 1, col = "hotpink") +
  scale_y_continuous(trans = "sqrt", breaks = c(5, 25, 125, 300)) +
  ggtitle("Casos por 10,000 por estado") +
  xlab("") +
  ylab("") +
  geom_text(data = data.frame(x = 1955, y = 50),
            mapping = aes(x, y, label = "Promedio EE.UU."), color = "hotpink") +
  geom_vline(xintercept = 1963, col = "hotpink")

