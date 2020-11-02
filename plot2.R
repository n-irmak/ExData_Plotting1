#setting language to english for day names to be in eng
Sys.setlocale(category = "LC_ALL", locale = "english")

#reading and cleaning the data
raw_data <- read.table("household_power_consumption.txt",header=TRUE, sep =";",na.strings = "?")
data <- subset(raw_data, Date %in% c("1/2/2007","2/2/2007"))
data$Date <- as.Date(data$Date, "%d/%m/%Y")
datetime <- paste(as.Date(data$Date),data$Time)
data$Datetime <- as.POSIXct(datetime)

#creating the plot and writing it to a png file

png("plot2.png")

with (data, plot(Global_active_power ~ Datetime, type ="l",
                 xlab = "",
                 ylab = "Global Active Power (kilowatts)"))

dev.off()
