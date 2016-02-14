#Reading the electricity consumption data 
#Replacing in CSV ? to NA, reading strings(date/time) as characters

#setwd("")
#Assuming the data is read from the current directory
datas<-read.csv("household_power_consumption.txt", sep=";",  na.strings="?",  stringsAsFactors = F)

#Filtering data for dates  2007-02-01 and 2007-02-02
dat<-datas[datas$Date == "1/2/2007" | datas$Date == "2/2/2007",]

#Histogram
hist(dat$Global_active_power, col="red", xlab="Global Activity Power (kilowatts)", 
     ylab="Frequency", main="Global Active Power")

#Weekday plots
#Convertion of  date/time as character to POSIXlt time class
dat$timestamp<-with(dat,strptime(paste(Date, Time), format="%d/%m/%Y %H:%M:%S") )
dat$weekday<-factor(strftime(dat$timestamp, "%a"))

#Plotting with weekdays
plot(dat$timestamp, dat$Global_active_power, type="l")
par(mfrow=c(1,1))
plot(x=dat$timestamp, y=dat[,7], type="l")
lines(x=dat$timestamp, y=dat[,8], type="l", col="red")
lines(x=dat$timestamp, y=dat[,9], type="l", col="blue")
