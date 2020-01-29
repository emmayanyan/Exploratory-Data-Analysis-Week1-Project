setwd("C:/Users/Emma/Desktop/R/Course4/Week1/Projectredo3")
## set a work folder & manually put the zipfile into this folder

zipfile<- "exdata_data_household_power_consumption.zip"
unzip(zipfile, files = NULL, list = FALSE, overwrite = TRUE,
      junkpaths = FALSE, exdir = ".", unzip = "internal",
      setTimes = FALSE)
## give the original file a name "zipfile" & unzip the file


file <- read.csv("./household_power_consumption.txt", header=TRUE, sep=";", 
                 stringsAsFactors=FALSE, na.strings = "?", dec=".")
## read the file into a variable named file

file$Date <- as.Date(file$Date, format = "%d/%m/%Y")
fileselected <- subset(file, file$Date >= "2007-02-01" & file$Date <= "2007-02-02")
## select out the data used to the graphic

#####################################################################
fileselected$DT <- as.POSIXct(paste(fileselected$Date, fileselected$Time, seperator = " "))
## Combine the date and time in order to get the correct data by time.

png("plot3.png",height=480,width=480)
plot(fileselected$Sub_metering_1~fileselected$DT, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
## plot plot3.png


lines(fileselected$DT,fileselected$Sub_metering_2,col="red")
lines(fileselected$DT,fileselected$Sub_metering_3,col="blue")
## Add Sub_metering_2 & 3 lines.

legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=1,col=c("black","red","blue"))
## Add the legend on the topright of the graphic.

dev.off()




