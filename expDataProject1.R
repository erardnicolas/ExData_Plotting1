rm(list = ls())
setwd("~/Documents/Coursera/ExploratoryData")
data=read.table("household_power_consumption.txt",header=TRUE,sep=";")

dates=data$Date=="1/2/2007" | data$Date=="2/2/2007"
smallData=data[dates,]

smallData$Global_active_power=as.numeric(as.character(smallData$Global_active_power))

png(filename="Rplot01.png",width = 480, height = 480)
with(smallData,hist(Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)"))
dev.off()


