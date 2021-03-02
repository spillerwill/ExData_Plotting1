## Plot 2

# Read in the raw data
power_all <- read.csv("household_power_consumption.txt", 
                      header = TRUE, sep = ";", na.strings = "?")

# Subset the 2-day period of analysis
power <- subset(power_all, Date %in% c("1/2/2007", "2/2/2007"))

# Format date and time into a single POSIXlt variable
power$Date_Time <- with(
    power, strptime(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")
)

# Generate the line plot
png("plot2.png", width = 480, height = 480)

plot(x = power$Date_Time, 
     y = power$Global_active_power, 
     type = "l", 
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()
