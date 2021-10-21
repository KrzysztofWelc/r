library(dplyr)

data <- read.csv('./data.csv', sep=";", header=T, dec=".")
data = data[ ,-3]
names(data) <- c("date", "pm2.5")
data$date <- as.Date(data$date)
data <- filter(data, weekdays(data$date) == "poniedzia³ek")
pmMean <- mean(data$pm2.5)
