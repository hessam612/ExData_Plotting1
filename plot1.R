##Read Data
initial<-read.table("household_power_consumption.txt",sep=";",nrow=100)
classes<-sapply(initial,class)
tab<-read.table("household_power_consumption.txt",sep=";",colClasses=classes,header=T)
##Change Date Format
tab$Date<-as.Date(tab$Date, format="%d/%m/%Y")
##Subset
sub.tab<-tab[tab$Date=="2007-02-01"|tab$Date=="2007-02-02",]
##Make Numeric & Remove NA
sub.tab$Global_active_power <- as.numeric(as.character(sub.tab$Global_active_power))
hist(sub.tab$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")
dev.copy(png,file="plot1.png")
dev.off()