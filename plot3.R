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
# globalActivePower <- as.numeric(subSetData$Global_active_power)
Sub_metering1 <- as.numeric(subSetData$Sub_metering_1)
Sub_metering2 <- as.numeric(subSetData$Sub_metering_2)
Sub_metering3 <- as.numeric(subSetData$Sub_metering_3)

# ****************************************
# STEP 03 - CREATE PLOT
#
# ****************************************
png("plot3.png", width=480, height=480)
plot(datetime, Sub_metering1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, Sub_metering2, type="l", col="red")
lines(datetime, Sub_metering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()