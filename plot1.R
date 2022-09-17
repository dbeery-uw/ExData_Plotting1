##Plot 1
library(tidyr)
library(dplyr)
library(ggplot2)
library(stringr)
library(lubridate)

household <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

tail(household$Date)
twoday <- household %>%
  filter(Date == c("1/2/2007", "2/2/2007"))

twoday[,3:9] <- sapply(twoday[,3:9], as.numeric)
twoday$date_time <- str_c(twoday$Date," " , twoday$Time)
twoday$date_time <- dmy_hms(twoday$date_time)

#Plot 1
png(file = "plot1.png")
hist(twoday$Global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
)
dev.off()
