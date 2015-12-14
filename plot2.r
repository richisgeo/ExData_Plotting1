require("plyr")
require("data.table")
f <- fread("household_power_consumption.txt" , sep=";", na.strings="?", header=TRUE)
DT <- f[as.Date(Date,"%d/%m/%Y") >= "2007-02-01" & as.Date(Date,"%d/%m/%Y") <= "2007-02-02"]




###Plot 2
png("plot2.png" , width=480 , height = 480)
DT$datetime <- as.POSIXct(paste(as.Date(DT$Date,"%d/%m/%Y"),DT$Time))
plot(DT$datetime,DT$Global_active_power,type="l" , ylab = "Global active power (kilowatts)" , xlab = "")
dev.off()