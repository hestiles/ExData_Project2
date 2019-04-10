download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", destfile="emissions.zip")
unzip("emissions.zip")

NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

##Identify coal combustion
library(dplyr)
SCC<-as_tibble(SCC)
SCC2<-filter(SCC, EI.Sector=="Fuel Comb - Comm/Institutional - Coal")

##Identify coal combustion codes
codes<-unique(SCC2$SCC)

##Filter data to rows with coal Combusion code
NEIcoal<-filter(NEI, SCC==codes)

##Sum by year
aggregate(Emissions~year+type,Bal, sum)


