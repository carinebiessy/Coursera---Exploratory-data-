DB <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
DBfinal <- data[DB$Date %in% c("1/2/2007","2/2/2007") ,]
head(DBfinal)

electpower<- as.numeric(DBfinal$Global_active_power)
head(electpower)

hist(electpower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

png("Plot1.png", width=480, height=480)
hist(electpower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
