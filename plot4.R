library("data.table")
## read in the power consumption data file

powertable<-read.csv("household_power_consumption.txt",sep=";")

## pull out data from 1/2/2007 and 2/2/2007

powertable1<-powertable[powertable$Date == "1/2/2007",]
powertable2<-powertable[powertable$Date == "2/2/2007",]
powertable<-rbind(powertable1,powertable2)

## plot data and save to file
time<-strptime(paste(powertable$Time,powertable$Date),format="%H:%M:%S %d/%m/%Y")
sub1<-as.numeric(as.character(powertable$Sub_metering_1))
sub2<-as.numeric(as.character(powertable$Sub_metering_2))
sub3<-as.numeric(as.character(powertable$Sub_metering_3))
gap<-as.numeric(as.character(powertable$Global_active_power))
voltage<-as.numeric(as.character(powertable$Voltage))
grp<-as.numeric(as.character(powertable$Global_reactive_power))

subtable<-data.table(TIME=time,SUB1=sub1,SUB2=sub2,SUB3=sub3,GAP=gap,VOLTAGE=voltage,GRP=grp)

# want a 2 by 2 layout of graphs
par(mfrow=c(2,2))

with(subtable, {
#upper left
plot(TIME,GAP,type="l",xlab="",ylab="Global Active Power")
#upper right
plot(TIME,VOLTAGE,type="l",xlab="datetime",ylab="Voltage")
#lower left
with(subtable, {
plot(TIME,SUB1,type="l",xlab="",ylab="Energy sub metering")
lines(TIME,SUB2,type="l",col="red")
lines(TIME,SUB3,type="l",col="blue")
legend("topright", bty="n",col = c("black","red","blue"), lwd=1,lty=1,legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
}
)
#lower right
plot(TIME,GRP,type="l",xlab="datetime",ylab="Global_reactive_power")
}
)

dev.copy(png,'plot4.png',width=480,height=480)
dev.off()