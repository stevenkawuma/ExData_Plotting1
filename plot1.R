# Read in data for 1/2/2007 and 2/2/2007
# Used a text editor to find number of rows to skip 
df <- read.table("../household_power_consumption.txt", sep=";", skip = 66637, nrows = 2880,
        na.strings = "?")

# Get and assign column names
colnames(df) <- colnames(read.table("../household_power_consumption.txt", sep=";", 
                                   header = TRUE, nrows = 1))

png(filename = "plot1.png",height=480, width = 480, units = "px")
with(df, 
     hist(Global_active_power, col = "red", main = "Global Active Power",
    xlab = "Global Active Power (kilowatts)")
)
dev.off()
