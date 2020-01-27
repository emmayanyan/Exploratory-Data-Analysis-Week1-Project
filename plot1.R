setwd("C:/Users/Emma/Desktop/R/Course4/Week1/Projectredoredoredoredo")
## set a work folder & manually put the zipfile into this folder

zipfile<- "exdata_data_household_power_consumption.zip"
unzip(zipfile, files = NULL, list = FALSE, overwrite = TRUE,
      junkpaths = FALSE, exdir = ".", unzip = "internal",
      setTimes = FALSE)
## give the original file a name "zipfile" & unzip the file


file <- read.csv("./household_power_consumption.txt", header=TRUE, sep=";", 
                 stringsAsFactors=FALSE, na.strings = "?", dec=".")
## read the file into a variable named file

#####################################################################


file$Date <-as.Date(file$Date, format = "%d/%m/%Y")
## in order to select the data by date, set the date in date format

fileselected <- subset(file, file$Date >= "2007-02-01" & file$Date <= "2007-02-02")
## select out the data used to the graphic

png("plot1.png",height=480,width=480)
hist(fileselected$Global_active_power,main="Global Active Power",xlab="Global Acive Power (kilowatts)",ylab="Frequency",col="red",breaks=12)
dev.off()
## plot plot1.png



