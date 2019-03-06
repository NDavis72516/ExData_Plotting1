#read in full data set and extract data for only 1/2/2007 and 2/2/2007
house<-read.table("C:/Users/davis450/Desktop/Coursera/household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
house_dates<- house[house$Date %in% c("1/2/2007","2/2/2007"),]

#converting the date to R Date format and other variables to numeric
datetime <- strptime(paste(house_dates$Date, house_dates$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
ActivePower <- as.numeric(house_dates$Global_active_power)
subMetering1 <- as.numeric(house_dates$Sub_metering_1)
subMetering2 <- as.numeric(house_dates$Sub_metering_2)
subMetering3 <- as.numeric(house_dates$Sub_metering_3)
voltage<- as.numeric(house_dates$Voltage)


#plot code for plot4
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

#first plot
plot(datetime, ActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

#second plot
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

#third plot
plot(datetime, subMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=, lwd=2.5, col=c("black","red","blue"), bty="o")

#fourth plot
plot(datetime, as.numeric(as.character(house_dates$Global_reactive_power)), type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()