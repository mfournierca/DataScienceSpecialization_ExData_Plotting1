read_data <- function() {
  #Read and reshape the data for this assignment. Download it 
  #if necessary. 

  #If the data directory does not exist, create it
  if (!file.exists("data/")) {
    dir.create("data/")
  }

  #The data file and source zip. 
  data_file <- "data/household_power_consumption.txt"
  data_zip <- "data/exdata%2Fdata%2Fhousehold_power_consumption.zip"

  #If the zip does not exist, download it. 
  if (!file.exists(data_zip)) {
    print("downloading data file, this may take a while ...")
    download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                    destfile=data_zip,
                    method="curl")
  } 

  #If the data file does not exist, unzip the downloaded zip file. 
  if (!file.exists(data_file)) {
      print("unzipping data file")
      unzip(data_zip, exdir="data")
  }

  #Read the data
  print("reading data, this may take a while ...")
  df <- read.csv(data_file,
                 sep=";",
                 na.strings="?")
  
  #Start reshaping the data. 
  print("reshaping data ...")

  #coerce the date column into a Date type 
  df$Date <- as.Date(df$Date, format="%d/%m/%Y")

  #Throw away everything outside of the date range for this 
  #assignment. 
  df <- subset(df, df$Date >= "2007-02-01")
  df <- subset(df, df$Date <= "2007-02-02")
  
  #The voltage variable is parsed as a factor, convert 
  #convert it to numeric. 
  df$Voltage <- as.numeric(as.character(df$Voltage))

  #Create a datetime column. This is used to plot over several
  #days in time. This will also cause R to automatically
  #adds the day names (Thur, Fri, Sat) to the X axis ticks, which
  #is very convenient. 
  df$DateTime <- as.POSIXct(paste(df$Date, df$Time), format="%Y-%m-%d %H:%M:%S")

  #done.
  print("data set ready")
  df
}
