##Download File
URL="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipF="temp.zip"
download.file(URL,zipF)
##Unzip File
unzip(zipF)
##Read File
fn="household_power_consumption.txt"
begin<-grep("1/2/2007",readLines(fn)) ##Determine the start position
begin<-begin[1]-2
end<-grep("^2/2/2007",readLines(fn))  ##Determine the end position
end<-end[length(end)]-1
dat<-read.csv(fn,sep=";",na.strings = "?",skip=begin,nrow=end-begin) ##Read subset of data
head<-read.csv(fn,sep=";",nrow=1)  ##Read colnames
colnames(dat)<-colnames(head)
png("plot1.png",width=480,height=480)##Open graphic device
xlab<-"Global Active Power (kilowatts)"##Set x-axis label
main<-"Global Active Power" ##Set title
hist(dat$Global_active_power,col="red",xlab=xlab,main=main)
dev.off()##Close graphic dvice