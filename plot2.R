dir.create("./Assignment 1")
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "./Assignment 1/data.zip", method = "auto")
unzip("./Assignment 1/data.zip", exdir = "./Assignment 1")
setwd("./Assignment 1")

data <- readLines("household_power_consumption.txt")

myrows <- c(1, grep("^[1-2]/2/2007", data))

X <- read.table(text = data[myrows], sep = ";", header = T)

X$DateForm <- strptime(paste(X[ ,1], X[ ,2], sep = " "), "%e/%m/%Y %H:%M:%S")

## Plot 2

png(filename = "plot2.png")
plot(X[,10], X[,3], type = "l", xlab = "", ylab = "Global Active Power (kilowats)")
dev.off()