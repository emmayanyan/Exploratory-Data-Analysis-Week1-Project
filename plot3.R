## give the original file a name "zipfile" & unzip the file
zipfile<- "exdata_data_household_power_consumption.zip"
unzip(zipfile, files = NULL, list = FALSE, overwrite = TRUE,
      junkpaths = FALSE, exdir = ".", unzip = "internal",
      setTimes = FALSE)

## read the file into a variable named file
file <- read.csv("./household_power_consumption.txt", header=TRUE, sep=";", 
                 stringsAsFactors=FALSE, na.strings = "?", dec=".")

## select out the data used to the graphic
file$Date <- as.Date(file$Date, format = "%d/%m/%Y")
fileselected <- subset(file, file$Date >= "2007-02-01" & file$Date <= "2007-02-02")

#####################################################################
## Combine the date and time in order to get the correct data by time.
fileselected$DT <- as.POSIXct(paste(fileselected$Date, fileselected$Time, seperator = " "))

## plot plot3.png
png("plot3.png",height=480,width=480)
plot(fileselected$Sub_metering_1~fileselected$DT, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")


## Add Sub_metering_2 & 3 lines.
lines(fileselected$DT,fileselected$Sub_metering_2,col="red")
lines(fileselected$DT,fileselected$Sub_metering_3,col="blue")

## Add the legend on the topright of the graphic.
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=1,col=c("black","red","blue"))

dev.off()




