plot3 <- function(DF=NULL, bg="transparent", lgndbty="o") {
	#Plot the third graphic. Read the data file if necessary. 
	#Set the plot background to the specified value. 
	#Set the border of the graph legend as specified. 
	  
	#Read the data file if necessary.
	if (is.null(DF)) {
		source("read_data.R")
		DF <- read_data()
	}

	#Set the background color to the specified value. 
	par(bg=bg)

	#Create the plot. Starts with sub_metering_1
	plot(DF$DateTime, DF$Sub_metering_1, 
			type="l", 
			col="black", 
			yaxp=c(0, 30, 3),
		  	xlab="",
  			ylab="Energy sub metering",
  			main="")

	#Add points for Sub_metering_2
	points(DF$DateTime, DF$Sub_metering_2, 
			type="l", 
			col="red")

	#Add points for Sub_metering_3
	points(DF$DateTime, DF$Sub_metering_3, 
			type="l", 
			col="blue")

	#Add the legend in the top right. Set the legend border to the specified 
	#value using the lty option
	legend("topright", col=c("black", "red", "blue"), 
			legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1),
			bty=lgndbty)

}

plot_and_print_3 <- function(DF=NULL, bg="transparent", lgndbty="o") {
	#create the first graphic
	plot3(DF, bg=bg, lgndbty=lgndbty)

	#print the graphic to disk. 
	dev.copy(png, filename="plot3.png", height=480, width=480)
	dev.off()
}