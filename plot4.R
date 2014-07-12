plot4 <- function() { 

	# step 1--Reading data
 	hpcdata <- read.csv("./data/household_power_consumption.txt",TRUE,sep=";",na.strings="?",as.is = c(2) )

	# step 2 - Subsetting 01-02/02/2007 dates
	hpcdatafilt <- hpcdata[hpcdata$Date %in% c("1/2/2007","2/2/2007"),] 

	# adding datetime column

	hpcdatafilt$datetime <- strptime( paste(hpcdatafilt$Date,hpcdatafilt$Time), format="%d/%m/%Y %H:%M:%S")

	#step 3 -- Construct plot4
	# initialize the plotting area
	
	# check device 
	if (dev.cur() == 1) dev.new()	

	par(mfrow=c(2,2),oma=c(1,1,1,1),bg="white")

	with(hpcdatafilt, {
		plot(datetime,Global_active_power, type="l" ,xlab="", ylab="Global Active Power")

		plot(datetime,Voltage, type="l" , xlab="datetime", ylab="")

		plot(datetime,Sub_metering_1, type="l" ,xlab="", ylab="Energy sub metering", col="blue")
		lines(datetime, Sub_metering_2, col = "dark grey")
		lines(datetime, Sub_metering_3, col = "red")
		legend("topright", bty = "n", pch="-", col = c("blue","dark grey","red"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

		plot(datetime,Global_reactive_power, type="l" ,xlab="datetime")

		}
	)

	#copy it to PNG file 
	dev.copy(png, file = "./plot4.png",width=480,height=480,pointsize=8)

	#close the png device
	dev.off()

	#restore the mrow parameter
	par(mfrow = c(1,1))
	
	#close the window device
	dev.off()

}