filename <- "household_power_consumption.txt"

if (file.exists(filename) == FALSE)
    unzip("exdata_data_household_power_consumption.zip", c(filename))

df <- read.csv(filename, header = TRUE, sep = ";", na.strings = "?")[66637:69516,]

df$Date_Time <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")

png("plot3.png", width = 480, height = 480)

plot(df$Date_Time, df$Sub_metering_1, type ='l', xlab="", ylab="Energy sub metering")
lines(df$Date_Time, df$Sub_metering_2, col="red", type='l')
lines(df$Date_Time, df$Sub_metering_3, col="blue", type='l')

legend("topright", col=c("black","blue","red"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, cex=0.95)

dev.off()