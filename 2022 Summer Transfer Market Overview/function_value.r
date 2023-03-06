# Define a function value_to_int or create a conditional code that makes:

# 1. If value is -, it should return 0.
# 2. If value is ?, it should return 0.
# 3. If value is by m, it should be multiplied by 1000000.
# 4. If value is by Th., it should be multiplied by 1000.
# 5. If value is free transfer, it should return 0.
# 6. If value is loan transfer, it should return 0.

# apply the function to market_value and transfer_value, and reassign the columns to the dataset we will be u9sing.

# deleting the Pound sign
selected$market_value <- gsub("€", "", selected$market_value)
selected$transfer_value <- gsub("€", "", selected$transfer_value)
selected$transfer_value

# making a function to take care of m, Th., and others
value <- function(list) {
  list[grep("*m", list)] <- as.integer(gsub("m", "", list[grep("*m", list)])) * 1000000
  list[grep("*Th.", list)] <- as.integer(gsub("Th.", "", list[grep("*Th.", list)])) * 1000
  list[list %in% c('?', '-', 'loan transfer', 'free transfer', 'Loan fee:')] <- 0
  return(list)
}

# applying the function and changing the columns' format (non-scientific) and type (chr -> int)
selected[, c("market_value", "transfer_value")] <- lapply(selected[, c("market_value", "transfer_value")], value)
selected$market_value <- format(as.numeric(selected$market_value), scientific=FALSE)
selected$transfer_value  <- format(as.numeric(selected$transfer_value), scientific=FALSE)
selected[, c("market_value", "transfer_value")] <- lapply(selected[, c("market_value", "transfer_value")], as.integer)
str(selected)
