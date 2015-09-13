## read in the power consumption data file

powertable<-read.csv("household_power_consumption.txt",sep=";")

## pull out data from 1/2/2007 and 2/2/2007

powertable1<-powertable[powertable$Date == "1/2/2007",]
powertable2<-powertable[powertable$Date == "2/2/2007",]
powertable<-rbind(powertable1,powertable2)

## plot histogram and save to file

gaphistogram<-hist(as.numeric(as.character(powertable$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active power (kilowatts)",ylab="Frequency")
dev.copy(png,'plot1.png',width=480,height=480)
dev.off()