# Libraries
library(dplyr)
library(ggplot2)

# Bringing the dataset
transfer <- read.csv("Summer_transfer_window_2022.csv", header=T)
str(transfer)

# selecting columns name, to_club, to_league, market_value, transfer_value
# filtering to include only teams from bundesliga, premier-league, serie-a, laliga
selected <- transfer %>% as_tibble() %>%
  select(name, to_club, to_league, market_value, transfer_value) %>%
  filter(to_league %in% c('bundesliga', 'premier-league', 'serie-a', 'laliga'))
