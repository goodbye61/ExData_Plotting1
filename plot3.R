


dataset <- read.table("household_power_consumption.txt",header = T, 
                      sep = ";", colClasses = "character")

a <- subset(dataset, dataset$Date == "1/2/2007")
b <- subset(dataset, dataset$Date == "2/2/2007")
feb_data <- rbind(a,b)

time <- paste(feb_data$Date, feb_data$Time, sep = " ")
time <- strptime(time,"%d/%m/%Y %H:%M:%S")

feb_data <- cbind(feb_data,time)

png(filename = "plot3.png")

plot(feb_data$time, feb_data$Sub_metering_1,type = 'l',
     xlab = " ", ylab = "Energy sub metering")

lines(feb_data$time,feb_data$Sub_metering_2,type = 'l', col = "red")
lines(feb_data$time,feb_data$Sub_metering_3,type = 'l', col = "blue")

legend("topright", lty = c(1,1),col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()
