plot2 <- function(DF=NULL, bg="transparent") {

	if (is.null(DF)) {
		source("read_data.R")
		DF <- read_data()
	}

	par(bg=bg)

	DF$Global_active_power_kilowatts <- as.numeric(DF$Global_active_power) / 1000.0
  	plot(DF$DateTime, DF$Global_active_power_kilowatts, 
  			type="l",
  			xlab="",
  			ylab="Global Active Power (kilowatts)",
  			main="")

}

plot_and_print_2 <- function(DF=NULL, bg="transparent") {
	plot2(DF, bg=bg)

	dev.copy(png, filename="plot2.png", height=480, width=480)
	dev.off()
}