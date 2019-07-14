# Setting And Getting Working Directory
setwd("C:/Users/Super/Desktop/dataplot/Codes And Files")
getwd()

# Reading DataSet

wholeData <- read.csv("C:/Users/Super/Desktop/dataplot/datasets/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')


eData <- subset(wholeData, Date %in% c("1/2/2007","2/2/2007"))
eData$Date <- as.Date(eData$Date,format="%d/%m/%Y")
datetime <- paste(as.Date(eData$Date),eData$Time)
eData$DateTime <- as.POSIXct(datetime)

# Plot

with(eData,{
  plot(eData$Global_active_power~eData$DateTime,type="l",col="black",xlab="",ylab="Global ACtive Power (kilowatts)")
})

# Saving png File

dev.copy(png,file="plot2.png",width=480,height=480)
dev.off()
