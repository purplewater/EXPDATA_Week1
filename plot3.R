#change work directory
setwd("~/R_MW_20180914/EXPWeek1")

#Load data and subset
data<-read.csv('household_power_consumption.txt', header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
dataS<-subset(data, Date %in% c("1/2/2007","2/2/2007"))
dataS$Date <- as.Date(dataS$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(dataS$Date), dataS$Time)
dataS$wday <- as.POSIXct(datetime)

png("plot3.png", width=480, height=480)
plot(dataS$wday,dataS$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
  lines(dataS$wday, dataS$Sub_metering_2,col='Red')
  lines(dataS$wday, dataS$Sub_metering_3,col='Blue')
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()