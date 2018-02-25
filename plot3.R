library("data.table")

setwd("C:/Users/hello/Documents/Coursera_RConsole/ExData_Plotting1-master/Module-4_Peer-Graded Assignment Course Project 1")

# To read in data from file then subsets data for specified dates
powerDT <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
)

# Tp prevent Scientific Notation
powerDT[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# To make a POSIXct date capable of being filtered and graphed by time of day
powerDT[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# To filter Dates for 2007-02-01 and 2007-02-02
powerDT <- powerDT[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("plot3.png", width=480, height=480)

# Illustration for Plot 3
plot(powerDT[, dateTime], powerDT[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(powerDT[, dateTime], powerDT[, Sub_metering_2],col="red")
lines(powerDT[, dateTime], powerDT[, Sub_metering_3],col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

dev.off()