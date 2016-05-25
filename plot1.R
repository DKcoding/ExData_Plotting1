# ******************************************
# STEP 01 - IMPORT OF DATA & SUBSETTING
#
# Prequirement:
#   (a) source data is downloaded and saved in folder "Data"
#       https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
#
# ******************************************
dataFile <- "./Data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# ****************************************
# STEP 02 - DATA ENRICHMENT
#
# ****************************************
globalActivePower <- as.numeric(subSetData$Global_active_power)


# ****************************************
# STEP 03 - CREATE PLOT
#
# ****************************************
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
