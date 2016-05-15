#plot3.R

#set the working directory and read the file
setwd("F:\\coursera\\4\\week1\\assignments")
rawData <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
#merge the datetime
rawData$DateTime <- strptime(paste(rawData$Date, rawData$Time), "%d/%m/%Y %H:%M:%S")
#subset the data
processedData <- rawData[(rawData$Date == "1/2/2007" | rawData$Date == '2/2/2007'),]
#plot the graph
plot(processedData$DateTime,processedData$Sub_metering_1,type='l', ylab = "Energy sub metering" ,xlab="")
lines(processedData$DateTime,processedData$Sub_metering_2,type='l', col="red")
lines(processedData$DateTime,processedData$Sub_metering_3,type='l', col="blue")
legend("topright",lty=1,col = c("black","red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#save it as a png file with pixels of 480X480
dev.copy(png, width=480, height=480, file="plot3.png")
dev.off()