plot4 <- function(DF=NULL) {

	source("plot1.R")
	source("plot2.R")
	source("plot3.R")
	
	if (is.null(DF)) {
		source("read_data.R")
		DF <- read_data()
	}

	par(mfrow=c(2,2))

	plot2(DF)
	plot_voltage(DF)
	plot3(DF)
	plot_global_reactive_power(DF)
}

plot_and_print_4 <- function(DF=NULL) {
	plot4(DF)

	dev.copy(png, "plot4.png")
	dev.off()
}

plot_voltage <- function(DF) {
	plot(DF$DateTime, DF$Voltage, type="l",
		xlab="datetime",
		ylab="Voltage",
		main="")
}


plot_global_reactive_power <- function(DF) {
	plot(DF$DateTime, DF$Global_reactive_power, type="l",
		xlab="datetime",
		ylab="Global_reactive_power",
		main="")
}