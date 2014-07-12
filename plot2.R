plot2 <- function() { 

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

	
	# step 3 -- Construct plot2
	par(oma=c(1,1,1,1),bg="white")
	with(hpcdatafilt, plot(datetime,Global_active_power, type="l" ,xlab="", ylab="Global Active Power (kilowatts)"))

	#copy it to PNG file 
	dev.copy(png, file = "./plot2.png",width=480,height=480,pointsize=8)

	#close the png device
	dev.off()

	#close the window device
	dev.off()

}