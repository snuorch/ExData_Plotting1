#read csv file (change default separator ";")
mydataset <- read.csv("inputfile//household_power_consumption.txt",  sep=";")

#Convert Date column from factor to Date
mydataset$Date <- as.Date(mydataset$Date, format = "%d/%m/%Y")

#Subset DataFrame in a new DataFrame according to Course Project (date between 2007-02-01 and 2007-02-02)
newdataset <- mydataset[mydataset$Date >= "2007-02-01" & mydataset$Date <= "2007-02-02",]

newdataset$Sub_metering_1 <- as.numeric(as.character(newdataset$Sub_metering_1))
newdataset$Sub_metering_2 <- as.numeric(as.character(newdataset$Sub_metering_2))
newdataset$Sub_metering_3 <- as.numeric(as.character(newdataset$Sub_metering_3))

#create new colomn pasting Date and time
newdataset$CompleteDate <- paste(newdataset$Date, newdataset$Time)
newdataset$CompleteDate <- strptime(newdataset$CompleteDate, "%Y-%m-%d %H:%M:%S")
#Plot hist
Sys.setlocale("LC_TIME", "en_US.UTF-8")
plot(newdataset$CompleteDate, newdataset$Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub metering")
lines(newdataset$CompleteDate, newdataset$Sub_metering_2, type = "l", col="red")
lines(newdataset$CompleteDate, newdataset$Sub_metering_3, type = "l", col="blue")

legend('topright', c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'));
#Save Filede
dev.copy(png, file = "plot3.png")

dev.off()