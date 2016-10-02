setwd("~/Desktop/R-programming/Course3:ExploratoryDataAnalysis/Weeks1")
library(plyr)
###############
#4.

fileName<-"household_power_consumption.txt"
myData = read.table(fileName,header = TRUE, sep = ";",na="?")
myDataRange <- subset(myData, (myData$Date == "1/2/2007" | myData$Date == "2/2/2007"))
dateAndTime <- paste(myDataRange$Date,myDataRange$Time)
dateAndTime <- strptime(dateAndTime, "%d/%m/%Y %H:%M:%S")

png('plot4.png')
par(mfcol=c(2,2))
#plot1
plot(dateAndTime, as.numeric(myDataRange$Global_active_power),type="n",xlab= "Thu (2007-02-01), Fri (2007-02-02)",ylab= "Global Active Power (kilowatts)")
lines(dateAndTime,as.numeric(myDataRange$Global_active_power))

#plot2
plot(dateAndTime, as.numeric(myDataRange$Sub_metering_1),type="n",xlab= "Thu (2007-02-01), Fri (2007-02-02)",ylab= "Energy sub metering")
lines(dateAndTime, as.numeric(myDataRange$Sub_metering_1),col="black")
lines(dateAndTime, as.numeric(myDataRange$Sub_metering_2),col="red")
lines(dateAndTime, as.numeric(myDataRange$Sub_metering_3),col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))

#plot3
plot(dateAndTime, as.numeric(myDataRange$Voltage),type="n",xlab= "Thu (2007-02-01), Fri (2007-02-02)",ylab= "Voltage")
lines(dateAndTime,as.numeric(myDataRange$Voltage))

#plot4
plot(dateAndTime, as.numeric(myDataRange$Global_reactive_power),type="n",xlab= "Thu (2007-02-01), Fri (2007-02-02)",ylab="Global_reactive_power")
lines(dateAndTime,as.numeric(myDataRange$Global_reactive_power))

dev.off()