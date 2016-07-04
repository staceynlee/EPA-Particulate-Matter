# Load libraries
library(ggplot2)

# Read files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset Baltimore data
subsetCoal  <- SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE),]

# Merge data
merge <- merge(x=NEI, y=subsetCoal, by='SCC')
mergeSum <- aggregate(merge[, 'Emissions'], by=list(merge$year), sum)
colnames(mergeSum) <- c('Year', 'Emissions')

# Plot
png('plot4.png')

ggplot(mergeSum, aes(factor(Year), Emissions)) + geom_bar(stat="identity") +
  xlab("Year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) + 
  ggtitle('Total Emissions By Coal from 1999 to 2008')

dev.off()
