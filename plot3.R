#Plot #3

#Reading the electricity consumption data 
#Replacing in CSV ? to NA, reading strings(date/time) as characters
#Assuming the data is read from the current directory
datas<-read.csv("household_power_consumption.txt", sep=";",  na.strings="?",  stringsAsFactors = F)

#Filtering data for dates  2007-02-01 and 2007-02-02
dat<-datas[datas$Date == "1/2/2007" | datas$Date == "2/2/2007",]

#Open the PNG file device
png(filename = "plot3.png",
    width = 480, height = 480)

#Weekday plots
#Convertion of  date/time as character to POSIXlt time class
dat$timestamp<-with(dat,strptime(paste(Date, Time), format="%d/%m/%Y %H:%M:%S") )
# dat$weekday<-factor(strftime(dat$timestamp, "%a"))

#Plotting with weekdays sub metering
plot(x=dat$timestamp, y=dat[,7], type="l", ylab="Energy sub metering", xlab="")
lines(x=dat$timestamp, y=dat[,8], type="l", col="red")
lines(x=dat$timestamp, y=dat[,9], type="l", col="blue")
legend("topright", legend=names(dat[7:9]), col=1:3, lty=1)

dev.off()