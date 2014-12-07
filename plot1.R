if (!exists('powerData') ) {
  zipfile<-('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip')
  download.file(zipfile,"powerConsumption.zip")
  unzip("powerConsumption.zip")
  powerData<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",stringsAsFactors=FALSE)
  powerData<-powerData[as.Date(powerData$Date,format="%d/%m/%Y") >=  as.Date('2007-02-01') & as.Date(powerData$Date,format="%d/%m/%Y") <=  as.Date('2007-02-02'),]
}
png("plot1.png", width=480, height=480)
hist(powerData$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()