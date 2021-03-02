## Plot 3

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
png("plot3.png", width = 480, height = 480)

plot(x = power$Date_Time, 
     y = power$Sub_metering_1, 
     type = "l", 
     xlab = "",
     ylab = "Energy sub metering")

lines(x = power$Date_Time, 
      y = power$Sub_metering_2, 
      col = "red")

lines(x = power$Date_Time, 
      y = power$Sub_metering_3, 
      col = "blue")

legend("topright", 
       y = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), 
       lty = c(1, 1), 
       lwd = c(1, 1))

dev.off()
