DB <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
DBfinal <- data[DB$Date %in% c("1/2/2007","2/2/2007") ,]
electpower <- as.numeric(DBfinal$Global_active_power)
datetime <- strptime(paste(DBfinal$Date,DBfinal$Time,sep=" "),"%d/%m/%Y %H:%M:%S") 
head(DBfinal)
head(electpower)
head(datetime)

plot(datetime,electpower,type="l",xlab="",ylab="Global Active Power (kilowatts)")

png("Plot2.png", width=480, height=480)
datetime <- strptime(paste(DBfinal$Date,DBfinal$Time,sep=" "),"%d/%m/%Y %H:%M:%S") 
plot(datetime,electpower,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
