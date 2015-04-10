savepng <- function(){
  png("plot1.png", width = 450, height = 450)
  plot1()
  dev.off()
}

plot1 <- function(){
  data = read.delim("household_power_consumption.txt",skip=tail(grep("31/1/2007", readLines("household_power_consumption.txt")),n=1),sep = ";", nrows=2880, na.strings = "?", header = FALSE)
  colnames(data) = c("date", "time", "Global Active Power", "Global Reactive Power", "Voltage", "Globale Intensity", "Sub Metering 1", "Sub Metering 2", "Sub Metering 3") 
  hist(data$"Global Active Power", col = "red", ylab = " Frequency", xlab = "Global Active Power (kilowatts)", main = "Global Active Power", ylim = range(0,1200,200))
  
}

