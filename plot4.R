library(data.table)
library(tidyverse)
library(lubridate)

#read in power dataset
power <- read.table("C:/Users/megan/Downloads/exdata_data_household_power_consumption/household_power_consumption.txt",
                    sep = ";", header = TRUE, na.strings="?", nrows=2075259) 

#change Date to a Posixct variable and then filter for the appropriate dates
subpower = power %>% 
      filter(Date == "2007-02-01" | Date =="2007-02-02") %>% 
      mutate(Date = dmy(Date),
             Datetime = paste(Date,Time),
             Datetime = ymd_hms(Datetime))

#create a 2x2 plot matrix
png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

with(subpower, plot(Datetime, Global_active_power, xlab = "", ylab = "Global Active Power", type = "l"))

with(subpower, plot(Datetime, Voltage, xlab = "datetime", ylab = "Voltage", type = "l"))

with(subpower, plot(Datetime, Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "n"))
with(subpower, lines(Datetime, Sub_metering_1,  col="black"))
with(subpower, lines(Datetime, Sub_metering_2,  col="red"))
with(subpower, lines(Datetime, Sub_metering_3,  col = "blue"))
legend("topright",inset = 0.02, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"),box.lty = 0,lty=1)

with(subpower, plot(Datetime, Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l"))

dev.off()
