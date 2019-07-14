# Setting And Getting Working Directory
setwd("C:/Users/Super/Desktop/dataplot/Codes And Files")
getwd()

# Reading DataSet

wholeData <- read.csv("C:/Users/Super/Desktop/dataplot/datasets/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

# Reading Specific Dates From Date Variable

eData <- subset(wholeData, Date %in% c("1/2/2007","2/2/2007"))

# Converting Date Variable Using as.Date()
eData$Date <- as.Date(eData$Date,format="%d/%m/%Y")

# Creating Histogram

hist(eData$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# Saving png File
dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()
