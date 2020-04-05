setwd("~/Desktop/Exercises/Course4")
Data<-read.table("household_power_consumption.txt", 
                 header=TRUE, sep=";", 
                 na.strings = "?",
                 colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
Data<-Data[Data$Date %in% c("1/2/2007", "2/2/2007"),]
DateTime<-strptime(paste(Data$Date, Data$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S")
Data<-cbind(DateTime, Data)

#plot 1
hist(Data$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main ="Global Active Power")