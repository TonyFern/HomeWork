install.packages("tidyverse")
require(ggplot2)

ride_data <- read.csv("ride_data.csv")
city_data <- read.csv("city_data.csv")

head(ride_data)
summary(ride_data)

nrow(ride_data)
ncol(ride_data)

head(city_data)
summary(city_data)

dim(city_data)


fareTotal <- aggregate(ride_data$fare, 
                       by=list(Category=ride_data$city), 
                       FUN=sum)
fareCountD  <- as.data.frame(table(ride_data$city))

names(fareTotal)[1] <- "city"
names(fareTotal)[2] <- "sum"
names(fareCountD)[1] <- "city"

# mergeData
joinData <- merge(fareTotal,fareCountD)
joinData <- merge(joinData, city_data)


joinData$average.fare <- joinData$sum/joinData$Freq

g <- ggplot(joinData, 
            aes(x=joinData$Freq, 
                y=joinData$average.fare))

pdq <- g + geom_point(aes(color=joinData$type)) 
    
    
install.packages("plotly")
y

require(plotly)

ggplotly(pdq)
            



