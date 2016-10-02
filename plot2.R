setwd("~/Desktop/R-programming/Course3:ExploratoryDataAnalysis/Weeks1")
library(plyr)

#################################################################################
#LOADING FILE
#2.
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

png('plot2.png')
plot.new()
plot(as.factor(dateAndTime), as.numeric(twoDayData$Global_active_power)/1000,xlab= "Thu (2007-02-01), Fri (2007-02-02)",ylab= "Global Active Power (kilowatts)")
lines(as.factor(dateAndTime),as.numeric(twoDayData$Global_active_power)/1000)
dev.off()