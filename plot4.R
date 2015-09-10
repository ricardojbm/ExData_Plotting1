# subsetting directly from file into dataframe with skip and nrows arguments:
# 1) Inspected with Notepad++ (https://notepad-plus-plus.org/download/v6.8.3.html)
# the row corresponding to date "1/2/2007" and assigned it to skip = integer
# 2) Calculated number of minutes=days*hours*minutes=2*24*60=2880 and assigned
# it to nrows = integer.

data <- read.table("./data/household_power_consumption.txt", na.strings = "?", sep = ";", skip = 66637, nrows = 2880, stringsAsFactors = FALSE)

# Extracting column names from file to name variables. The latter since the
# arguments skip and nrows return unnamed variables when extracting data
# that skips the header.

datacolumn <- read.table("./data/household_power_consumption.txt", sep = ";", nrows = 1, header = FALSE, stringsAsFactors = FALSE)
colnames(data) <- datacolumn

# Valid Date and Time for plotting

dateandtime <- strptime(paste(data$Date, data$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

# Plot 4

png("plot4.png", width = 480, height = 480)
par(mfcol = c(2, 2), cex = 0.70)
plot(dateandtime, data$Global_active_power, xlab =" ", ylab = "Global Active Power", type = "l")
plot(dateandtime, data$Sub_metering_1, type = "l", xlab = " ", ylab = "Energy sub metering")
lines(dateandtime, data$Sub_metering_2, type = "l", col = "red")
lines(dateandtime, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"), col = c("black", "red", "blue"), lty = 1, bty = "n")
plot(dateandtime, data$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
plot(dateandtime, data$Global_reactive_power, xlab = "datetime", ylab = "Global Reactive Power", type = "l")
dev.off()