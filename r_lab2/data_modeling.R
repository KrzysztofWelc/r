data1 <- read.csv("./data/data1.csv", sep=",", header=TRUE, nrow= 29, dec = ",", na.strings = "-")
data2 <- read.table("./data/data2.csv", sep=",", header=TRUE, nrow= 31, dec = ",", na.strings = "-")

class(data1)

data <- rbind(data1, data2)
names(data)
names(data) <- c("day.month","NO2", "NOx", "NO", "CO", "CO8h", "C6H6", "PM10", "PM25")
names(data)
summary(data)
str(data)
quantile(data$PM25, probs=seq(0,1,0.1), na.rm=TRUE)


for(i in names(data)) print(class(data[[i]]))
data[[1]] <- as.character(data[[1]])


for(i in 1:nrow(data)) {
  tmp <- strsplit(data[i,"day.month"],"\\.")[[1]]
  data[i,"day"] <- tmp[1]
  data[i,"month"] <- tmp[2]
}

data["year"] <- 2020
data <- data[,-1]

data$date <- as.Date(paste(data$year, data$month, data$day, sep="- "))
data <- data[,-(9:11)]

any(is.na(data$PM25))
!all(!is.na(data$PM25))

data[(data$PM10>50),]
data[which(data$PM10>50),]

data[which(data$PM10>50 | data$PM25>125),]


data[which(data$PM25 < quantile(data$PM25, na.rm=T, probs=0.25)),"pm25group"] <- "L"
data[which(data$PM25 >= quantile(data$PM25, na.rm=T, probs=0.25) & data$PM25 <= quantile(data$PM25, na.rm=T, probs=0.75)), "pm25group"] <- "M"
data[which(data$PM25 > quantile(data$PM25, na.rm=T, probs=0.75)), "pm25group"] <- "H"

data[which(data$PM10 < quantile(data$PM10, na.rm=T, probs=0.25)), "pm10group"] <- "L"
data[which(data$PM10 >= quantile(data$PM10, na.rm=T, probs=0.25) & data$PM10 <= quantile(data$PM10, na.rm=T, probs=0.75)), "pm10group"] <- "M"
data[which(data$PM10 > quantile(data$PM10, na.rm=T, probs=0.75)), "pm10group"] <- "H"

table(data$pm25group, data$pm10group)
sort(data$PM25, decreasing=TRUE)
data[order(data$PM25, decreasing = T),]

data %>% #wez´ dane z data
  filter(months(date) == "February") %>% #pozostaw tylko dane z lutego
  select(-(pm25group:pm10group)) %>% #ukryj kolumny pm25group oraz pm10group
  mutate(weekday=weekdays(date)) %>% #wyznacz dni tygodnia
  group_by(weekday) %>% #pogrupuj po dniu tygodnia
  summarize(PM25 = mean(PM25), PM10 = mean(PM10)) %>% #wys´wietl wartos´ci s´rednie dla kazÿdego dnia tygodnia
  arrange(desc(PM25)) #posortuj maleja??co wg PM25

library(reshape2)
melt_data <- melt(data, id=c("date"), measure.vars=c("NO2", "NOx", "NO", "CO", "CO8h","C6H6", "PM10", "PM25"))
dcast(melt_data, date ~ variable)
