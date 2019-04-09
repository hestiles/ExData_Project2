download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", destfile="emissions.zip")
unzip("emissions.zip")

NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.r")


##Data by year
NEI2<-aggregate(NEI['Emissions'], by=NEI['year'], sum)


##Create PNG file
png(file="plot1.png", width=480, height=480)
with(NEI2, plot(year, Emissions))
dev.off()