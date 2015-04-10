savepng <- function(){
  png("plot2.png", width = 450, height = 450)
  plot2()
  dev.off()
}

plot2 <- function(){
  data = read.delim("household_power_consumption.txt",skip=tail(grep("31/1/2007", readLines("household_power_consumption.txt")),n=1),sep = ";", nrows=2880, na.strings = "?", header = FALSE)
  colnames(data) = c("date", "time", "Global Active Power", "Global Reactive Power", "Voltage", "Globale Intensity", "Sub Metering 1", "Sub Metering 2", "Sub Metering 3") 
  plot(c(1:2880),data$"Global Active Power", type = "l", ylab = "Global Active Power (kilowatts)", xlab = "", xaxt = "n")
  axis(1, at=c(1,1440, 2880), labels=c("Thu", "Fri", "Sat"))
}