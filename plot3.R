if (!exists('powerData') ) {
  source('getData.R')
}
powerData$Timestamp<- strptime(paste(powerData$Date,powerData$Time),format="%d/%m/%Y %H:%M:%S",tz="utc")

png("plot3.png", width=480, height=480)
plot(powerData$Timestamp,powerData$Sub_metering_1,type='n',xlab="",ylab="Energy sub metering")
lines(powerData$Timestamp,powerData$Sub_metering_1,type='l',col='black')   
lines(powerData$Timestamp,powerData$Sub_metering_2,type='l',col='red')   
lines(powerData$Timestamp,powerData$Sub_metering_3,type='l',col='blue')    
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty=1)
dev.off()