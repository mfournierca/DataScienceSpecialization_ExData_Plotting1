plot2 <- function(DF=NULL, bg="transparent", ylab="Global Active Power (kilowatts)") {

	#Plot the second graphic. Read the data file if necessary. 
	#Set the plot background to the specified value. 
	#Set y axis label to the specified value.
  
  	#Read the data file if necessary
	if (is.null(DF)) {
		source("read_data.R")
		DF <- read_data()
	}

	#Set the background color to the specified value. 
	par(bg=bg)

	#Plot the graphic
  	plot(DF$DateTime, DF$Global_active_power, 
  			type="l",
  			xlab="",
  			ylab=ylab,
  			main="")

}

plot_and_print_2 <- function(DF=NULL, bg="transparent", ylab="Global Active Power (kilowatts)") {

	#Plot the second graphic
	plot2(DF, bg=bg, ylab=ylab)

	#Print the graphic to disk. 
	dev.copy(png, filename="plot2.png", height=480, width=480)
	dev.off()
}