plot3 <- function(DF=NULL, bg="transparent", lgndbty="o") {

	if (is.null(DF)) {
		source("read_data.R")
		DF <- read_data()
	}

	par(bg=bg)

	plot(DF$DateTime, DF$Sub_metering_1, 
			type="l", 
			col="black", 
			yaxp=c(0, 30, 3),
		  	xlab="",
  			ylab="Energy sub metering",
  			main="")
	points(DF$DateTime, DF$Sub_metering_2, 
			type="l", 
			col="red")
	points(DF$DateTime, DF$Sub_metering_3, 
			type="l", 
			col="blue")

	legend("topright", col=c("black", "red", "blue"), 
			legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1),
			bty=lgndbty)

}

plot_and_print_3 <- function(DF=NULL, bg="transparent", lgndbty="o") {
	plot3(DF, bg=bg, lgndbty=lgndbty)

	dev.copy(png, filename="plot3.png", height=480, width=480)
	dev.off()
}