
data <- read.table("household_power_consumption.txt", sep=";", header = TRUE, stringsAsFactors = FALSE)
library(dplyr)
library(lubridate)
data <- data %>% filter(Date=="1/2/2007" | Date=="2/2/2007")
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)


with(data1, {plot(Global_active_power~Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="")})
dev.copy(png, "plot2.png", width=480, height=480)
dev.off()

