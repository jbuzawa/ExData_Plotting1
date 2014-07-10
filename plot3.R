##save file url for the data source
fileurl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
##if the file has not already been downloaded, load zip file and unzip
if(!file.exists("data1.zip")){
  download.file(fileurl,destfile="data1.zip", method="internal", mode="wb")
  unzip("data1.zip")}
##read the data
data1<-read.table("household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE,na.strings="N/A")
##change date column to date format
data1$Date<-as.Date(data1$Date,format="%d/%m/%Y")
##subset the approrpiate dates
data2<-data1[(data1$Date=="2007-02-01"|data1$Date=="2007-02-02"),]
##add data column for date and time
date.time<-paste(data2$Date, data2$Time)
date.time<-strptime(date.time, format="%Y-%m-%d %H:%M:%S")
data3<-cbind(data2,date.time)
##save the png plot
library(datasets)
png(file="plot3.png")
with(data3, {plot(date.time, Sub_metering_1, type="n", xlab="",ylab="Energy sub metering")
  points(date.time, Sub_metering_2, type="l", col="red",xlab="",ylab="Energy sub metering")
  points(date.time, Sub_metering_1, type="l", xlab="",ylab="Energy sub metering")
  points(date.time, Sub_metering_3, type="l", col="blue", xlab="",ylab="Energy sub metering")})
  legend("topright", lty= c(1,1,1),col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()