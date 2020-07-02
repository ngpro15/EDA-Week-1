mydata <- read.table("household_power_consumption.txt",sep = ";",header = T)
View(mydata)

#Reading relevant info
mydata <- mydata[mydata$Date=="1/2/2007" | mydata$Date=="2/2/2007",]
mydata$DateTime <- as.POSIXct(paste(mydata$Date, mydata$Time), format = "%d/%m/%Y %H:%M:%S")

#Preprocessing the variable sub metering
mydata$Sub_metering_1 <- as.numeric(as.character(mydata$Sub_metering_1))
mydata$Sub_metering_2 <- as.numeric(as.character(mydata$Sub_metering_2))
mydata$Sub_metering_3 <- as.numeric(as.character(mydata$Sub_metering_3))

#Launching png graphics device
png("plot3.png",height = 480,width = 480)

#Plotting the image
plot(mydata$DateTime,mydata$Sub_metering_1,ylab = "Energy sub metering",
     xlab = "" ,col="black",type = "l")
lines(mydata$DateTime,mydata$Sub_metering_2,col="red")
lines(mydata$DateTime,mydata$Sub_metering_3,col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty = 1)

dev.off()
