library(data.table)
myData <- as.data.table(readRDS("summarySCC_PM25.rds"))
png("figure/plot2.png")
plot(myData[fips=="24510",list(TotalEmissions=sum(Emissions)), by = year], type = "o")
dev.off()