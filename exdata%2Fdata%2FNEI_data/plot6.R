# Load libraries
library(ggplot2)

# Read files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset Baltimore and LA data
subsetNEI <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]

aggregateTotal <- aggregate(Emissions ~ year + fips, subsetNEI, sum)
aggregateTotal$fips[aggregateTotal$fips=="24510"] <- "Baltimore, MD"
aggregateTotal$fips[aggregateTotal$fips=="06037"] <- "Los Angeles, CA"

# Plot
png('plot6.png')

ggplot(aggregateTotal, aes(factor(year), Emissions)) + facet_grid(. ~ fips) +
  geom_bar(stat="identity") +
  xlab("Year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) + 
  ggtitle('Total Emissions By Motor Vehicles from 1999 to 2008')

dev.off()
