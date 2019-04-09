download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", destfile="emissions.zip")
unzip("emissions.zip")

NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.r")

##Filter to just coal combustion
SCC2<-filter(SCC, )
library(dplyr)
coal<-filter(NEI, )