## Reading full data file
Dt<-read.csv("../household_power_consumption.txt", sep=";", 
                   na.strings="?", stringsAsFactors=F)
## Subsetting data to days 2007-02-01 and 2007-02-02
Dt<-subset(Dt, Date == "1/2/2007" | Date == "2/2/2007")
## Convert character date/time to proper date/time format
