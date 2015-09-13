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

subtable<-data.table(TIME=time,SUB1=sub1,SUB2=sub2,SUB3=sub3)
with(subtable,plot(TIME,SUB1,type="l",xlab="",ylab="Energy sub metering"))
with(subtable,lines(TIME,SUB2,col="red"))
with(subtable,lines(TIME,SUB3,col="blue"))
legend("topright", col = c("black","red","blue"), lwd=1,lty=1,legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png,'plot3.png',width=480,height=480)
dev.off()