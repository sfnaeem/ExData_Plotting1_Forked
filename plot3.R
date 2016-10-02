setwd("~/Desktop/R-programming/Course3:ExploratoryDataAnalysis/Weeks1")
library(plyr)

#################################################################################
#LOADING FILE
#3.

fileName<-"household_power_consumption.txt"
myData = read.table(fileName,header = TRUE, sep = ";",na="?")
myDataRange <- subset(myData, (myData$Date == "1/2/2007" | myData$Date == "2/2/2007"))
dateAndTime <- paste(myDataRange$Date,myDataRange$Time)
dateAndTime <- strptime(dateAndTime, "%d/%m/%Y %H:%M:%S")

png('plot3.png')

plot(dateAndTime, as.numeric(myDataRange$Sub_metering_1),type="n",xlab= "Thu (2007-02-01), Fri (2007-02-02)",ylab= "Energy sub metering")
lines(dateAndTime, as.numeric(myDataRange$Sub_metering_1),col="black")
lines(dateAndTime, as.numeric(myDataRange$Sub_metering_2),col="red")
lines(dateAndTime, as.numeric(myDataRange$Sub_metering_3),col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))

dev.off()