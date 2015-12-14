require("plyr")
require("data.table")
f <- fread("household_power_consumption.txt" , sep=";", na.strings="?", header=TRUE)
DT <- f[as.Date(Date,"%d/%m/%Y") >= "2007-02-01" & as.Date(Date,"%d/%m/%Y") <= "2007-02-02"]

##PLot 1
png("plot1.png" , width=480 , height = 480)
hist(DT$Global_active_power, xlab= "Global Active Power (kilowatts)" , col="red", main = "Global Active Power")
## Copy my plot to a PNG file
dev.off()