#Plot #1 

#Reading the electricity consumption data 
#Replacing in CSV ? to NA, reading strings(date/time) as characters
#Assuming the data is read from the current directory
datas<-read.csv("household_power_consumption.txt", sep=";",  na.strings="?",  stringsAsFactors = F)

#Filtering data for dates  2007-02-01 and 2007-02-02
dat<-datas[datas$Date == "1/2/2007" | datas$Date == "2/2/2007",]

#Open the PNG file device
png(filename = "plot1.png",
    width = 480, height = 480)

#Histogram
hist(dat$Global_active_power, col="red", xlab="Global Activity Power (kilowatts)", 
     ylab="Frequency", main="Global Active Power")

dev.off()