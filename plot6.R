download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", destfile="emissions.zip")
unzip("emissions.zip")

NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

library(dplyr)
##Filter to Baltimore
Bal<- filter(NEI, fips=="24510")
LA<- filter(NEI, fips=="06037")

##Identify Motor Vehicles
library(dplyr)
SCC<-as_tibble(SCC)
MV<-filter(SCC, SCC.Level.One =="Mobile Sources")

library(stringr)
MV2<-filter(MV, str_detect(SCC.Level.Two, "Vehicle"))

##Identify vehicle codes
codes<-unique(MV2$SCC)

##Filter data to rows for motor vehicles
BALMV<-filter(Bal, SCC%in%codes)
LAMV<-filter(LA, SCC%in%codes)

combined<-rbind(BALMV, LAMV)


##Sum by year and city
LABAL<-aggregate(Emissions~year+fips,combined, sum)

library(ggplot2)
##Create PNG file
png(file="plot6.png", width=480, height=480)
qplot(year, Emissions, data=LABAL, facets = .~fips)+geom_smooth()
dev.off()
