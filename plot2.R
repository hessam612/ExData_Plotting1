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
##Plotting
plot(sub.final~sub.tab$Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="")
##Copy2PNG
dev.copy(png,file="plot2.png")
dev.off()