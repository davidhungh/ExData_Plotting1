mkthirdPlot <- function() { 
  # 
  # Coursera Exploratory Data Analysis
  # File:   Plot3.R
  # Date:   7.3.2015
  # 
  # To run this script
  # Assume that the file "household_power_consumption.txt", "readAndProcessData.R" 
  # and this script are in the same directory
  # > source("plot3.R")
  # > mkthirdPlot()
  
source("readAndProcessData.R")
  
cat("Create the plot ...")  

png(file = "plot3.png")
  with(dt.hpc, plot(DateTime, Sub_metering_1, type="l",xlab ="", ylab="Energy sub metering"))
  with(subset(dt.hpc), lines(DateTime, Sub_metering_2, col ="red"))
  with(subset(dt.hpc), lines(DateTime, Sub_metering_3, col ="blue"))
  legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

cat("... and write to file \n")
dev.off()

#clean up memmory
rm(list = ls())

cat("Done")

} # end of function