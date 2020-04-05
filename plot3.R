setwd("~/Desktop/Exercises/Course4")
Data<-read.table("household_power_consumption.txt", 
                 header=TRUE, sep=";", 
                 na.strings = "?",
                 colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
Data<-Data[Data$Date %in% c("1/2/2007", "2/2/2007"),]
DateTime<-strptime(paste(Data$Date, Data$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S")
Data<-cbind(DateTime, Data)

#plot 3
x<-Data$DateTime
y1<-Data$Sub_metering_1
y2<-Data$Sub_metering_2
y3<-Data$Sub_metering_3
collines<-c("black", "red", "blue")
labels<-c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

plot(y1~x, type="l", col=collines[1], ylab = "Energy sub metering")
lines(y2~x, type="l", col=collines[2])
lines(y3~x, type="l", col=collines[3])
legend("topright", legend = labels, col = collines, lty="solid")