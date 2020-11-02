#setting language to english for day names to be in eng
Sys.setlocale(category = "LC_ALL", locale = "english")

#reading and cleaning the data
raw_data <- read.table("household_power_consumption.txt",header=TRUE, sep =";",na.strings = "?")
data <- subset(raw_data, Date %in% c("1/2/2007","2/2/2007"))
data$Date <- as.Date(data$Date, "%d/%m/%Y")
datetime <- paste(as.Date(data$Date),data$Time)
data$Datetime <- as.POSIXct(datetime)

png("plot4.png")

par(mfrow = c(2,2))

with(data, {plot(Global_active_power ~ Datetime, type ="l",
                xlab = "",
                ylab = "Global Active Power")
     plot(Voltage ~ Datetime, type = "l",
          xlab = "datetime", ylab = "Voltage")
     plot(Sub_metering_1 ~ Datetime, type ="l",
          xlab = "",
          ylab = "Energy sub metering")
     lines(data$Sub_metering_2 ~ data$Datetime, col = 'Red')
     lines(data$Sub_metering_3 ~ data$Datetime, col = 'Blue')
     legend("topright", col =c("black","red","blue"), 
       lty=1, lwd=2,
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n")
     plot(Global_reactive_power ~ Datetime, type = "l",
     xlab = "datetime", ylab = "Global_reactive_power")
     })
dev.off()
