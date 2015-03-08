#Loading data
data <- read.table("household_power_consumption.txt", sep=";",quote= "",stringsAsFactors = FALSE,  nrows= 2075260, strip.white=TRUE, header=TRUE, na.strings= "?")

# Filtering by dates
subdata <- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007")) 

# Convert strings to dates
subdata$Date <- as.Date(subdata$Date, format = "%d/%m/%Y")

# Generate the plot
png("plot1.png", width = 480, height = 480)
hist(subdata$Global_active_power, type="l", main="Global Active Power",col='red',ylab= "Frequency", xlab="Global Active Power(kilowatts)")

# Closing devices
dev.off()