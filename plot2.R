if (!exists('powerData') ) {
  source('getData.R')
}
powerData$Timestamp<- strptime(paste(powerData$Date,powerData$Time),format="%d/%m/%Y %H:%M:%S",tz="utc")
png("plot2.png", width=480, height=480)
plot(powerData$Timestamp,powerData$Global_active_power,type="l",
     xlab="",ylab="Global Active Power (kilowatts)")
dev.off()