# Cleanup
rm(list=ls())

source("dataFileReader.R") # Functions for datafile

df <- getElectricPowerDatasetWithFixedRange()

png(file = "plots//plot3.png", width=480, height = 480) 

plot(df$Time, df$Sub_metering_1, type="l",
     xlab = "",
     ylab = "Energy sub metering")
lines(df$Time, df$Sub_metering_2, col="red")
lines(df$Time, df$Sub_metering_3, col="blue")
legend("topright",legend=names(df)[7:9],
       col=c("black","red", "blue"),lty=1)
dev.off()

