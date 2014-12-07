if (!exists('powerData') ) {
  source('getData.R')
}
png("plot1.png", width=480, height=480)
hist(powerData$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()