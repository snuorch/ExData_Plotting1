#read csv file (change default separator ";")
mydataset <- read.csv("inputfile//household_power_consumption.txt",  sep=";")

#Convert Date column from factor to Date
mydataset$Date <- as.Date(mydataset$Date, format = "%d/%m/%Y")

#Subset DataFrame in a new DataFrame according to Course Project (date between 2007-02-01 and 2007-02-02)
newdataset <- mydataset[mydataset$Date >= "2007-02-01" & mydataset$Date <= "2007-02-02",]

newdataset$Global_active_power <- as.numeric(as.character(newdataset$Global_active_power))
newdataset$Global_reactive_power <- as.numeric(as.character(newdataset$Global_reactive_power))
newdataset$Voltage <- as.numeric(as.character(newdataset$Voltage))
newdataset$Sub_metering_1 <- as.numeric(as.character(newdataset$Sub_metering_1))
newdataset$Sub_metering_2 <- as.numeric(as.character(newdataset$Sub_metering_2))
newdataset$Sub_metering_3 <- as.numeric(as.character(newdataset$Sub_metering_3))

#create new colomn pasting Date and time
newdataset$CompleteDate <- paste(newdataset$Date, newdataset$Time)
newdataset$CompleteDate <- strptime(newdataset$CompleteDate, "%Y-%m-%d %H:%M:%S")

par(mfrow=c(2,2))
Sys.setlocale("LC_TIME", "en_US.UTF-8")

#plot1
plot(newdataset$CompleteDate, newdataset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

#plot2
plot(newdataset$CompleteDate, newdataset$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

#Plot3
plot(newdataset$CompleteDate, newdataset$Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub metering")
lines(newdataset$CompleteDate, newdataset$Sub_metering_2, type = "l", col="red")
lines(newdataset$CompleteDate, newdataset$Sub_metering_3, type = "l", col="blue")
legend('topright', c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),  cex=.5, lty=c(1,1,1), lwd=c(1,1,1), col=c('black','red','blue'),bty='n')

#plot4
plot(newdataset$CompleteDate, newdataset$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")


#Save Filede
dev.copy(png, file = "plot4.png")

dev.off()


