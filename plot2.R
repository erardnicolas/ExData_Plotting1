rm(list = ls())
setwd("~/Documents/Coursera/ExploratoryData")
data=read.table("household_power_consumption.txt",header=TRUE,sep=";")

dates=data$Date=="1/2/2007" | data$Date=="2/2/2007"
smallData=data[dates,]

DateAndTime=strptime(paste(smallData[,1],smallData[,2],sep=" "),format="%d/%m/%Y %H:%M:%S")
smallData$Global_active_power=as.numeric(as.character(smallData$Global_active_power))
png(filename="Rplot02.png",width = 480, height = 480)
plot(DateAndTime,smallData[,"Global_active_power"],type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()