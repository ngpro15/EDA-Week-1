mydata <- read.table("household_power_consumption.txt",sep = ";",header = T)
View(mydata)

#Reading relevant info
mydata <- mydata[mydata$Date=="1/2/2007" | mydata$Date=="2/2/2007",]
mydata$DateTime <- as.POSIXct(paste(mydata$Date, mydata$Time), format = "%d/%m/%Y %H:%M:%S")

#Preprocessing the variable Global active power
mydata$Global_active_power <- as.numeric(as.character(mydata$Global_active_power))

#Launching png graphics device
png("plot2.png",height = 480,width = 480)

#Plotting the image
plot(mydata$DateTime,mydata$Global_active_power,type = "l",
     xlab = "",ylab = "Global Active Power (kilowatts)")

dev.off()
