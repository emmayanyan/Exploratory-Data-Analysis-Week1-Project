setwd("C:/Users/Emma/Desktop/R/Course4/Week1/Projectcombined2")
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

png("lefttop.png",height=240,width=240)
plot(fileselected$Global_active_power~fileselected$DT, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
## generate lefttop image

png("leftbottom.png",height=240,width=240)
plot(fileselected$Sub_metering_1~fileselected$DT, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
lines(fileselected$DT,fileselected$Sub_metering_2,col="red")
lines(fileselected$DT,fileselected$Sub_metering_3,col="blue")
op <- par(cex = 0.75)
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=1,col=c("black","red","blue"),bty = "n")
dev.off()
## generate leftbottom image


png("righttop.png",height=240,width=240)
plot(fileselected$Voltage~fileselected$DT,xlab="datetime",ylab="Voltage",type="l")
dev.off()
## generate righttop image

png("rightbottom.png",height=240,width=240)
plot(fileselected$Global_reactive_power~fileselected$DT,xlab="datetime",ylab="Global_reactive_power",type="l")
dev.off()
## generate rightbottom image


library(png)
library(grid)
library(gridExtra)
img1 <-  rasterGrob(as.raster(readPNG("lefttop.png")), interpolate = FALSE)
img2 <-  rasterGrob(as.raster(readPNG("righttop.png")), interpolate = FALSE)
img3 <-  rasterGrob(as.raster(readPNG("leftbottom.png")), interpolate = FALSE)
img4 <-  rasterGrob(as.raster(readPNG("rightbottom.png")), interpolate = FALSE)
##readt 4 images in img1,2,3&4

g<- arrangeGrob(img1, img2, img3,img4,nrow=2, ncol = 2)
ggsave(file="plot4.png",g)
## combined 4 files is 2x2 layout in file g; and save g in plot4.png file

