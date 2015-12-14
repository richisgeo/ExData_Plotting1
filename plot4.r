require("plyr")
require("data.table")
f <- fread("household_power_consumption.txt" , sep=";", na.strings="?", header=TRUE)
DT <- f[as.Date(Date,"%d/%m/%Y") >= "2007-02-01" & as.Date(Date,"%d/%m/%Y") <= "2007-02-02"]

DT$datetime <- as.POSIXct(paste(as.Date(DT$Date,"%d/%m/%Y"),DT$Time))
##Plot 4 fix labels
png("plot4.png" , width=480 , height = 480)
par(mfrow = c(2, 2))
plot(DT$datetime,DT$Global_active_power,type="l", ylab = "Global ACtive Power", xlab="")
plot(DT$datetime,DT$Voltage,type="l",  ylab = "Voltage" , xlab ="datetime")
plot(DT$datetime,DT$Sub_metering_1,type="l", xlab= "",ylab = "Energy sub metering")
par(new=T)
plot(DT$datetime,DT$Sub_metering_2,type="l",col= "red",axes = FALSE, xlab = "", ylab = "",ylim=range(c(DT$Sub_metering_1,DT$Sub_metering_2)))
par(new=T)
plot(DT$datetime,DT$Sub_metering_3,type="l",col="blue", xlab = "", ylab = "",axes = FALSE,ylim=range(c(DT$Sub_metering_1,DT$Sub_metering_2,DT$Sub_metering_3 )))
legend("topright",bty = "n",col = c("black","blue", "red"), legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"), lty= c(1,1,1))

plot(DT$datetime,DT$Global_reactive_power,type="l", ylab = "Globabl Reactive Power" ,xlab ="datetime")
dev.off()