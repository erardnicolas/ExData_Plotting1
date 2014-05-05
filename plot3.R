rm(list = ls())
setwd("~/Documents/Coursera/ExploratoryData")
data=read.table("household_power_consumption.txt",header=TRUE,sep=";")

dates=data$Date=="1/2/2007" | data$Date=="2/2/2007"
smallData=data[dates,]

DateAndTime=strptime(paste(smallData[,1],smallData[,2],sep=" "),format="%d/%m/%Y %H:%M:%S")

smallData$Sub_metering_1=as.numeric(as.character(smallData$Sub_metering_1))
smallData$Sub_metering_2=as.numeric(as.character(smallData$Sub_metering_2))
smallData$Sub_metering_3=as.numeric(as.character(smallData$Sub_metering_3))


png(filename="Rplot03.png",width = 480, height = 480)
plot(DateAndTime,smallData[,"Sub_metering_1"],type="l",xlab="",ylab="Energy sub metering")
lines(DateAndTime,smallData[,"Sub_metering_2"],col="red")
lines(DateAndTime,smallData[,"Sub_metering_3"],col="blue")
legend(x="topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),lwd=c(2.5,2.5),col=c("black","red","blue"))
dev.off()