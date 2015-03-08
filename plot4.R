# Loading data
data <- read.table("household_power_consumption.txt", sep=";",quote= "",stringsAsFactors = FALSE,  nrows= 2075260, strip.white=TRUE, header=TRUE, na.strings= "?")

# Filtering by date
subdata <- subset(cons, (data$Date == "1/2/2007" | data$Date== "2/2/2007")) 

# Convert strings to dates
subdata$Date <- as.Date(subdata$Date, format = "%d/%m/%Y")

# Fusion of dates and times into a new column 
subdata$DateTime <- as.POSIXct(paste(subdata$Date, subdata$Time))

# Create the plot
png("plot4.png", width = 480, height = 480)
par(mfcol=c(2,2))

plot(subdata$DateTime, subdata$Global_active_power, type="l", ylab= "Global Active Power", xlab="")

plot(subdata$DateTime, subdata$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(subdata$DateTime, subdata$Sub_metering_2, type="l", col="red")
lines(subdata$DateTime, subdata$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
plot(subdata$DateTime,subdata$Voltage,type="l",ylab="Voltage",xlab="datetime")
plot(subdata$DateTime,subdata$Global_reactive_power,type='l',xlab="datetime",ylab="Global_reactive_power")

# Close devices
dev.off()