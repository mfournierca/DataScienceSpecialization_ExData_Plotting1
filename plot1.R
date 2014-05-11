plot1 <- function(DF=NULL, bg="transparent") {

  if (is.null(DF)) {
    source("read_data.R")
    DF <- read_data()
  }
  
  par(bg=bg)

  hist(as.numeric(DF$Global_active_power), 
        col="red", 
  			xlab="Global Active Power (kilowatts)",
  			main="Global Active Power")
}

plot_and_print_1 <- function(DF=NULL, bg="transparent") {

	plot1(DF, bg=bg)

	dev.copy(png, filename="plot1.png", height=480, width=480)
	dev.off()

}