plot2 <- function(DF=NULL) {

	if (is.null(DF)) {
		source("read_data.R")
		DF <- read_data()
	}

	#I searched for a while trying to figure out how to add the weekday names
	#to the axes ticks. It turns out that if you represent the date and time
	#in POSIX format and plot, then R takes care of that for you. Which
	#is like Christmas, that's awesome. 
	DF$DateTime <- as.POSIXct(paste(DF$Date, DF$Time), format="%Y-%m-%d %H:%M:%S")
	DF$Global_active_power_kilowatts <- as.numeric(DF$Global_active_power) / 1000.0
  	plot(DF$DateTime, DF$Global_active_power_kilowatts, type="l",
  			xlab="",
  			ylab="Global Active Power (kilowatts)",
  			main="")

	dev.copy(png, "plot2.png")
	dev.off()
}