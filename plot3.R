## Save url
daturl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
## Download file to set name
download.file(daturl,"Householdpower.zip")
## Unzip file
unzip("Householdpower.zip")
## Read the text file
dato <- read.table("household_power_consumption.txt",header=TRUE,sep=";",quote="\"",na.strings="?",nrows=2100000)
## Fix date format
dato$Date <- as.Date(dato$Date, "%d/%m/%Y")
## Subset for required dates
dat1 <- subset(dato, Date=="2007-02-01"|Date=="2007-02-02")
## Merge date and time to one field
dat1$DatTime <- as.POSIXct(paste(dat1$Date, dat1$Time), format="%Y-%m-%d %H:%M:%S")

## Open png of required size and name
png(filename="plot3.png", width=480, height=480, units="px")
## Write plot as required and add additional lines
plot(dat1$DatTime, dat1$Sub_metering_1, type="l", xlab="",ylab="Energy sub metering")
lines(dat1$DatTime,dat1$Sub_metering_2, col="red")
lines(dat1$DatTime,dat1$Sub_metering_3, col="blue")
## Add legend
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
## Close png
dev.off()
