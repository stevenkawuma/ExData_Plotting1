# Read in data for 1/2/2007 and 2/2/2007
# Used a text editor to find number of rows to skip 
df <- read.table("../household_power_consumption.txt", sep=";", skip = 66637, nrows = 2880,
                 na.strings = "?")

# Get and assign column names
colnames(df) <- colnames(read.table("../household_power_consumption.txt", sep=";", 
                                   header = TRUE, nrows = 1))

# Create new datetime column 
df$DateTime <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")

# png(filename = "plot4.png",height=480, width = 480, units = "px")
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(df, {
  plot(DateTime, Global_active_power, type = "l", ylab = "Global Active Power")
  plot(DateTime, Voltage, type = "l")
  
  plot(DateTime, Sub_metering_1, type="n", ylab = "Energy sub metering", xlab = "")
  points(DateTime, Sub_metering_1, type="l")
  points(DateTime, Sub_metering_2, type="l", col="red")
  points(DateTime, Sub_metering_3, type="l", col="blue")
  legend("topright", lty = 1, col=c("black", "red", "blue"),
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  plot(DateTime, Global_reactive_power, type="l")
})
# dev.off()