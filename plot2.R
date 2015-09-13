plot2<-function(){
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "powerData.zip")
    unzip("powerData.zip")
    dataColNames = read.table("household_power_consumption.txt", nrows=1, sep=";", stringsAsFactors = FALSE)
    powerData = read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), sep=";", col.names=dataColNames[1, ], stringsAsFactors = FALSE)
    powerData$Date.Time <-paste(powerData$Date, powerData$Time, sep = " ")
    powerData$Date.Time <-strptime(powerData$Date.Time, "%d/%m/%Y %H:%M:%S")
    
    # plot 2: Global_active_power over the days
    png(filename = "plot2.png", width = 480, height = 480)
    plot(powerData$Date.Time, powerData$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")
    dev.off()
}