setwd("~/Desktop/R-programming/Course3:ExploratoryDataAnalysis/Weeks1")
library(plyr)
###############
#4.

fileName<-"household_power_consumption.txt"
myData = read.table(fileName,header = TRUE, sep = ";")
myData$Date <- strptime(myData$Date, "%d/%m/%Y")
myDataRange <- subset(myData, (myData$Date == "2007-02-01" | myData$Date == "2007-02-02"))

#tor is torsday (Tuesday) in Swedish
thursdays <- subset(myDataRange, (weekdays(myDataRange$Date,abbreviate = TRUE) == "tor"))
#thursdays$Date <- "Thu"
#fre is Fredag (Friday) in Swedish
fridays <- subset(myDataRange, (weekdays(myDataRange$Date,abbreviate = TRUE) == "fre"))
#fridays$Date <- "Fri"

twoDayData<- rbind(thursdays,fridays)
#twoDayData$Date <- weekdays(as.Date(twoDayData$Date,abbreviate = TRUE)) 
dateAndTime <- paste(twoDayData$Date,twoDayData$Time)

png('plot4.png')
par(mfcol=c(2,2))
#plot1
plot(as.factor(dateAndTime), as.numeric(twoDayData$Global_active_power)/1000,type="n",xlab= "Thu (2007-02-01), Fri (2007-02-02)",ylab= "Global Active Power (kilowatts)")
lines(as.factor(dateAndTime),as.numeric(twoDayData$Global_active_power)/1000)

#plot2
plot(as.factor(dateAndTime), as.numeric(twoDayData$Sub_metering_1),type="n",xlab= "Thu (2007-02-01), Fri (2007-02-02)",ylab= "Energy sub metering")
lines(as.factor(dateAndTime), as.numeric(twoDayData$Sub_metering_1),col="black")
lines(as.factor(dateAndTime), as.numeric(twoDayData$Sub_metering_2),col="red")
lines(as.factor(dateAndTime), as.numeric(twoDayData$Sub_metering_3),col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))

#plot3
plot(as.factor(dateAndTime), as.numeric(twoDayData$Voltage),type="n",xlab= "Thu (2007-02-01), Fri (2007-02-02)",ylab= "Voltage")
lines(as.factor(dateAndTime),as.numeric(twoDayData$Voltage))

#plot4
plot(as.factor(dateAndTime), as.numeric(twoDayData$Global_reactive_power),type="n",xlab= "Thu (2007-02-01), Fri (2007-02-02)",ylab="Global_reactive_power")
lines(as.factor(dateAndTime),as.numeric(twoDayData$Global_reactive_power))

dev.off()