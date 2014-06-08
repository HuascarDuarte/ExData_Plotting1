## Plot 1

## Reading full data file as data.frame, since fread() does not treat na.strings
## correctly
Dt<-read.csv("../household_power_consumption.txt", sep=";", 
                   na.strings="?", stringsAsFactors=F)

## Subsetting data to days 2007-02-01 and 2007-02-02
Dt<-subset(Dt, Date == "1/2/2007" | Date == "2/2/2007")

## Convert character date/time to proper date/time format from format
## "%d/%m/%Y %H:%M:%S"
Dt<-cbind(Dt, Datetime=strptime(paste(Dt$Date, Dt$Time), "%d/%m/%Y %H:%M:%S"))

## Open png graphic device
png(file="plot1.png")

## Create the Histogram with proper title and labels
hist(Dt$Global_active_power, col="red", 
     main="Global Active Power", xlab="Global Active Power (kilowatts)", 
     ylab="Frequency")

## Close graphic device
dev.off()
