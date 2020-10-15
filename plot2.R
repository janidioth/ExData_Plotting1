filename <- "household_power_consumption.txt"

if (file.exists(filename) == FALSE)
    unzip("exdata_data_household_power_consumption.zip", c(filename))

df <- read.csv(filename, header = TRUE, sep = ";", na.strings = "?")[66637:69516,]
# Add a column for date time
df$Date_Time <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")

png("plot2.png", width = 480, height = 480)

plot(df$Date_Time, df$Global_active_power, type='l', xlab="", 
     ylab="Global Active Power (kilowatts)")

dev.off()