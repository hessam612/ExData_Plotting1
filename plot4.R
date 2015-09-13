##Read Data
initial<-read.table("household_power_consumption.txt",sep=";",nrow=100)
classes<-sapply(initial,class)
tab<-read.table("household_power_consumption.txt",sep=";",colClasses=classes,header=T)
##Change Date Format
tab$Date<-as.Date(tab$Date, format="%d/%m/%Y")
##Subset
sub.tab<-tab[tab$Date=="2007-02-01"|tab$Date=="2007-02-02",]
##Define Datetime
Datetime <- paste(as.Date(sub.tab$Date), sub.tab$Time)
sub.tab$Datetime <- as.POSIXct(Datetime)
##Make Numeric & Remove NA
sub.tab$Global_active_power <- as.numeric(as.character(sub.tab$Global_active_power))
sub.tab$Global_reactive_power <- as.numeric(as.character(sub.tab$Global_reactive_power))
sub.tab$Voltage <- as.numeric(as.character(sub.tab$Voltage))
sub.tab$Sub_metering_1 <- as.numeric(as.character(sub.tab$Sub_metering_1))
sub.tab$Sub_metering_2 <- as.numeric(as.character(sub.tab$Sub_metering_2))
sub.tab$Sub_metering_3 <- as.numeric(as.character(sub.tab$Sub_metering_3))
##Plotting

par(mfrow=c(2,2))
##Plot1
plot(sub.tab$Datetime,sub.tab$Global_active_power, type="l", xlab="", ylab="Global Active Power")
##Plot2
plot(sub.tab$Datetime,sub.tab$Voltage, type="l", xlab="datetime", ylab="Voltage")
##Plot3
plot(sub.tab$Datetime,sub.tab$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(sub.tab$Datetime,sub.tab$Sub_metering_2,col="red")
lines(sub.tab$Datetime,sub.tab$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5) #bty removes the box, cex shrinks the text, spacing added after labels so it renders correctly
##Plot4
plot(sub.tab$Datetime,sub.tab$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
##Copy2PNG
dev.copy(png, file="plot4.png")
dev.off()