getElectricPowerDatasetWithFixedRange <- function(){
    if(!file.exists("data")){
        dir.create("data")
    }
    
    zipfile <- "data//electricPower.zip"
    if(!file.exists(zipfile)){
        fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(fileUrl, destfile=zipfile)
        dateDownloaded <- date()
        write.table(dateDownloaded, file="data//dateDownloaded.txt")
    }
    
    houseHoldPowerFileName <- "household_power_consumption.txt"
    
    columnClasses <- c(rep("factor", 2), rep("numeric", 7))
    data <- read.table(unz(zipfile, houseHoldPowerFileName), 
                       header=TRUE,
                       sep=";", 
                       colClasses=columnClasses,
                       nrows=2076000, na.strings="?")
    
    startDate <- "1/2/2007"
    endDate <- "2/2/2007"
    data <- data[data$Date == startDate | data$Date == endDate,]    

    datetime <- paste(data$Date, data$Time, sep=" ")
    data$Date <- as.Date(data$Date, format="%d/%m/%Y")
    data$Time <- strptime(datetime, format="%d/%m/%Y %H:%M:%S")

    return(data)
}