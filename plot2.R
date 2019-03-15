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
      
#plot global active power by time
png("plot2.png", width=480, height=480)
plot(subpower$Datetime, subpower$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
