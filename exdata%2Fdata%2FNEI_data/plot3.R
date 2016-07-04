# Load libraries
library(ggplot2)

# Read files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset Baltimore data
subsetNEI  <- NEI[NEI$fips=="24510", ]

# Aggregate data by year
aggregateTotal <- aggregate(Emissions ~ year + type, subsetNEI, sum)

# Plot
png('plot3.png')

ggplot(aggregateTotal, aes(year, Emissions, color = type)) + geom_line() +
  xlab("Year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) + 
  ggtitle('Total Emissions in Baltimore City, Maryland from 1999 to 2008')

dev.off()
