SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")
LA<- subset(NEI, fips == "06037")
vehicle  <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
subSCC <- SCC[vehicle, ]
dataBA <- merge(baltimore, subSCC, by="SCC")
dataBA$city <- "Baltimore City"
dataLA <- merge(LA, subSCC, by="SCC")
dataLA$city <- "Los Angeles County"
data6 <- rbind(dataBA, dataLA)
data <- aggregate(Emissions ~ year + city, data6, sum)
g <- ggplot(data, aes(year, Emissions, color = city))
g + geom_line() +
  xlab("Year") +
  ylab(expression("Total Emissions")) +
  ggtitle("Vehicle Total Emissionsin Baltimore and Los Angeles")
