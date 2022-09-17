##Plot 3
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

png(file = "plot3.png")
plot(twoday$date_time, twoday$Sub_metering_1, 
     type = "l",
     xlab = " ",
     ylab = "Energy sub meeting")
lines(twoday$date_time, twoday$Sub_metering_2,
      col = "red")
lines(twoday$date_time, twoday$Sub_metering_3,
      col = "blue")
legend("topright", cex = .75, lty = 1, lwd = 2, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

