###############################################################################
##### Exploratory Data Analysis: Course Project 1
##### Plot 3
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
png("plot3.png", width = 480, height = 480, units = "px")
with(elecPowerSubset, plot(elecPowerSubset$dateTime,
                           as.numeric(levels(elecPowerSubset$Sub_metering_1))[elecPowerSubset$Sub_metering_1],
                           xlab = "", ylab = "Energy sub metering", type = "l"))
with(elecPowerSubset, lines(elecPowerSubset$dateTime,
                            as.numeric(levels(elecPowerSubset$Sub_metering_2))[elecPowerSubset$Sub_metering_2],
                            col="red"))
with(elecPowerSubset, lines(elecPowerSubset$dateTime, elecPowerSubset$Sub_metering_3,
                            col="blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

###############################################################################
# END OF FILE.
###############################################################################