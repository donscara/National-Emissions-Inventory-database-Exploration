SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")
coal  <- grepl("coal", SCC$Short.Name, ignore.case=TRUE)
subSCC <- SCC[coal, ]
mdata <- merge(NEI, subSCC, by="SCC")
totemissions <- tapply(mdata$Emissions, mdata$year, sum)
barplot(totemissions, xlab = "Year", ylab = "Total Emissions", 
        main = "Coal Total Emissions USA")
