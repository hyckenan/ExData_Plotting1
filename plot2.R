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
png("plot2.png",width=480,height=480)##Open graphic device
datetime<- strptime(paste(dat$Date,dat$Time),"%d/%m/%Y %H:%M:%S")##Get datetime from data
ylab<-"Global Active Power (kilowatts)"##Set y-axis label
plot(datetime,dat$Global_active_power,type="l",ylab=ylab,xlab=NA)
dev.off()##Close graphic dvice