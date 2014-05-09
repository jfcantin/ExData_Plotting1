getElectricPowerDataset <- function(){
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
    
    data <- read.table(unz(zipfile, houseHoldPowerFileName), header=TRUE,sep=";", 
                       colClasses="character", nrows=2076000)
    
    startDate <- as.Date("2007-02-01", format="%Y-%m-%d")
    endDate <- as.Date("2007-02-02", format="%Y-%m-%d")
    data <- data[data$Date >= startDate & data$Date <= endDate,]    
    
    datetime <- paste(data[,1], data[,2],sep=" ")
    datetime <- strptime(datetime, format="%d/%m/%Y %H:%M:%S")
    data[,1] <- as.Date(data[,1], format="%d/%m/%Y")
    data[,3:9] <- lapply(data[3:9], as.numeric)
    data <- cbind(data, datetime)
    #a<-read.table("data//household_power_consumption.txt", header=FALSE,sep=";", nrows=1000)
    return(data)
}