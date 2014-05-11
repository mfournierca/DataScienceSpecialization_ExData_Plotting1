plot3 <- function(DF=NULL) {

	if (is.null(DF)) {
		source("read_data.R")
		DF <- read_data()
	}

	#I searched for a while trying to figure out how to add the weekday names
	#to the axes ticks. It turns out that if you represent the date and time
	#in POSIX format and plot, then R takes care of that for you. Which
	#is like Christmas, that's awesome. 
	DF$DateTime <- as.POSIXct(paste(DF$Date, DF$Time), format="%Y-%m-%d %H:%M:%S")
	
	plot(DF$DateTime, DF$Sub_metering_1, type="l", col="black", yaxp=c(0, 30, 3),
		  	xlab="",
  			ylab="Energy sub metering",
  			main="")
	points(DF$DateTime, DF$Sub_metering_2, type="l", col="red")
	points(DF$DateTime, DF$Sub_metering_3, type="l", col="blue")

	legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1))
	
	dev.copy(png, "plot3.png")
	dev.off()
}