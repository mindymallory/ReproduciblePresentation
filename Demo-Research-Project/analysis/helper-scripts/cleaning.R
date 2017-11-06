library(xts)

# Read the .csv data into R
data <- read.csv("data/data.csv")

# Convert the first column to a zoo date object
data$Index <- as.Date(data$Index)

# Convert the data to an xts object (good for time series estimation)
data <- xts(data[, -1], order.by = data[, 1])

# Subset the data to include only the dates of our study
data <- data["2017-02-01/2017-12-31"]
