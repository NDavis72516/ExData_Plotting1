#read in full data set and extract data for only 1/2/2007 and 2/2/2007
house<-read.table("C:/Users/davis450/Desktop/Coursera/household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")
house_dates<- house[house$Date %in% c("1/2/2007","2/2/2007"),]

#converting the date to R Date format
datetime <- strptime(paste(house_dates$Date, house_dates$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#plot code for plot2
global<- as.numeric(house_dates$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, global, type="l", xlab ="", ylab="Global Active power (kilowatts)")
dev.off()
