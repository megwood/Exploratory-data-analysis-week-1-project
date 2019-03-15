library(data.table)
library(tidyverse)
library(lubridate)

#read in power dataset
power <- read.table("C:/Users/megan/Downloads/exdata_data_household_power_consumption/household_power_consumption.txt",
                    sep = ";", header = TRUE, na.strings="?", nrows=2075259) 

#change Date to a Posixct variable and then filter for the appropriate dates
subpower = power %>% 
      mutate(Date = dmy(Date)) %>% 
      filter(Date == "2007-02-01" | Date =="2007-02-02")

#plot the global active power histogram
hist(subpower$Global_active_power, xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency", col = "Red", border = "black", main = "Global Active Power")
