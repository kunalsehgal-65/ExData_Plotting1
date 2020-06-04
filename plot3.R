data <- read.table("household_power_consumption.txt", sep=";", header = TRUE, stringsAsFactors = FALSE)
library(dplyr)
library(lubridate)
data <- data %>% filter(Date=="1/2/2007" | Date=="2/2/2007")
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)

with(data1, {
  plot(Sub_metering_1~Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, "plot3.png", width=480, height=480)
dev.off()
