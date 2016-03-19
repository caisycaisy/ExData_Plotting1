
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
#Construct the plot1
####################

lapply(plotdata, class)

png(filename='plot1.png',width=480,height=480,units='px')
    hist(as.numeric(as.character(plotdata$Global_active_power)), 
         main="Global Active Power",
         xlab="Global Active Power (kilowatts)", col="red" ,ylim = c(0, 1200))
x<-dev.off()

