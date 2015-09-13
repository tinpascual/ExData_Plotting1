plot4<-function(){
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "powerData.zip")
    unzip("powerData.zip")
    dataColNames = read.table("household_power_consumption.txt", nrows=1, sep=";", stringsAsFactors = FALSE)
    powerData = read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), sep=";", col.names=dataColNames[1, ], stringsAsFactors = FALSE)
    powerData$Date.Time <-paste(powerData$Date, powerData$Time, sep = " ")
    powerData$Date.Time <-strptime(powerData$Date.Time, "%d/%m/%Y %H:%M:%S")
    
    # plot 3: Energy sub metering over the days
    png(filename = "plot4.png", width = 480, height = 480)
    
    par(mfrow = c(2,2))
    with(powerData, {
        plot(Date.Time, Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")
        plot(Date.Time, Voltage, xlab="datetime", ylab="Voltage", type="l")
        plot(Date.Time, Sub_metering_1, col="black", type="l", xlab="",
                  ylab="Energy sub metering");
            lines(Date.Time, Sub_metering_2, col="red", type="l");
            lines(Date.Time, Sub_metering_3, col="blue", type="l");
            legend("topright", col=c("black", "red", "blue"), lty=1,
                   legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
        plot(Date.Time, Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")
    }, mar=0)
    
    dev.off()
}