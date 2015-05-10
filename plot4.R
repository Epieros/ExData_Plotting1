#eda assg1
rawdata <- read.delim("household_power_consumption.txt", sep=";", na.strings="?")
slimdata <- rawdata[rawdata$Date %in% c("1/2/2007","2/2/2007"),]
slimdata$Date <- as.Date(slimdata$Date, format="%d/%m/%Y")
slimdata$DateTime <- as.POSIXlt(paste(slimdata$Date,slimdata$Time),format="%Y-%m-%d %H:%M:%S")

#Plot4
png("plot4.png")
par(mfcol=c(2,2))
plot((slimdata$DateTime), slimdata$Global_active_power, xlab="", ylab="Global Active Power",type="l")
plot(slimdata$DateTime, slimdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(slimdata$DateTime, slimdata$Sub_metering_2,col="red")
lines(slimdata$DateTime, slimdata$Sub_metering_3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")
plot((slimdata$DateTime), slimdata$Voltage, xlab="datetime", ylab="Voltage", type="l")
plot((slimdata$DateTime), slimdata$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power" ,type="l")
dev.off()