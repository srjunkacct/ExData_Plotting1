## read in the power consumption data file

powertable<-read.csv("household_power_consumption.txt",sep=";")

## pull out data from 1/2/2007 and 2/2/2007

powertable1<-powertable[powertable$Date == "1/2/2007",]
powertable2<-powertable[powertable$Date == "2/2/2007",]
powertable<-rbind(powertable1,powertable2)

## plot data and save to file
time<-strptime(paste(powertable$Time,powertable$Date),format="%H:%M:%S %d/%m/%Y")

gapplot<-plot(time,as.numeric(as.character(powertable$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)")


dev.copy(png,'plot2.png',width=480,height=480)
dev.off()