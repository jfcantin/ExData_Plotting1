rm(list=ls())

source("helpers.R")

hpc.df <- getElectricPowerDataset()

png(file = "plot1.png", width=480, height = 480, bg="transparent")
with(df, hist(df$Global_active_power, 
              col="red", 
              xlab = "Global Active Power (kilowatts)", 
              bg="transparent", 
              main = "Global Active Power"))
dev.off()

