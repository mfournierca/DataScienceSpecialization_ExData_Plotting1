plot1 <- function(DF=NULL) {

  if (is.null(DF)) {
    source("read_data.R")
    DF <- read_data()
  }
  
  hist(as.numeric(DF$Global_active_power), col="red", bg="white", 
  			xlab="Global Active Power (kilowatts)",
  			main="Global Active Power")
  dev.copy(png, "plot1.png")
  dev.off()
}