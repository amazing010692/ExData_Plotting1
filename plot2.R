library("data.table")

setwd("C:/Users/hello/Documents/Coursera_RConsole/ExData_Plotting1-master/Module-4_Peer-Graded Assignment Course Project 1")

# To read in data from file then subsets data for specified dates
powerDT <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
)

# To prevent Scientific Notation
powerDT[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# To make a POSIXct date capable of being filtered and graphed by time of day
powerDT[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# To filter Dates for 2007-02-01 and 2007-02-02
powerDT <- powerDT[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("plot2.png", width=480, height=480)

## Illustration for Plot 2
plot(x = powerDT[, dateTime]
     , y = powerDT[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()