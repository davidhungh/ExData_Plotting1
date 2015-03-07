mkfourthPlot <- function() { 
  # 
  # Coursera Exploratory Data Analysis
  # File:   Plot4.R
  # Date:   7.3.2015
  # 
  # To run this script
  # Assume that the file "household_power_consumption.txt", "readAndProcess.R" 
  # and this script are in the same directory
  # > source("plot4.R")
  # > mkfourthPlot()
  
  source("readAndProcessData.R")
  
  cat("Create the plot ...")  

png(file = "plot4.png")

par(mfrow = c(2,2), mar = c(5,4,2,2), oma = c(2,1,2,1))
  with(dt.hpc,
       {
        plot(DateTime, Global_active_power, type="l",xlab ="", ylab="Global Active Power")
        plot(DateTime, Voltage, type="l",xlab ="datetime", ylab="Voltage")

        plot(DateTime, Sub_metering_1, type="l",xlab ="", ylab="Energy sub metering")
        with(subset(dt.hpc), lines(DateTime, Sub_metering_2, col ="red"))
        with(subset(dt.hpc), lines(DateTime, Sub_metering_3, col ="blue"))
    
        legend("topright", 
               lty=1,                       # line type = 1
               col=c("black","red","blue"), 
               cex=.75,                     # cex= 75% smaller than default
               bty ="n",                    # no box type
              legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
         plot(DateTime, Global_reactive_power, type="l",
              xlab ="datetime", ylab="Global Reactive Power")
         } 
       ) # end of with

cat("... and write to file \n")
# Close file
dev.off()

#clean up memmory
rm(list = ls())
cat("Done")

} # end of function  
