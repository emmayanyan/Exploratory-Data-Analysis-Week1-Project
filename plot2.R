## set a work folder & manually put the zipfile into this folder
setwd("C:/Users/Emma/Desktop/R/Course4/Week1/Projectredo2")

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

## plot plot2.png
png("plot2.png",height=480,width=480)
plot(fileselected$Global_active_power~fileselected$DT, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()




