#read in full data set and extract data for only 1/2/2007 and 2/2/2007
house<-read.table("C:/Users/davis450/Desktop/Coursera/household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")
house_dates<- rbind(house[house$Date=="1/2/2007",],house[house$Date=="2/2/2007",])

#converting the date to R Date format
house_dates$Date <- as.Date(house_dates$Date, "%d/%m/%Y")

#plot histogram for plot1
png("plot1.png", width=480, height=480)
hist(as.numeric(house_dates$Global_active_power), col="Red", main="Global Active Power", xlab="Global Active power (kilowatts)")
dev.off()
