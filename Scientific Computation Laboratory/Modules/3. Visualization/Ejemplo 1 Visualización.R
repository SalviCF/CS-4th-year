curve(sin(x^2)-x^2/2, from=-4, to=4)

# Dibujar una funci�n definida por el usuario
f1 <- function(x) { exp(x^2)/sin(x-1)
}#end function
f1(1)
f1(1:10)
curve(f1(x), from=0, to=2)
curve(1-f1(x), add = TRUE, col = "red")

library(datasets)
View(airquality)
plot(airquality$Ozone)
# el siguiente no es muy adecuado
plot(airquality$Month, airquality$Ozone)
# quitar ejes
plot(airquality$Ozone,axes=FALSE)
# quitar leyendas
plot(airquality$Ozone,axes=FALSE,ann=FALSE)

x=1:10
y=sin(x)
plot(x,y)
plot(x,y,type="l")
points(x,y,col="red")
# borrar gr�fico
dev.off()
plot(x,y)
lines(x,y, col="red")

# Instalar paquete de ejemplos de
# R Graphics Cookbook
install.packages("gcookbook")
library(gcookbook)
library(ggplot2)
View(BOD)

# 1. Creamos un objeto de tipo gr�fico
# Le indicamos los datos y ejes con aes
g1 <- ggplot(BOD, aes(x=Time, y=demand))

# 2. El objeto geom�trico ser� un gr�fico de puntos
g1 + geom_point()

# 3. A�adimos propiedades al objeto geom�trico con aes 
g1 + geom_point(aes(color = demand))


# Instalar paquete de ejemplos de
# R Graphics Cookbook
landdata_states <- read_csv("landdata-states.csv")
View(landdata_states)
head(landdata_states[1:5])
# Es un dataset con muchas filas. Cogemos un subconjunto
hp2001Q1 <- subset(landdata_states, Date == 2001.25)

# 1. Creamos un objeto de tipo gr�fico
# Le indicamos los datos y ejes con aes
p1 <- ggplot(hp2001Q1, aes(x = log(Land.Value),
                           y = Structure.Cost))

# 2. El objeto geom�trico ser� un gr�fico de puntos
#    Adem�s a�adimos un suavizado
p1 +  geom_point(aes(color = Home.Value)) + geom_smooth()

# Gr�fico de puntos pero diferenciando valores por otra columna
p1 + geom_point(aes(color=Home.Value, shape=region))

# Otro ejemplo de gr�fico de puntos
ggplot(subset(landdata_states, State %in% c("MA", "TX")),
       aes(x=Date,
           y=Home.Value,
           color=State))+geom_point()

library(gcookbook)
View(pg_mean)

# 1. Creaci�n del objeto, ejes y objeto geom�trico
ggplot(pg_mean, aes(x=group, y=weight)) +
  geom_bar(stat="identity")

# Convertir a factor si la variable no es continua
View(BOD)

# 1. Creaci�n del objeto gr�fico, ejes con aes y objeto geom�trico
ggplot(BOD, aes(x=Time, y=demand)) +
  geom_bar(stat="identity")

ggplot(BOD, aes(x=factor(Time), y=demand)) +
  geom_bar(stat="identity")

# Para cambiar colores de las barras
ggplot(pg_mean, aes(x=group, y=weight)) +
  geom_bar(stat="identity", fill="lightblue",
           colour="black")

# Ayuda de comando rank
x <- c(2,5,1,7)
rank(x)
order(x)
rank(x)
subset(x,rank(x)>2)

# Vamos a ver c�mo agrupar barras seg�n el valor de otra variable.

library(gcookbook)
View(cabbage_exp)

ggplot(cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar)) +
  geom_bar(stat = "identity")

upc <- subset(uspopchange, rank(Change)>40)

ggplot(upc, aes(x=Abb, y=Change, fill=Region)) +
  geom_bar(stat="identity")

ggplot(upc, aes(x=reorder(Abb, Change), y=Change,
                fill=Region)) +
  geom_bar(stat="identity", colour="black") +
  scale_fill_manual(values=c("#669933", "#FFCC66")) +
  xlab("State")

library(gcookbook)
View(mtcars)
hist(mtcars$mpg)
hist(mtcars$mpg, breaks=5)

# Con paquete ggplot2
qplot(mtcars$mpg)
qplot(mpg, data=mtcars, binwidth=5)

# El mismo resultado con
ggplot(mtcars, aes(x=mpg)) + geom_histogram(binwidth=4)

