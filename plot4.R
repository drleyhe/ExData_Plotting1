
data <- read.table("household_power_consumption.txt", header=TRUE, sep=';', stringsAsFactors = FALSE)

datasubset <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))
datasubset <- data.frame(datasubset , DateTime = strptime(paste(datasubset $Date, datasubset $Time), "%d/%m/%Y %H:%M:%S"))

png(filename="plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
plot(datasubset$DateTime, datasubset$Global_active_power, type = 'l'
		, xlab = ""
		, ylab = "Global Active Power"
)
plot(datasubset$DateTime, datasubset$Voltage, type = 'l'
		, xlab = "datetime"
		, ylab = "Voltage"
)
plot(datasubset$DateTime, datasubset$Sub_metering_1, type = 'l'
		, xlab = ""
		, ylab = "Energy sub metering"
		, col = "black"
)
lines(datasubset$DateTime, datasubset$Sub_metering_2, col = "red")
lines(datasubset$DateTime, datasubset$Sub_metering_3, col = "blue")
legend("topright"	, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
			, lty = par("lty")
			, col = c("black", "red", "blue")
			, bty = "n"
)
plot(datasubset$DateTime, datasubset$Global_reactive_power, type = 'l'
		, xlab = "datetime"
		, ylab = "Global_reactive_power"
)
dev.off()
