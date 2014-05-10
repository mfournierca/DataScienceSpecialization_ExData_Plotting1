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
  
  df
}
