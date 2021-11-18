setwd("C:/Users/student/Desktop/welc_r")

library(ggplot2)

dane <- dget("dane_pomiarowe2019_al_krasinskiego")

data <- dane[, c("PM25", "PM10", "NO2")]
pm10 <- data$PM10
pm25 <- data$PM25
no2 <- data$NO2

good <- complete.cases(data$PM25, data$NO2,  data$PM10)

pm10 <- pm10[good]
pm25 <- pm25[good]
no2 <- no2[good]

cor(pm25, no2)
cor(pm25, pm10)
cor(no2, pm10)

model <- lm(pm25 ~ pm10)
df = data.frame(pm25, pm10)
p <- ggplot(data = df)+ geom_point(aes(pm10,pm25))
p + geom_smooth(aes(pm10, pm25), method = "lm", se = TRUE)
