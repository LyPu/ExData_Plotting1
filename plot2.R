setwd("~/Desktop/Exercises/Course4")
Data<-read.table("household_power_consumption.txt", 
                 header=TRUE, sep=";", 
                 na.strings = "?",
                 colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
Data<-Data[Data$Date %in% c("1/2/2007", "2/2/2007"),]
DateTime<-strptime(paste(Data$Date, Data$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S")
Data<-cbind(DateTime, Data)

#plot 2
x<-Data$DateTime
y<-Data$Global_active_power
plot(y~x, type="l", ylab = "Global Active Power (kilowatts)")