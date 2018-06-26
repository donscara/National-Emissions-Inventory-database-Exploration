SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")
vehicle  <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
subSCC <- SCC[vehicle, ]
mdata <- merge(baltimore, subSCC, by="SCC")
totemissions <- tapply(mdata$Emissions, mdata$year, sum)
barplot(totemissions, xlab = "Year", ylab = "Total Emissions", 
        main = "Vehicle Total Emissions in Baltimore City, Maryland")
