setwd("~/Desktop/R-programming/Course3:ExploratoryDataAnalysis/Weeks1")
library(plyr)

#################################################################################
#LOADING FILE
#3.

fileName<-"household_power_consumption.txt"
myData = read.table(fileName,header = TRUE, sep = ";")
myData$Date <- strptime(myData$Date, "%d/%m/%Y")
myDataRange <- subset(myData, (myData$Date == "2007-02-01" | myData$Date == "2007-02-02"))

thursdays <- subset(myDataRange, (weekdays(myDataRange$Date,abbreviate = TRUE) == "tor"))
#thursdays$Date <- "Thu"
fridays <- subset(myDataRange, (weekdays(myDataRange$Date,abbreviate = TRUE) == "fre"))
#fridays$Date <- "Fri"

twoDayData<- rbind(thursdays,fridays)
#twoDayData$Date <- weekdays(as.Date(twoDayData$Date,abbreviate = TRUE)) 
dateAndTime <- paste(twoDayData$Date,twoDayData$Time)

png('plot3.png')

plot(as.factor(dateAndTime), as.numeric(twoDayData$Sub_metering_1),type="n",xlab= "Thu (2007-02-01), Fri (2007-02-02)",ylab= "Energy sub metering")
lines(as.factor(dateAndTime), as.numeric(twoDayData$Sub_metering_1),col="black")
lines(as.factor(dateAndTime), as.numeric(twoDayData$Sub_metering_2),col="red")
lines(as.factor(dateAndTime), as.numeric(twoDayData$Sub_metering_3),col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))

dev.off()