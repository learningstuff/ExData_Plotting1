###############################################################################
##### Exploratory Data Analysis: Course Project 1
##### Plot 2
###############################################################################

# Set working directory.
mainDirectory <- "INSERT FILE DIRECTORY HERE"
setwd(mainDirectory)

# Upload datafile into R.
temp <- tempfile()
download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
elecPower <- read.csv(unz(temp, "household_power_consumption.txt"), header = TRUE, sep = ";")
unlink(temp)

# Subset data.
elecPowerSubset <- subset(elecPower, Date == "1/2/2007" | Date == "2/2/2007")

# Combine date and time variables.
elecPowerSubset$dateTime <- strptime(paste(elecPowerSubset$Date,elecPowerSubset$Time), "%d/%m/%Y %H:%M:%S")

# Create plot.
png("plot2.png", width = 480, height = 480, units = "px")
plot(elecPowerSubset$dateTime,
     as.numeric(levels(elecPowerSubset$Global_active_power))[elecPowerSubset$Global_active_power],
     xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
dev.off()

###############################################################################
# END OF FILE.
###############################################################################