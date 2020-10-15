filename <- "household_power_consumption.txt"

if (file.exists(filename) == FALSE)
    unzip("exdata_data_household_power_consumption.zip", c(filename))

df <- read.csv(filename, header = TRUE, sep = ";", na.strings = "?")[66637:69516,]
            
png("plot1.png", width = 480, height = 480)

hist(df$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

dev.off()