## Plot 3

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
png(file="plot3.png")

## Create the plot with proper title and labels, without data
with(Dt, plot(Datetime, Sub_metering_1, 
              type="n",
              main="", 
              ylab="Energy sub metering",
              xlab=""
)
)
## Create the lines for each Sub_metering
with(Dt, lines(Datetime, Sub_metering_1, col="black"))
with(Dt, lines(Datetime, Sub_metering_2, col="red"))
with(Dt, lines(Datetime, Sub_metering_3, col="blue"))

## Create the legend
legend("topright", 
       lty = 1, 
       col = c("black", "red", "blue"), 
       legend = names(Dt)[7:9]
       )

## Close graphic device
dev.off()
