library(data.table)
library(ggplot2)
myData <- as.data.table(readRDS("summarySCC_PM25.rds"))
myLookup <- as.data.table(readRDS("Source_Classification_Code.rds"))
setkeyv(myData,"SCC")
setkeyv(myLookup,"SCC")
myTemp <- merge(myLookup[,c("SCC","EI.Sector"),with=FALSE],myData, by="SCC")
plotData <- myTemp[EI.Sector %like% "Vehicle" & (fips=="24510" | fips=="06037"),
                   list(Emissions=sum(Emissions)),by=c("year","fips")]
png("figure/plot6.png")
qplot(year, Emissions, data=plotData, colour=fips, geom="line")
dev.off()