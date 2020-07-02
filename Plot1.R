#Reading dataset
mydata <- read.table("household_power_consumption.txt",sep = ";",header = T)
View(mydata)

#Reading relevant info
mydata <- mydata[mydata$Date=="1/2/2007" | mydata$Date=="2/2/2007",]

#Preprocessing the variable Global active power
mydata$Global_active_power <- as.numeric(as.character(mydata$Global_active_power))

#Launching png graphics device
png("plot1.png",height = 480,width = 480)

#Plotting the image
hist(mydata$Global_active_power,col = "red",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

dev.off()

