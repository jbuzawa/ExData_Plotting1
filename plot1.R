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
##save the png histogram
library(datasets)
png(file="plot1.png")
hist(as.numeric(data2$Global_active_power), breaks=15, col="red1", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
