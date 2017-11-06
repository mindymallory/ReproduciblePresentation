
library(tseries)
library(tsDyn)
library(broom)
# Test if Data are Stationary
# If fail to reject, data are non-stationary
adfBeans <- adf.test(data$Beans)
adfMeal  <- adf.test(data$Meal)
adfOil   <- adf.test(data$Oil)

# Use Broom to get statistical model results into a dataframe when supported. 
# This makes it easier to programatically insert tables of results into your manuscript.
adfBeans <- tidy(adfBeans)
adfMeal <- tidy(adfMeal)
adfOil <- tidy(adfOil)

adfResults <- rbind(adfBeans, adfMeal, adfOil)

# Check for a cointegrating relationship
cointTest <- rank.select(data, lag.max = 10, r.max = ncol(data) - 1, include = "const")





