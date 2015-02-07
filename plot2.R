#setting locale language to english
user_lang <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "en_US.utf8")
#project1
#reading data
data <- read.table("./household_power_consumption.txt", header = TRUE, 
                   stringsAsFactors = FALSE, sep = ";", na.string = "?")
#selecting right dates
gooddate <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
gooddate$Date.Time <- strptime(paste(gooddate$Date, gooddate$Time),  format = "%d/%m/%Y %H:%M:%S")
#plotting data
library(datasets)
with(gooddate, plot(Date.Time, Global_active_power, type="l", 
                    ylab = "Global Active Power (kilowatts)", xlab = ""))
#generating png file  
dev.copy(png, file = "./ExData_Plotting1/plot2.png", width = 480, height = 480)
dev.off()
#resetting locale language to user language
Sys.setlocale("LC_TIME", user_lang)
