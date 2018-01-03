
data <- read.table("household_power_consumption.txt", header=TRUE, sep=';', stringsAsFactors = FALSE)

datasubset <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))
datasubset <- data.frame(datasubset , DateTime = strptime(paste(datasubset $Date, datasubset $Time), "%d/%m/%Y %H:%M:%S"))

png(filename="plot2.png", width = 480, height = 480)
plot(datasubset$DateTime, datasubset$Global_active_power, type = 'l'
		, xlab = ""
		, ylab = "Global Active Power (kilowatts)"
)
dev.off()

