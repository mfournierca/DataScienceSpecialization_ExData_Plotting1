read_data <- function() {
  #Read the data for this assignment and restrict it
  #to the appropriate date range. 
  #Assumes that the data file is present in the data/
  #directory
  
  df <- read.csv("data/household_power_consumption.txt",
                 sep=";")
  
  df$Date <- as.Date(df$Date, format="%d/%m/%Y")

  df <- subset(df, df$Date >= "2007-02-01")
  df <- subset(df, df$Date <= "2007-02-02")
  
  #I searched for a while trying to figure out how to add the weekday names
  #to the axes ticks. It turns out that if you represent the date and time
  #in POSIX format and plot, then R takes care of that for you. Which
  #is like Christmas, that's awesome. 
  df$DateTime <- as.POSIXct(paste(df$Date, df$Time), format="%Y-%m-%d %H:%M:%S")

  df
}
