## Plot 4

## Reading full data file as data.frame, since fread() does not treat na.strings
## correctly
Dt<-read.csv("../household_power_consumption.txt", sep=";", 
             na.strings="?", stringsAsFactors=F)

## Subsetting data to days 2007-02-01 and 2007-02-02
Dt<-subset(Dt, Date == "1/2/2007" | Date == "2/2/2007")

## Convert character date/time to proper date/time format from format
## "%d/%m/%Y %H:%M:%S"
Dt<-cbind(Dt, datetime=strptime(paste(Dt$Date, Dt$Time), "%d/%m/%Y %H:%M:%S"))

## Open png graphic device
png(file="plot4.png")

## Prepare canvas with 2 rows and 2 columns
par(mfcol=c(2,2))

## Create the first plot with Global Active Power
with(Dt, plot(datetime, Global_active_power, 
              type="l",
              main="", 
              ylab="Global Active Power",
              xlab=""
            )
    )

## Create the 2nd plot with Sub Metering 
with(Dt, plot(datetime, Sub_metering_1, 
              type="n",
              main="", 
              ylab="Energy sub metering",
              xlab=""
            )
    )
## Create the lines for each Sub_metering
with(Dt, lines(datetime, Sub_metering_1, col="black"))
with(Dt, lines(datetime, Sub_metering_2, col="red"))
with(Dt, lines(datetime, Sub_metering_3, col="blue"))

## Create the legend
legend("topright", 
       bty = "n", 
       lty = 1,
       col = c("black", "red", "blue"), 
       legend = names(Dt)[7:9]
)

## Create 3rd plot: Voltage x Datetime
with(Dt, plot(datetime, Voltage, 
              type="l",
              main="" 
##              ylab="Voltage",
##              xlab="datetime"
            )
    )

## Create 4th plot: Global Reactive Power x Datetime
with(Dt, plot(datetime, Global_reactive_power, 
              type="l",
              main="" 
##            ylab="Voltage",
##            xlab="datetime"
            )
    )

## Close graphic device
dev.off()
