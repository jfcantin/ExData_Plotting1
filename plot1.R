# Cleanup
rm(list=ls())

source("dataFileReader.R") # Functions for datafile

df <- getElectricPowerDatasetWithFixedRange()

png(file = "plot1.png", width=480, height = 480) 

hist(df$Global_active_power, 
     col="red", 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")

dev.off()

