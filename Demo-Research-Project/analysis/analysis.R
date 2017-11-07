library(vars)
library(broom)
# Fit a VAR to our data, since we found rank = 3. Using cointTest[[6]][2] pulls the optimal lag from the adf test result.
# The if statement makes sure we notice if something changes and we shouldn't be fitting a VAR anymore. 

if (cointTest[[6]][1] == 0){
varResult <- VAR(data, p = cointTest[[6]][2])
} else print("Error, should fit a VECM")




t <- summary(varResult)

varPrint <- rbind(t[[2]]$Beans$coefficients, t[[2]]$Meal$coefficients, t[[2]]$Oil$coefficients)
c <- c("Beans", "", "", "", "Meal", "", "", "", "Oil", "", "", "")
varPrint <- cbind.data.frame(c, rownames(varPrint), varPrint)
colnames(varPrint) <- c("Equation", "Variable", "Estimate", "Std. Error", "t-value", "Pr(>|t|)")