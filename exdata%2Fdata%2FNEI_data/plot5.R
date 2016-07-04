# Load libraries
library(ggplot2)

# Read files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset Baltimore and motor data
subsetNEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]

aggregateTotal <- aggregate(Emissions ~ year, subsetNEI, sum)

# Plot
png('plot5.png')

ggplot(aggregateTotal, aes(factor(year), Emissions)) + geom_bar(stat="identity") +
  xlab("Year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) + 
  ggtitle('Total Emissions By Motor Vehicles in Baltimore from 1999 to 2008')

dev.off()
