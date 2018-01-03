
data <- read.table("household_power_consumption.txt", header=TRUE, sep=';', stringsAsFactors = FALSE)

datasubset <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))
datasubset <- data.frame(datasubset , DateTime = strptime(paste(datasubset $Date, datasubset $Time), "%d/%m/%Y %H:%M:%S"))

png(filename="plot1.png", width = 480, height = 480)
hist(as.numeric(datasubset$Global_active_power), breaks = 20, col = 'red'
		, main = "Global Active Power"
		, xlab = "Global Active Power (kilowatts)"
)
dev.off()

