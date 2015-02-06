#project1
#reading data
data <- read.table("./household_power_consumption.txt", header = TRUE, 
                   stringsAsFactors = FALSE, sep = ";", na.string = "?")
#selecting right dates and opening png device
gooddate <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
gooddate$Date.Time <- strptime(paste(gooddate$Date, gooddate$Time),  format = "%d/%m/%Y %H:%M:%S")
png(file = "./ExData_Plotting1/ExData_Plotting1/plot3.png", width = 480, height = 480)
#plotting data
library(datasets)
with(gooddate, plot(Date.Time, Sub_metering_1, type="l", 
                    ylab = "Energy sub metering", xlab = ""))
lines(gooddate$Date.Time,gooddate$Sub_metering_2,col="red")
lines(gooddate$Date.Time,gooddate$Sub_metering_3,col="blue")
legend("topright",  col = c("black", "red", "blue"),lty = c("solid", "solid", "solid"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.95)
dev.off()
