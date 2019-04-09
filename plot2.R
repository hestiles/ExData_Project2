download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", destfile="emissions.zip")
unzip("emissions.zip")

NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.r")


library(dplyr)
##Filter to Baltimore
Bal<- filter(NEI, fips=="24510")

##sum by year
Bal2<-aggregate(Bal['Emissions'], by=Bal['year'], sum)

##Create PNG file
png(file="plot2.png", width=480, height=480)
with(Bal2, plot(year, Emissions))
dev.off()