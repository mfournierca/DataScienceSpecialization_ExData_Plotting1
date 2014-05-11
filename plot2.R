plot2 <- function(DF=NULL) {

	if (is.null(DF)) {
		source("read_data.R")
		DF <- read_data()
	}

	DF$Global_active_power_kilowatts <- as.numeric(DF$Global_active_power) / 1000.0
  	plot(DF$DateTime, DF$Global_active_power_kilowatts, type="l",
  			xlab="",
  			ylab="Global Active Power (kilowatts)",
  			main="")

	dev.copy(png, "plot2.png")
	dev.off()
}