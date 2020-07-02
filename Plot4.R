setwd("C:\\Users\\naman\\Documents\\R\\Coursera Specialization\\Course-4\\Week-1")

mydata <- read.table("household_power_consumption.txt",sep = ";",header = T)
View(mydata)

#Reading relevant info
mydata <- mydata[mydata$Date=="1/2/2007" | mydata$Date=="2/2/2007",]
mydata$DateTime <- as.POSIXct(paste(mydata$Date, mydata$Time), format = "%d/%m/%Y %H:%M:%S")

#Preprocessing the variables
mydata$Global_active_power <- as.numeric(as.character(mydata$Global_active_power))
mydata$Voltage <- as.numeric(as.character(mydata$Voltage))

mydata$Sub_metering_1 <- as.numeric(as.character(mydata$Sub_metering_1))
mydata$Sub_metering_2 <- as.numeric(as.character(mydata$Sub_metering_2))
mydata$Sub_metering_3 <- as.numeric(as.character(mydata$Sub_metering_3))

mydata$Global_reactive_power <- as.numeric(as.character(mydata$Global_reactive_power))

#Launching png graphics device
png("plot4.png",height = 480,width = 480)

#Plotting the image
par(mfrow=c(2,2))

plot(mydata$DateTime,mydata$Global_active_power,xlab = "",
     ylab = "Global Active Power",type = "l")

plot(mydata$DateTime,mydata$Voltage,xlab = "datetime",
     ylab = "Voltage",type = "l")

plot(mydata$DateTime,mydata$Sub_metering_1,ylab = "Energy sub metering",
     xlab = "" ,col="black",type = "l")
lines(mydata$DateTime,mydata$Sub_metering_2,col="red")
lines(mydata$DateTime,mydata$Sub_metering_3,col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty = 1,box.lty = 0,cex = 0.9)

plot(mydata$DateTime,mydata$Global_reactive_power,xlab = "datetime",
     ylab = "Global_reactive_power",type = "l")

dev.off()
