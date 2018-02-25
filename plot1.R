library("data.table")

setwd("C:/Users/hello/Documents/Coursera_RConsole/ExData_Plotting1-master/Module-4_Peer-Graded Assignment Course Project 1")

# To read data from file then subsets data for specified dates
powerDT <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
                             )

# To prevent histogram from printing in scientific notation
powerDT[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# To change Date Column to Date Type
powerDT[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

# Tp filter Dates for 2007-02-01 and 2007-02-02
powerDT <- powerDT[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

png("plot1.png", width=480, height=480)

## Illustration for Plot 1
hist(powerDT[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()