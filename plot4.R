dir.create("./Assignment 1")
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "./Assignment 1/data.zip", method = "auto")
unzip("./Assignment 1/data.zip", exdir = "./Assignment 1")
setwd("./Assignment 1")

data <- readLines("household_power_consumption.txt")

myrows <- c(1, grep("^[1-2]/2/2007", data))

X <- read.table(text = data[myrows], sep = ";", header = T)

X$DateForm <- strptime(paste(X[ ,1], X[ ,2], sep = " "), "%e/%m/%Y %H:%M:%S")

## Plot 4

png(filename = "plot4.png")
par(mfrow = c(2, 2))
with(X, {
  plot(X[,10], X[,3], type = "l", xlab = "", ylab = "Global Active Power")
  plot(X[,10], X[,5], type = "l", xlab = "datetime", ylab = "Voltage")
  with(X, plot(DateForm, Sub_metering_1, main = "", xlab = "", ylab = "Energy sub metering", type = "n"))
    with(X, lines(DateForm, Sub_metering_1, col = "black"))
    with(X, lines(DateForm, Sub_metering_2, col = "red"))
    with(X, lines(DateForm, Sub_metering_3, col = "blue"))
    legend("topright", lty = 1, bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(X[,10], X[,4], type = "l", xlab = "datetime", ylab = "Global_reactive_power")
})
dev.off()