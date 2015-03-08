# Loading data
data <- read.table("household_power_consumption.txt", sep=";",quote= "",stringsAsFactors = FALSE,  nrows= 2075260, strip.white=TRUE, header=TRUE, na.strings= "?")

# Filtering by dates
subdata <- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007")) 

# Convert strings to datas
subdata$Date <- as.Date(subdata$Date, format = "%d/%m/%Y")

# Fusion of dates and times into a new column 
subdata$DateTime <- as.POSIXct(paste(subdata$Date, subdata$Time))

# Generate the plot
png("plot3.png", width = 480, height = 480)
plot(subdata$DateTime, subdata$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(subdata$DateTime, subdata$Sub_metering_2, type="l", col="red")
lines(subdata$DateTime, subdata$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

# Closing devices
dev.off()