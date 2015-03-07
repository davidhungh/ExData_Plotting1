mkfirstPlot <- function() { 
# 
# Coursera Exploratory Data Analysis
# File:   Plot1.R
# Date:   6.3.2015
# 
# To run this script
# Assume that the file "household_power_consumption.txt", "readAndProcess.R" 
# and this script are in the same directory
# > source("plot1.R")
# > mkfirstPlot()
  
source("readAndProcessData.R")

cat("Create the plot ...")  
hist(dt.hpc$Global_active_power, 
     main ="Global Active Power", 
     col ="red", 
     xlab = "Global Active Power (kilowatts)")

cat("... and write to file \n")
dev.copy(png, file = "plot1.png")    
dev.off()

# Clean up 
rm(list = ls())
cat("Done")

} # end of function  