setwd("~/Desktop/R-programming/Course3:ExploratoryDataAnalysis/Weeks1")
library(plyr)

#################################################################################
#1.
fileName<-"household_power_consumption.txt"
myData = read.table(fileName,header = TRUE, sep = ";",na="?")
#myData$Date <- strptime(myData$Date, "%d/%m/%Y")
myDataRange <- subset(myData, (myData$Date == "1/2/2007" | myData$Date == "2/2/2007"))

GlobalActivePower=(as.numeric(myDataRange$Global_active_power))
png('plot1.png')
#hist(GlobalActivePower,breaks = c(0,0.25,0.5,0.75,1,1.25,1.5,1.75,2,2.25,2.5,2.75,3,3.25,3.5,3.75,4,4.25,4.5,4.75,5,5.25,5.5,5.75,6),col="red",main = paste("Global Active Power"),xlab="Global Active Power (kilowatts)")
hist(GlobalActivePower,col="red",main = paste("Global Active Power"),xlab="Global Active Power (kilowatts)")
dev.off()