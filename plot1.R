###############################################################################
##### Exploratory Data Analysis: Course Project 1
##### Plot 1
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

# Create plot.
png("plot1.png", width = 480, height = 480, units = "px")
hist(as.numeric(levels(elecPowerSubset$Global_active_power))[elecPowerSubset$Global_active_power],
     col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

###############################################################################
# END OF FILE.
###############################################################################