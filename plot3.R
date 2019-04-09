download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", destfile="emissions.zip")
unzip("emissions.zip")

NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.r")

library(dplyr)
##Filter to Baltimore
Bal<- filter(NEI, fips=="24510")

##sum by year & type
Bal3<-aggregate(Emissions~year+type,Bal, sum)

library(ggplot2)


##Create PNG file
png(file="plot3.png", width=480, height=480)
qplot(year, Emissions, data=Bal3, facets=.~type)+geom_smooth()
dev.off()