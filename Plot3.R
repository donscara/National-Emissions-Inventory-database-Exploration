NEI <- readRDS("summarySCC_PM25.rds")
baltimore<-subset(NEI, fips=="24510")

data3 <- aggregate(Emissions ~ year + type, baltimore, sum)

g <- ggplot(data3, aes(year, Emissions, color = type))
g + geom_line() +
  xlab("Year") +
  ylab(expression("Total Emissions")) +
  ggtitle("Total Emissions per type in Baltimore City, Maryland")
