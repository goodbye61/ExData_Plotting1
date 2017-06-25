

dataset <- read.table("household_power_consumption.txt",header = T, 
                      sep = ";", colClasses = "character")

a <- subset(dataset, dataset$Date == "1/2/2007")
b <- subset(dataset, dataset$Date == "2/2/2007")
feb_data <- rbind(a,b)

time <- paste(feb_data$Date, feb_data$Time, sep = " ")
time <- strptime(time,"%d/%m/%Y %H:%M:%S")

feb_data <- cbind(feb_data,time)


par(mfcol = c(2,2))


# For plot (1,1) ( plot 2 ) 

png(filename = "plot4.png")

plot(feb_data$time,feb_data$Global_active_power,type='l',
     xlab = " ",ylab = "Global Active Power")


# FOR plot (2,1) ( plot 3)

with(feb_data,plot(time,Sub_metering_1,type='l',ylab = "Energy sub metering",xlab = " "))
with(feb_data,lines(time,Sub_metering_2,type='l',col = "red"))
with(feb_data,lines(time,Sub_metering_3,type='l',col = "blue"))

legend("topright",lty = c(1,1), col=c("black","red","blue")
       ,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex = 0.55,bty='n')


# For Plot (1,2) 

plot(feb_data$time, feb_data$Voltage, type = 'l',
     xlab = "datetime" , ylab = "Voltage")

# For Plot (2,2)


plot(feb_data$time, feb_data$Global_reactive_power, type ='l',
     xlab = "datetime", ylab = "Global_reactive_power")


dev.off()
