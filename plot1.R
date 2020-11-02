#reading and cleaning the data
raw_data <- read.table("household_power_consumption.txt",header=TRUE, sep =";",na.strings = "?")
data <- subset(raw_data, Date %in% c("1/2/2007","2/2/2007"))
data$Date <- as.Date(data$Date, "%d/%m/%Y")

#creating the histogram and writing it to a png file

png("plot1.png", width = 480, height = 480)

hist(data1$Global_active_power, col = "Red", 
     main ="Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")

dev.off()

