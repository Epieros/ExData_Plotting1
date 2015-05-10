#eda assg1
rawdata <- read.delim("household_power_consumption.txt", sep=";", na.strings="?")
slimdata <- rawdata[rawdata$Date %in% c("1/2/2007","2/2/2007"),]
slimdata$Date <- as.Date(slimdata$Date, format="%d/%m/%Y")
slimdata$DateTime <- as.POSIXlt(paste(slimdata$Date,slimdata$Time),format="%Y-%m-%d %H:%M:%S")


#Plot2
png("plot2.png")
plot((slimdata$DateTime), slimdata$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)",type="l")
dev.off()