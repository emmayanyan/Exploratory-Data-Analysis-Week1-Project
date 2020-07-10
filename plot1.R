## give the original file a name "zipfile" & unzip the file
zipfile<- "exdata_data_household_power_consumption.zip"
unzip(zipfile, files = NULL, list = FALSE, overwrite = TRUE,
      junkpaths = FALSE, exdir = ".", unzip = "internal",
      setTimes = FALSE)


## read the file into a variable named file
file <- read.csv("./household_power_consumption.txt", header=TRUE, sep=";", 
                 stringsAsFactors=FALSE, na.strings = "?", dec=".")


#####################################################################

## in order to select the data by date, set the date in date format
file$Date <-as.Date(file$Date, format = "%d/%m/%Y")

## select out the data used to the graphic
fileselected <- subset(file, file$Date >= "2007-02-01" & file$Date <= "2007-02-02")

## plot plot1.png
png("plot1.png",height=480,width=480)
hist(fileselected$Global_active_power,main="Global Active Power",xlab="Global Acive Power (kilowatts)",ylab="Frequency",col="red",breaks=12)
dev.off()




