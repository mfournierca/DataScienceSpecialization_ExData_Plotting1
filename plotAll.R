plot_and_print_all <- function(DF=NULL, bg="transparent") {
	source("plot1.R")
	source("plot2.R")
	source("plot3.R")
	source("plot4.R")

	if (is.null(DF)) {
		source("read_data.R")
		DF <- read_data()
	}
	
	#make sure all graphics devices are off
	graphics.off()

	plot_and_print_1(DF, bg=bg)
	plot_and_print_2(DF, bg=bg)
	plot_and_print_3(DF, bg=bg)
	plot_and_print_4(DF, bg=bg)
}