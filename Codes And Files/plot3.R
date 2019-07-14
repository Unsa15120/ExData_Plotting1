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
  plot(eData$Sub_metering_1~eData$DateTime,type = "l",col="black",
       ylab = "Energy sub metering",xlab="")
  lines(eData$Sub_metering_2~eData$DateTime,col="red")
  lines(eData$Sub_metering_3~eData$DateTime,col="blue")
})

# Legend

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Saving PNG File
dev.copy(png,file="plot3.png",width=480,height=480)
dev.off()
