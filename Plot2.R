NEI <- readRDS("summarySCC_PM25.rds")
baltimore<-subset(NEI, fips=="24510")
totemissions<-tapply(baltimore$Emissions,baltimore$year,sum)
barplot(totemissions,xlab = "Years", ylab="Total Emissions",main = "Total Emissions Baltimore City, Maryland")
