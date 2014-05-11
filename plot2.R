# Cleanup
rm(list=ls())

source("dataFileReader.R") # Functions for datafile

df <- getElectricPowerDatasetWithFixedRange()

png(file = "plots//plot2.png", width=480, height = 480) 

plot(df$Time, df$Global_active_power, type="l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()

