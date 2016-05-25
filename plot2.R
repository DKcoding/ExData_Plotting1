# ******************************************
# STEP 01 - IMPORT OF DATA & SUBSETTING
#
# Prequirement:
#   (a) source data is downloaded and saved in folder "Data"
#       https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
#
# if you facing issues in R / RStudio to get english weekdays try 
# Sys.setlocale("LC_ALL","English")
#
# ******************************************
dataFile <- "./Data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# ****************************************
# STEP 02 - DATA ENRICHMENT
#
# ****************************************
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(subSetData$Global_active_power)

# ****************************************
# STEP 03 - CREATE PLOT
#
# ****************************************
png("plot2.png", width=480, height=480)
plot(datetime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()