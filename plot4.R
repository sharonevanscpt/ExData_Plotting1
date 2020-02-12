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
png(filename="plot4.png", width=480, height=480, units="px")
## Write plot as required and add additional lines
par(mfrow=c(2,2))
## Plot Top Left
plot(dat1$DatTime, dat1$Global_active_power, ylab ="Global Active Power",type="l",xlab="")
## Plot Top Right
plot(dat1$DatTime, dat1$Voltage, type="l", xlab="datetime",ylab="Voltage")
## Plot Bottom Left
plot(dat1$DatTime, dat1$Sub_metering_1, type="l", xlab="",ylab="Energy sub metering")
lines(dat1$DatTime,dat1$Sub_metering_2, col="red")
lines(dat1$DatTime,dat1$Sub_metering_3, col="blue")
## Need to fix outline of legen still
legend("topright", lty=1,bty="o", col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
## Plot Bottom Right
plot(dat1$DatTime, dat1$Global_reactive_power, type="l", xlab="datetime",ylab="Global_reactive_power")
## Close png
dev.off()
