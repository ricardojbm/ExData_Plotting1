# subsetting directly from file into dataframe with skip and nrows arguments:
# 1) Inspected with Notepad++ (https://notepad-plus-plus.org/download/v6.8.3.html)
# the row corresponding to date "1/2/2007" and assigned it to skip = integer
# 2) Calculated number of minutes=days*hours*minutes=2*24*60=2880 and assigned
# it to nrows = integer.

data <- read.table("./data/household_power_consumption.txt", na.strings = "?", 
			sep = ";", skip = 66637, nrows = 2880, stringsAsFactors = FALSE)

# Extracting column names from file to name variables. The latter since the
# arguments skip and nrows return unnamed variables when extracting data
# that skips the header.

datacolumn <- read.table("./data/household_power_consumption.txt", sep = ";", 
			nrows = 1, header = FALSE, stringsAsFactors = FALSE)

colnames(data) <- datacolumn

# Plot 

png("plot1.png", width = 480, height = 480)

hist(data$Global_active_power, col = "red", ylab ="Frequency", 
			xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
					
dev.off()