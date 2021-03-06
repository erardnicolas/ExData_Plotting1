rm(list = ls())
data=read.table("household_power_consumption.txt",header=TRUE,sep=";")

dates=data$Date=="1/2/2007" | data$Date=="2/2/2007"
smallData=data[dates,]

DateAndTime=strptime(paste(smallData[,1],smallData[,2],sep=" "),format="%d/%m/%Y %H:%M:%S")

smallData$Global_active_power=as.numeric(as.character(smallData$Global_active_power))
smallData$Sub_metering_1=as.numeric(as.character(smallData$Sub_metering_1))
smallData$Sub_metering_2=as.numeric(as.character(smallData$Sub_metering_2))
smallData$Sub_metering_3=as.numeric(as.character(smallData$Sub_metering_3))
smallData$Voltage=as.numeric(as.character(smallData$Voltage))
smallData$Global_reactive_power=as.numeric(as.character(smallData$Global_reactive_power))


head(smallData)
png(filename="Rplot04.png",width = 480, height = 480)
par(mfrow=c(2,2))
par(mcol=c(2,2))
plot(DateAndTime,smallData[,"Global_active_power"],type="l",xlab="",ylab="Global Active Power (kilowatts)")
plot(DateAndTime,smallData[,"Voltage"],type="l",xlab="",ylab="Voltage")
plot(DateAndTime,smallData[,"Sub_metering_1"],type="l",xlab="",ylab="Energy sub metering")
lines(DateAndTime,smallData[,"Sub_metering_2"],col="red")
lines(DateAndTime,smallData[,"Sub_metering_3"],col="blue")
legend(x="topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),lwd=c(2.5,2.5),col=c("black","red","blue"))

plot(DateAndTime,smallData[,"Global_reactive_power"],type="l",xlab="",ylab="Global_reactive_power")


dev.off()