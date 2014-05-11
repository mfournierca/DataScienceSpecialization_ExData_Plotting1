plot_and_print_all <- function(DF=NULL) {
	source("read_data.R", "plot1.R", "plot2.R", "plot3.R", "plot4.R")

	DF <- read_data()

	plot_and_print_1(DF)
	plot_and_print_2(DF)
	plot_and_print_3(DF)
	plot_and_print_4(DF)
}