qatar <- read.csv("2022 qatar wc.csv", header=T, stringsAsFactors = TRUE)

pred2022 <- predict(model, newdata=qatar, type='response')
result_pred2022 <- ifelse(pred2022 >= 0.5, 1, 0)

qatar[, "knockouts"] = 0
qatar[, "prob"] = 0
qatar$prob <- pred2022
qatar$knockouts <- result_pred2022

write.csv(qatar, "./final.csv", fileEncoding = 'cp949')v
