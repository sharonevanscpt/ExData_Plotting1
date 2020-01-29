daturl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(daturl,"Householdpower.zip")
unzip("Householdpower.zip")

dato <- read.table("household_power_consumption.txt",header=TRUE,sep=";",quote="\"",na.strings="?",nrows=2100000)
dato$Date <- as.Date(dato$Date, "%d/%m/%Y")
##dato$Time <- format(strptime(dato$Time, "%H:%M:%S"),"%H:%M:%S")


dat1 <- subset(dato, Date=="2007-02-01"|Date=="2007-02-02")
hist(dat1$Global_active_power,col="red",main ="Global Active Power",xlab ="Global Active Power (kilowatts)")

## need to add png data
