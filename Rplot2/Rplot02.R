setwd("C:\\Users\\asus\\Downloads\\exdata%2Fdata%2Fhousehold_power_consumption")


HPCData <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")

finalData <- HPCData[HPCData$Date %in% c("1/2/2007","2/2/2007"),]

SetTime <-strptime(paste(finalData$Date, finalData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
finalData <- cbind(SetTime, finalData)

hist(finalData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

setwd("C:\\Users\\asus\\Documents\\GitHub\\ExData_Plotting1\\Rplot2")

library(png)
png("Rplot%02d.png",width = 480,height = 480)

plot(finalData$SetTime, finalData$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
