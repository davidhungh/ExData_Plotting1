mksecondPlot <- function() { 
  # 
  # Coursera Exploratory Data Analysis
  # File:   Plot2.R
  # Date:   7.3.2015
  # 
  # To run this script
  # Assume that the file "household_power_consumption.txt", "readAndProcessData.R" 
  # and this script are in the same directory
  # > source("plot2.R")
  # > mksecondPlot()
  
source("readAndProcessData.R")
  
cat("Create the plot ...")  
plot(dt.hpc$DateTime, dt.hpc$Global_active_power,
     type="l", # lines
     xlab ="", ylab="Global Active Power (kilowatts)")

cat("... and write to file \n")
dev.copy(png, file = "plot2.png")    
dev.off()

#clean up memmory
rm(list = ls())
cat("Done")

} # end of function