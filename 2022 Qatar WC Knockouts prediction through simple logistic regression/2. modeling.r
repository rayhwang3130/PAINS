set.seed(2022)
ind <- sample(1:nrow(data), nrow(data)*0.7)
train <- data[ind, ]
test <- data[-ind, ]

model <- glm(knockouts ~ diffpts, data=train, family='binomial')
summary(model)

newdata <- data.frame(diffpts=seq(min(data$diffpts), max(data$diffpts), len=192))
newdata$knockouts <- predict(model, newdata, type="response")
plot(knockouts~diffpts, data=data, main='Group difficulty pts. of teams to the knockouts', ylab='Knockouts(0: Fail, 1: Success)', xlab='Group difficulty pts.', col="blue")
lines(knockouts~diffpts, data=newdata, lwd=2, col="red")

pred <- predict(model, newdata=test, type="response")
result_pred <- ifelse(pred >= 0.5, 1, 0)
table(result_pred, test$knockouts)

library(caret)
pred_round <- round(result_pred)
confusionMatrix(data=as.factor(test$knockouts), reference=as.factor(result_pred))
library(tibble)
library(cvms)
tib <- tibble("target" = test$knockouts, "prediction" = result_pred)
tab <- table(tib)
cfm <- as_tibble(tab)
plot_confusion_matrix(cfm, target_col = "target", prediction_col = "prediction",counts_col = "n")

# The approximate accuracy of the model is about 68.97%, and although the sensitivity is not dramatically larger than the specificity, the numbers were relatively high (0.7143).  
# The reason for the high probability that our model predicted 1 (pass to the knockouts) whereas the true result is 0, is because most of the data were centered around 0.5~0.6.

library(Epi)
ROC(pred, test$knockouts, plot='ROC')

# The AUC is calculated to be 0.766, which is a relatively positive value.
