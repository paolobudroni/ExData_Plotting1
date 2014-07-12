plot3 <- function() { 

	# step 1--Reading data
 	hpcdata <- read.csv("./data/household_power_consumption.txt",TRUE,sep=";",na.strings="?",as.is = c(2) )

	# step 2 - Subsetting 01-02/02/2007 dates
	hpcdatafilt <- hpcdata[hpcdata$Date %in% c("1/2/2007","2/2/2007"),] 

	# adding datetime column

	hpcdatafilt$datetime <- strptime( paste(hpcdatafilt$Date,hpcdatafilt$Time), format="%d/%m/%Y %H:%M:%S")

	#step 3 -- Construct plot3
	# initialize the plotting area
	
	# check device 
	if (dev.cur() == 1) dev.new()	

	#step 3 -- Construct plot3
	par(oma=c(1,1,1,1),bg="white")

	with(hpcdatafilt, { 
		plot(datetime,Sub_metering_1, type="l" ,xlab="", ylab="Energy sub metering", col="black")
 		lines(datetime, Sub_metering_2, col = "red")
		lines(datetime, Sub_metering_3, col = "blue")
		legend("topright", lty=1, col = c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
		}
	)

	#copy it to PNG file 
	dev.copy(png, file = "./plot3.png",width=480,height=480,pointsize=8)

	#close the png device
	dev.off()

	#close the window device
	dev.off()

}