#plot1.R

#set the working directory and read the file
setwd("F:\\coursera\\4\\week1\\assignments")
rawData <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
#subset the data
processedData <- rawData[(rawData$Date == "1/2/2007" | rawData$Date == '2/2/2007'),]
#plot the histogram
hist(processedData$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
#save it as a png file with pixels of 480X480
dev.copy(png, width=480, height=480, file="plot1.png")
dev.off()