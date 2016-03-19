
##########################################################################################
#Exploratory Data Analysis Course Project 1

#This assignment uses data from the UC Irvine Machine Learning Repository, 
#a popular repository for machine learning datasets. 
#In particular, we will be using the ¡§Individual household electric power consumption Data Set¡¨. 

#Description: Measurements of electric power consumption in one household 
#with a one-minute sampling rate over a period of almost 4 years. 
#Different electrical quantities and some sub-metering values are available.
##########################################################################################

#####################
#Download the file
#####################

setwd("C:\\Users\\ASUS\\Desktop\\Data Science\\Exploratory Data Analysis\\Course Project 1")
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="C:\\Users\\ASUS\\Desktop\\Data Science\\Exploratory Data Analysis\\Course Project 1\\household_power_consumption.zip")
unzip(zipfile="C:\\Users\\ASUS\\Desktop\\Data Science\\Exploratory Data Analysis\\Course Project 1\\household_power_consumption.zip")

####################################################################
#loading and extracting the 2007-02-01 ~ 2007-02-02 dataset into R
####################################################################

data<-read.table("household_power_consumption.txt",header = TRUE, sep= ";")
names(data)
data$DateTime<-paste(data$Date, data$Time)
data$DateTime<-strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")
start<-which(data$DateTime==strptime("2007-02-01", "%Y-%m-%d"))
end<-which(data$DateTime==strptime("2007-02-02 23:59:00", "%Y-%m-%d %H:%M:%S"))
plotdata<-data[start:end,]

####################
#Construct the plot3
####################

lapply(plotdata, class)

png(filename='plot3.png',width=480,height=480,units='px')

plot(plotdata$DateTime, as.numeric(as.character(plotdata$Sub_metering_1)),type='l', 
     ylab ="Energy sub metering", xlab="",axes = F,frame.plot=TRUE)

axis(1, at=c(as.numeric(min(plotdata$DateTime)), as.numeric(min(plotdata$DateTime))+86400
             , as.numeric(min(plotdata$DateTime))+2*86400), labels=c("Thu", "Fri", "Sat"))

axis(2, yaxs = "r")

lines(plotdata$DateTime, as.numeric(as.character(plotdata$Sub_metering_2)),type='l', col='red')
lines(plotdata$DateTime, plotdata$Sub_metering_3,type='l', col="blue")
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1)
       ,col=c("black","red","blue"))

x<-dev.off()

