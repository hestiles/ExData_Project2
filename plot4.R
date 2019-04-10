download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", destfile="emissions.zip")
unzip("emissions.zip")

NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

##Filter to just coal combustion
library(dplyr)
SCC<-as_tibble(SCC)
SCC2<-filter(SCC, EI.Sector=="Fuel Comb - Comm/Institutional - Coal")



