plot1<-function(){
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "powerData.zip")
    unzip("powerData.zip")
    dataColNames <- read.table("household_power_consumption.txt", nrows=1, sep=";", stringsAsFactors = FALSE)
    powerData <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), sep=";", col.names=dataColNames[1, ])
    
    # plot 1: Global_active_power histogram
    png(filename = "plot1.png", width = 480, height = 480)
    plot1 <- hist(powerData$Global_active_power)
    plot(plot1, col="red1", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power")
    dev.off()
}