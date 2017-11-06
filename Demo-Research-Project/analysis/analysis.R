library(vars)
library(broom)
# Fit a VAR to our data, since we found rank = 3. Using cointTest[[6]][2] pulls the optimal lag from the adf test result.
# The if statement makes sure we notice if something changes and we shouldn't be fitting a VAR anymore. 

if (cointTest[[6]][1] == 0){
varResult <- VAR(data, p = cointTest[[6]][2])
} else print("Error, should fit a VECM")




resultDataFrame <- as.data.frame(rbind(varResult[['varresult']]$Beans$coefficients, varResult[['varresult']]$Meal$coefficients, varResult[['varresult']]$Oil$coefficients))

