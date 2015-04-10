savepng <- function(){
  png("plot3.png", width = 450, height = 450)
  plot3()
  dev.off()
}

plot3 <- function(){
  data = read.delim("household_power_consumption.txt",skip=tail(grep("31/1/2007", readLines("household_power_consumption.txt")),n=1),sep = ";", nrows=2880, na.strings = "?", header = FALSE)
  colnames(data) = c("date", "time", "Global Active Power", "Global Reactive Power", "Voltage", "Globale Intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3") 
  
  par("cex" = 0.5)
  plot(c(1:2880), data$Sub_metering_1,type = "n", ylab = "Energy to sub metering", xlab = "", xaxt = "n")
  axis(1, at=c(1,1440, 2880), labels=c("Thu", "Fri", "Sat"))
  points(c(1:2880),data$Sub_metering_1, type = "l")
  points(c(1:2880),data$Sub_metering_2, type = "l", col = "red")
  points(c(1:2880),data$Sub_metering_3, type = "l", col = "blue")
  legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lty=c(1,1,1))
}