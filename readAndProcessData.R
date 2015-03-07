# 
# Coursera Exploratory Data Analysis
# File:   readAndProcessData.R
# Date:   6.3.2015
# 
# This script will 
#   - install the necessary packages 
#   - read data into R
#   - and processing data 
# 
  
cat("Install dplyr and lubridate package if needed \n")
if (!"dplyr" %in% installed.packages()) install.packages("dplyr") 
require(dplyr)

if (!"lubridate" %in% installed.packages()) install.packages("lubridate") 
require(lubridate)

# Read only the first 5 rows of the data set
tab5rows <- read.table("./household_power_consumption.txt", header=T, sep=";", nrows = 5)

# Determine the "classes" of the columns of the data set
classes <- sapply(tab5rows, class)

cat("Read data into R! Please wait ...\n") 

# Specify the values of "colClasses" and "nrows" in order to read data faster
big.hpc <- read.table("./household_power_consumption.txt", header=T, sep=";", nrows = 2075261, 
                      colClasses = classes, na.strings="?" )

cat("Get only data on the dates 2007-02-01 OR 2007-02-02 \n") 
hpc <- filter(big.hpc,Date == "1/2/2007" | Date == "2/2/2007")

# Remove the big data set to clean up memory
rm(big.hpc)

cat("Processing data ...\n")

# Convert the Date and Time variables to Date/Time classes in R
hpc$Date <- dmy(hpc$Date)
hpc$Time <- hms(hpc$Time)

# Create a new data set with a new column DateTime 
temp <- mutate(hpc, DateTime = Date + Time)
dt.hpc <- select(temp,DateTime, Global_active_power:Sub_metering_3)

