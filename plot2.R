#read csv file (change default separator ";")
mydataset <- read.csv("inputfile//household_power_consumption.txt",  sep=";")

#Convert Date column from factor to Date
mydataset$Date <- as.Date(mydataset$Date, format = "%d/%m/%Y")

#Subset DataFrame in a new DataFrame according to Course Project (date between 2007-02-01 and 2007-02-02)
newdataset <- mydataset[mydataset$Date >= "2007-02-01" & mydataset$Date <= "2007-02-02",]

#Convert Global Active Power to Numeric (this is the field we have to plot in exercise 2)
newdataset$Global_active_power <- as.numeric(as.character(newdataset$Global_active_power))
 
#create new colomn pasting Date and time
newdataset$CompleteDate <- paste(newdataset$Date, newdataset$Time)
newdataset$CompleteDate <- strptime(newdataset$CompleteDate, "%Y-%m-%d %H:%M:%S")
#Plot hist
Sys.setlocale("LC_TIME", "en_US.UTF-8")
plot(newdataset$CompleteDate, newdataset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")


#Save Filede
dev.copy(png, file = "plot2.png")

dev.off()