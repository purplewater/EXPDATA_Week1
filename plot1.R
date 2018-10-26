
#change work directory
setwd("~/R_MW_20180914/EXPWeek1")

#unzip the dataset
zipF<- "~/R_MW_20180914/EXPWeek1/exdata%2Fdata%2Fhousehold_power_consumption.zip"
outDir<-"~/R_MW_20180914/EXPWeek1"
unzip(zipF,exdir=outDir)

#Load data and subset
data<-read.csv('household_power_consumption.txt', header=T, sep=";", na.string="?", stringsAsFactors=F, comment.char="")
dataS<-subset(data, Date %in% c("1/2/2007","2/2/2007"))

#Plot 1
png("plot1.png", width=480, height=480)
hist(dataS$Global_active_power, main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()
