rm(list=ls())

source("helpers.R")


hpc.df <- getElectricPowerDataset()

#try quick and dirty
columnNames <- colnames(read.table("data//household_power_consumption.txt",
                                   nrow = 1,header = TRUE,sep=";"))
df <- read.table("data//household_power_consumption.txt",
                  skip = 66637,nrow = 2880,sep = ";",
                  col.names = columnNames,na.strings = "?")
datetime <- paste(df$Date,df$Time,sep=" ")
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df$Time <- strptime(datetime, format = "%d/%m/%Y %H:%M:%S")
str(df)

png(file = "plot1.png", width=480, height = 480, bg="transparent")
with(df, hist(df$Global_active_power, 
              col="red", 
              xlab = "Global Active Power (kilowatts)", 
              bg="transparent", 
              main = "Global Active Power"))
dev.off()

