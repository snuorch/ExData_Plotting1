#read csv file (change default separator ";")
mydataset <- read.csv("household_power_consumption.txt",  sep=";")

#Convert Date column from factor to Date
mydataset$Date <- as.Date(mydataset$Date, format = "%d/%m/%Y")

#Subset DataFrame in a new DataFrame according to Course Project (date between 2007-02-01 and 2007-02-02)
newdataset <- mydataset[mydataset$Date >= "2007-02-01" & mydataset$Date <= "2007-02-02",]

#Convert Global Active Power to Numeric (this is the field we have to plot in exercise 1)
newdataset$Global_active_power <- as.numeric(as.character(newdataset$Global_active_power))

#Plot hist
hist(newdataset$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")

#Save Filede
dev.copy(png, file = "plot1.png")

dev.off()