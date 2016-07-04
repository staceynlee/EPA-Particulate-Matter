# Read files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Aggregate data by year
aggregateTotal <- aggregate(Emissions ~ year, NEI, sum)

# Plot
png('plot1.png')
barplot(height = aggregateTotal$Emissions, names.arg=aggregateTotal$year, 
        xlab="Year", ylab=expression('Total PM'[2.5]*' Emission'),
        main=expression('Total PM'[2.5]*' Emissions at Each Year'))
dev.off()