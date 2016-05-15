#plot2.R

#set the working directory and read the file
setwd("F:\\coursera\\4\\week1\\assignments")
rawData <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
#merge the datetime
rawData$DateTime <- strptime(paste(rawData$Date, rawData$Time), "%d/%m/%Y %H:%M:%S")
#subset the data
processedData <- rawData[(rawData$Date == "1/2/2007" | rawData$Date == '2/2/2007'),]
#plot the graph
plot(processedData$DateTime,processedData$Global_active_power,type='l', ylab = "Global Active Power (kilowatts)" ,xlab="")
#save it as a png file with pixels of 480X480
dev.copy(png, width=480, height=480, file="plot2.png")
dev.off()