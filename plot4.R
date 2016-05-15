#plot4.R

#set the working directory and read the file
setwd("F:\\coursera\\4\\week1\\assignments")
rawData <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
#merge the datetime
rawData$DateTime <- strptime(paste(rawData$Date, rawData$Time), "%d/%m/%Y %H:%M:%S")
#subset the data
processedData <- rawData[(rawData$Date == "1/2/2007" | rawData$Date == '2/2/2007'),]
#plot the graphs
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 1, 0))
with(processedData,{
plot(processedData$DateTime,processedData$Global_active_power,type='l', ylab = "Global Active Power" ,xlab="")  
plot(processedData$DateTime,processedData$Voltage,type='l', ylab = "Voltage" ,xlab="datetime")  
plot(processedData$DateTime,processedData$Sub_metering_1,type='l', ylab = "Energy sub metering" ,xlab="")
lines(processedData$DateTime,processedData$Sub_metering_2,type='l', col="red")
lines(processedData$DateTime,processedData$Sub_metering_3,type='l', col="blue")
legend("topright",lty=1,col = c("black","red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty = "n")
plot(processedData$DateTime,processedData$Global_reactive_power,type='l', ylab = "Global_reactive_power" ,xlab="datetime", ylim = c(0,0.5))  
})
#save it as a png file with pixels of 480X480
dev.copy(png, width=480, height=480, file="plot4.png")
dev.off()