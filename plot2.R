col_names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
dataset <- read.csv2("household_power_consumption.txt", header = TRUE, skip = 66637, nrows = 2879, col.names = col_names, na.strings = "?", sep = ";", dec = ",")

for(i in 3:9) dataset[,i] <- as.numeric(as.character(dataset[,i]))
dataset$datetime <- strptime( paste(dataset$Date, dataset$Time), "%d/%m/%Y %H:%M:%S")

plot(dataset$datetime, dataset$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")