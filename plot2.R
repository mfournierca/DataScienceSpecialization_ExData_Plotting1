plot2 <- function(DF=NULL, bg="transparent", ylab="Global Active Power (kilowatts)") {

	if (is.null(DF)) {
		source("read_data.R")
		DF <- read_data()
	}

	par(bg=bg)

  	plot(DF$DateTime, DF$Global_active_power, 
  			type="l",
  			xlab="",
  			ylab=ylab,
  			main="")

}

plot_and_print_2 <- function(DF=NULL, bg="transparent", ylab="Global Active Power (kilowatts)") {
	plot2(DF, bg=bg, ylab=ylab)

	dev.copy(png, filename="plot2.png", height=480, width=480)
	dev.off()
}