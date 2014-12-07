if (!exists('powerData') ) {
  zipfile<-('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip')
  download.file(zipfile,"powerConsumption.zip")
  unzip("powerConsumption.zip")
  powerData<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",stringsAsFactors=FALSE)
  powerData<-powerData[as.Date(powerData$Date,format="%d/%m/%Y") >=  as.Date('2007-02-01') & as.Date(powerData$Date,format="%d/%m/%Y") <=  as.Date('2007-02-02'),]
}

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

plot(powerData$Timestamp,powerData$Global_active_power,type="l",
     xlab="",ylab="Global Active Power")
plot(powerData$Timestamp,powerData$Voltage,type="l",
     xlab="datetime",ylab="Voltage")

plot(powerData$Timestamp,powerData$Sub_metering_1,type='n',xlab="",ylab="Energy sub metering")
lines(powerData$Timestamp,powerData$Sub_metering_1,type='l',col='black')   
lines(powerData$Timestamp,powerData$Sub_metering_2,type='l',col='red')   
lines(powerData$Timestamp,powerData$Sub_metering_3,type='l',col='blue')    
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty=1,bty = "n")
plot(powerData$Timestamp,powerData$Global_reactive_power,type="l",
     xlab="datetime",ylab="Global_reactive_power")
dev.off()
