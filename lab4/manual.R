setwd("C:/Users/student/Desktop/welc_r")

library(ggplot2)

dane <- dget("dane_pomiarowe2019_al_krasinskiego")

y <- dane$PM25
x <- dane$PM10

good <- complete.cases(x,y)
y <- y[good]
x <- x[good]


df <- data.frame(x, y)
ggplot(data=df) + geom_point(aes(x,y))

n <- length(x)
l <- (n*sum(x*y)- sum(x)*sum(y))
m <- sqrt((n*sum(x^2) - sum(x)^2)*(n*sum(y^2) - sum(y)^2))
r <- l/m

cor(x,y)

ymean <- mean(y)
xmean <- mean(x)
y <- y - ymean
x <- x - xmean

sum_of_the_squared <- function(y,x,a){
  sum <- 0
  for (i in seq_along(y)){
    sum <- sum + (y[i] - a*x[i])^2
  }
  sum 
}

find_a <- function(y,x,a_vector){
  min_sum <- Inf
  min_a <- NA
  for(a in a_vector){
    sum <- sum_of_the_squared(y,x,a)
    if(sum < min_sum){
      min_sum <- sum_of_the_squared(y,x,a)
      min_a <- a
    }
  }
  min_a
}

a <- 0
for (i in 0:7){
  seq(a-10^(-i+1), a+10^(-i+1), 10^(-i))
  a <- find_a(y,x,seq(a-10^(-i+1), a+10^(-i+1), 10^(-i)))
  print(a)
}


model <- lm(y ~ x)
model$coefficients["x"]

model$coefficients["x"] - a

df <- data.frame(x,y)
p1 <- ggplot(data=df) + geom_point(aes(x,y))
p1 + geom_smooth(aes(x,y), method = "lm", se = TRUE)

data <- mtcars[, c("mpg", "disp", "hp", "wt")]
data_train <- data[1:30,]
data_test <- data[31:32,]

attach(data_train)
model_cars <- lm(mpg~ disp + hp + wt, data = data_train)

summary(model_cars)
b <- coef(model_cars)[1]
a2 <- coef(model_cars)[2]
a3 <- coef(model_cars)[4]

x2 = data_test$hp
x3 = data_test$wt
mpg_predicted = b + a2*x2 + a3*x3
