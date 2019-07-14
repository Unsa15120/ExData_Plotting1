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

# Plotting 4 Graphs

par(mfrow=c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0))

with(eData,{
  
  plot(eData$Global_active_power~eData$DateTime,col="black",xlab="",ylab = "Global Active Power (kilowatts)",type="l")
  
  plot(eData$Voltage~eData$DateTime,col="black",xlab="datetime",ylab = "Voltage (volt)",type="l")
  
  plot(eData$Sub_metering_1~eData$DateTime,type = "l",col="black",
       ylab = "Energy sub metering",xlab="")
  lines(eData$Sub_metering_2~eData$DateTime,col="red")
  lines(eData$Sub_metering_3~eData$DateTime,col="blue")
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  plot(eData$Global_reactive_power~eData$DateTime,col="black",xlab="datetime", ylab = "Global Reactive Power (kilowatts)",type="l")
  
})


# Saving PNG File
dev.copy(png,file="plot4.png",width=480,height=480)
dev.off()


