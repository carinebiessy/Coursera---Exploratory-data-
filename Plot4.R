DB <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
DBfinal <- data[DB$Date %in% c("1/2/2007","2/2/2007") ,]
head(DBfinal)
electpower <- as.numeric(DBfinal$Global_active_power)
datetime <- strptime(paste(DBfinal$Date,DBfinal$Time,sep=" "),"%d/%m/%Y %H:%M:%S") 
subM1 <- as.numeric(DBfinal$Sub_metering_1)
subM2 <- as.numeric(DBfinal$Sub_metering_2)
subM3 <- as.numeric(DBfinal$Sub_metering_3)
volt <- as.numeric(DBfinal$Voltage)
reactpower <- as.numeric(DBfinal$Global_reactive_power)

par(mfrow = c(2, 2)) 
plot(datetime,electpower,type="l",xlab="",ylab="Global Active Power")

plot(datetime,volt,type="l",xlab="datetime",ylab="Voltage")

plot(datetime,subM1,type="l",xlab="",ylab="Energy Submetering")
lines(datetime,subM2,type="l",col="red")
lines(datetime,subM3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=1,col=c("black", "red", "blue"))

plot(datetime,reactpower,type="l",xlab="datetime",ylab="Global_reactive_power")


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(datetime,electpower,type="l",xlab="",ylab="Global Active Power")

plot(datetime,volt,type="l",xlab="datetime",ylab="Voltage")

plot(datetime,subM1,type="l",xlab="",ylab="Energy Submetering")
lines(datetime,subM2,type="l",col="red")
lines(datetime,subM3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=1,col=c("black", "red", "blue"))

plot(datetime,reactpower,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off() 
