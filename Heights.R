library(dslabs)
library(dplyr)
data(heights)
options(digits = 3)    # 3 cifras significativas
#Determinar cuántas personas están por arriba de la altura promedio
ind <- heights$height > mean(heights$height)
sum(ind)
#Determinar cuántas personas están por arriba de la altura promedio Y son mujeres
sum(ind & heights$sex=="Female")
#Determinar la proporción de mujeres en el dataset
mean(heights$sex == "Female")
#Determinar la altura mínima del dataset
min(heights$height)
#Determinar la altura máxima del dataset
max(heights$height)
#agrega una columna al dataset que mida la altura en cm
heights2 <- mutate(heights, ht_cm = height*2.54)
head(heights2)
#Cuál es la altura promedio en centimetros?
avg(heights2$ht_cm)
#Crea un dataframe que contenga solo las alturas de las mujeres
females <- filter(heights, sex == "Female")
head(females)
#Cuántas mujeres hay en el datsset?
nrow(females)
#Cuál es la altura promedio de las mujeres en el dataset en cm?
mean(females$ht_cm)


