#change work directory
setwd("~/R_MW_20180914/EXPWeek1")

#Load data and subset
data<-read.csv('household_power_consumption.txt', header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
dataS<-subset(data, Date %in% c("1/2/2007","2/2/2007"))
dataS$Date <- as.Date(dataS$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(dataS$Date), dataS$Time)
dataS$wday <- as.POSIXct(datetime)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

plot(dataS$wday,dataS$Global_active_power, type="l", ylab="Global Active Power", xlab="")
plot(dataS$wday,dataS$Voltage, type="l", ylab="Voltage(volt)", xlab="")
plot(dataS$wday,dataS$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
  lines(dataS$wday, dataS$Sub_metering_2,col='Red')
  lines(dataS$wday, dataS$Sub_metering_3,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(dataS$wday,dataS$Global_reactive_power, type="l", ylab="Global_ractive_Power", xlab="")

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()