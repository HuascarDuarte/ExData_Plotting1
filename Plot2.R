## Plot 2

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
png(file="plot2.png")

## Create the plot with proper title and labels, without data
with(Dt, plot(Datetime, Global_active_power, 
              type="n",
              main="", 
              ylab="Global Active Power (kilowatts)",
              xlab=""
              )
    )
## Create the line
with(Dt, lines(Datetime, Global_active_power))

## Close graphic device
dev.off()
