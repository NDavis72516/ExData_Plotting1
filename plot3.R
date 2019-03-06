#read in full data set and extract data for only 1/2/2007 and 2/2/2007
house<-read.table("C:/Users/davis450/Desktop/Coursera/household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")
house_dates<- house[house$Date %in% c("1/2/2007","2/2/2007"),]

#converting the date to R Date format and other variables to numeric
datetime <- strptime(paste(house_dates$Date, house_dates$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(house_dates$Global_active_power)
subMetering1 <- as.numeric(house_dates$Sub_metering_1)
subMetering2 <- as.numeric(house_dates$Sub_metering_2)
subMetering3 <- as.numeric(house_dates$Sub_metering_3)
                    

#plot histogram for plot3
png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", lty=1, lwd=3, col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
