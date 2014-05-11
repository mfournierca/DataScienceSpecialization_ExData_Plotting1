read_data <- function() {
  #Read the data for this assignment and restrict it
  #to the appropriate date range. 
  #If the data is not present in the data/ directory, 
  #download it

  if (!file.exists("data/")) {
    dir.create("data/")
  }

  data_file <- "data/household_power_consumption.txt"
  data_zip <- "data/exdata%2Fdata%2Fhousehold_power_consumption.zip"

  if (!file.exists(data_zip)) {
    print("downloading data file, this may take a while ...")
    download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                    destfile=data_zip,
                    method="curl")
  } 

  if (!file.exists(data_file)) {
      print("unzipping data file")
      unzip(data_zip, exdir="data")
  }

  print("reading data, this may take a while ...")
  df <- read.csv(data_file,
                 sep=";",
                 na.strings="?")
  
  print("reshaping data ...")
  df$Date <- as.Date(df$Date, format="%d/%m/%Y")

  df <- subset(df, df$Date >= "2007-02-01")
  df <- subset(df, df$Date <= "2007-02-02")
  
  #convert voltage to numeric from factor
  df$Voltage <- as.numeric(as.character(df$Voltage))

  #I searched for a while trying to figure out how to add the weekday names
  #to the axes ticks. It turns out that if you represent the date and time
  #in POSIX format and plot, then R takes care of that for you. Which
  #is like Christmas, that's awesome. 
  df$DateTime <- as.POSIXct(paste(df$Date, df$Time), format="%Y-%m-%d %H:%M:%S")

  #convert power to kilowatts
  #df$Global_active_power_kilowatts <- as.numeric(df$Global_active_power) / 1000.0
  #df$Global_reactive_power_kilowatts <- as.numeric(df$Global_reactive_power) / 1000.0

  print("data set ready")
  df
}
