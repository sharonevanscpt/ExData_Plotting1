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
## Open png of required size and name
png(filename="plot1.png", width=480, height=480, units="px")
## Write histogram as required
hist(dat1$Global_active_power,col="red",main ="Global Active Power",xlab ="Global Active Power (kilowatts)")
## Close png
dev.off()
