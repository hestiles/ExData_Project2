download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", destfile="emissions.zip")
unzip("emissions.zip")

NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.r")

plot(NEI$year, NEI$Emissions)
##Data by year
library(dplyr)
NEIbyYear<-NEI %>%
        group_by(year, sum(Emissions))

with(NEIbyYear, plot(year, sum(Emissions)))
     