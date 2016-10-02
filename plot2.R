setwd("~/Desktop/R-programming/Course3:ExploratoryDataAnalysis/Weeks1")
library(plyr)

#################################################################################
#LOADING FILE
#2.
fileName<-"household_power_consumption.txt"
myData = read.table(fileName,header = TRUE, sep = ";",na="?")
#myData$Date <- strptime(myData$Date, "%d/%m/%Y")
myDataRange <- subset(myData, (myData$Date == "1/2/2007" | myData$Date == "2/2/2007"))

#thursdays <- subset(myDataRange, (weekdays(myDataRange$Date,abbreviate = TRUE) == "tor"))
#thursdays$Date <- "Thu"
#fridays <- subset(myDataRange, (weekdays(myDataRange$Date,abbreviate = TRUE) == "fre"))
#fridays$Date <- "Fri"

#twoDayData<- rbind(thursdays,fridays)
#twoDayData$Date <- weekdays(as.Date(twoDayData$Date,abbreviate = TRUE)) 
dateAndTime <- paste(myDataRange$Date,myDataRange$Time)
dateAndTime <- strptime(dateAndTime, "%d/%m/%Y %H:%M:%S")

png('plot2.png')
plot.new()
plot(dateAndTime, as.numeric(myDataRange$Global_active_power),type="l",xlab= "Thu (2007-02-01), Fri (2007-02-02)",ylab= "Global Active Power (kilowatts)")
lines(dateAndTime,as.numeric(myDataRange$Global_active_power))
dev.off()