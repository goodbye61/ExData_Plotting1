

# plot 2  


dataset <- read.table("household_power_consumption.txt",header = T, 
                      sep = ";", colClasses = "character")

a <- subset(dataset, dataset$Date == "1/2/2007")
b <- subset(dataset, dataset$Date == "2/2/2007")
feb_data <- rbind(a,b)

time <- paste(feb_data$Date, feb_data$Time, sep = " ")
time <- strptime(time,"%d/%m/%Y %H:%M:%S")

feb_data <- cbind(feb_data,time)

png(filename = "plot2.png")

plot(feb_data$time, feb_data$Global_active_power, type = 'l',
     xlab=" ", ylab = "Global Active Power (kilowatts)")

dev.off()

