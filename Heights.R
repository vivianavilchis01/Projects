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


