# Loading data
data <- read.table("household_power_consumption.txt", sep=";",quote= "",stringsAsFactors = FALSE,  nrows= 2075260, strip.white=TRUE, header=TRUE, na.strings= "?")

# Filtering by dates
subdata <- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007")) 

# Convert strings to dates
subdata$Date <- as.Date(subdata$Date, format = "%d/%m/%Y")

# Fusion of dates and times into a new column 
subdata$DateTime <- as.POSIXct(paste(subdata$Date, subdata$Time))

# Generate the plot
png("plot2.png", width = 480, height = 480)
plot(subdata$DateTime, subdata$Global_active_power, type="l", ylab= "Global Active Power(kilowatts)", xlab="")

# Closing devices
dev.off()