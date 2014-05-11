plot1 <- function(DF=NULL, bg="transparent") {

  #Plot the first graphic. Read the data file if necessary. 
  #Set the plot background to the specified value. 

  #Read the data if necessary
  if (is.null(DF)) {
    source("read_data.R")
    DF <- read_data()
  }
  
  #Set the background color to the specified value. 
  par(bg=bg)

  #Plot the histogram
  hist(as.numeric(DF$Global_active_power), 
        col="red", 
  			xlab="Global Active Power (kilowatts)",
  			main="Global Active Power")
}

plot_and_print_1 <- function(DF=NULL, bg="transparent") {

  #Plot the first graphic
	plot1(DF, bg=bg)

  #print it to disk. 
	dev.copy(png, filename="plot1.png", height=480, width=480)
	dev.off()
}