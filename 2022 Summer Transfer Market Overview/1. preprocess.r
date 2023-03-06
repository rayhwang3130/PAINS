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

# apply the value function to market_value and transfer_value, and reassign the columns to the dataset we will be u9sing.

# deleting the Pound sign
selected$market_value <- gsub("€", "", selected$market_value)
selected$transfer_value <- gsub("€", "", selected$transfer_value)
selected$transfer_value

# applying the function and changing the columns' format (non-scientific) and type (chr -> int)
selected[, c("market_value", "transfer_value")] <- lapply(selected[, c("market_value", "transfer_value")], value)
selected$market_value <- format(as.numeric(selected$market_value), scientific=FALSE)
selected$transfer_value  <- format(as.numeric(selected$transfer_value), scientific=FALSE)
selected[, c("market_value", "transfer_value")] <- lapply(selected[, c("market_value", "transfer_value")], as.integer)
str(selected)

# adding ranks column
selected[, "rank"] = 0
# bundesliga
selected[selected$to_club=='fc-bayern-munchen', 'rank'] = 1
selected[selected$to_club=='sc-freiburg', 'rank'] = 2
selected[selected$to_club=='rasenballsport-leipzig', 'rank'] = 3
selected[selected$to_club=='eintracht-frankfurt', 'rank'] = 4
selected[selected$to_club=='1-fc-union-berlin', 'rank'] = 5
selected[selected$to_club=='borussia-dortmund', 'rank'] = 6
selected[selected$to_club=='vfl-wolfsburg', 'rank'] = 7
selected[selected$to_club=='borussia-monchengladbach', 'rank'] = 8
selected[selected$to_club=='sv-werder-bremen', 'rank'] = 9
selected[selected$to_club=='1-fsv-mainz-05', 'rank'] = 10
selected[selected$to_club=='tsg-1899-hoffenheim', 'rank'] = 11
selected[selected$to_club=='bayer-04-leverkusen', 'rank'] = 12
selected[selected$to_club=='1-fc-koln', 'rank'] = 13
selected[selected$to_club=='fc-augsburg', 'rank'] = 14
selected[selected$to_club=='hertha-bsc', 'rank'] = 15
selected[selected$to_club=='vfb-stuttgart', 'rank'] = 16
selected[selected$to_club=='vfl-bochum', 'rank'] = 17
selected[selected$to_club=='fc-schalke-04', 'rank'] = 18

# laliga
selected[selected$to_club=='fc-barcelona', 'rank'] = 1
selected[selected$to_club=='real-madrid', 'rank'] = 2
selected[selected$to_club=='real-sociedad-san-sebastian', 'rank'] = 3
selected[selected$to_club=='athletic-bilbao', 'rank'] = 4
selected[selected$to_club=='atletico-madrid', 'rank'] = 5
selected[selected$to_club=='real-betis-sevilla', 'rank'] = 6
selected[selected$to_club=='ca-osasuna', 'rank'] = 7
selected[selected$to_club=='rayo-vallecano', 'rank'] = 8
selected[selected$to_club=='fc-villarreal', 'rank'] = 9
selected[selected$to_club=='fc-valencia', 'rank'] = 10
selected[selected$to_club=='rcd-mallorca', 'rank'] = 11
selected[selected$to_club=='real-valladolid', 'rank'] = 12
selected[selected$to_club=='fc-girona', 'rank'] = 13
selected[selected$to_club=='ud-almeria', 'rank'] = 14
selected[selected$to_club=='fc-getafe', 'rank'] = 15
selected[selected$to_club=='espanyol-barcelona', 'rank'] = 16
selected[selected$to_club=='celta-vigo', 'rank'] = 17
selected[selected$to_club=='fc-sevilla', 'rank'] = 18
selected[selected$to_club=='fc-cadiz', 'rank'] = 19
selected[selected$to_club=='fc-elche', 'rank'] = 20

# epl
selected[selected$to_club=='fc-arsenal', 'rank'] = 1
selected[selected$to_club=='manchester-city', 'rank'] = 2
selected[selected$to_club=='newcastle-united', 'rank'] = 3
selected[selected$to_club=='tottenham-hotspur', 'rank'] = 4
selected[selected$to_club=='manchester-united', 'rank'] = 5
selected[selected$to_club=='fc-liverpool', 'rank'] = 6
selected[selected$to_club=='brighton-amp-hove-albion', 'rank'] = 7
selected[selected$to_club=='fc-chelsea', 'rank'] = 8
selected[selected$to_club=='fc-fulham', 'rank'] = 9
selected[selected$to_club=='fc-brentford', 'rank'] = 10
selected[selected$to_club=='crystal-palace', 'rank'] = 11
selected[selected$to_club=='aston-villa', 'rank'] = 12
selected[selected$to_club=='leicester-city', 'rank'] = 13
selected[selected$to_club=='afc-bournemouth', 'rank'] = 14
selected[selected$to_club=='leeds-united', 'rank'] = 15
selected[selected$to_club=='west-ham-united', 'rank'] = 16
selected[selected$to_club=='fc-everton', 'rank'] = 17
selected[selected$to_club=='nottingham-forest', 'rank'] = 18
selected[selected$to_club=='fc-southampton', 'rank'] = 19
selected[selected$to_club=='wolverhampton-wanderers', 'rank'] = 20

# serie-a
selected[selected$to_club=='ssc-neapel', 'rank'] = 1
selected[selected$to_club=='ac-mailand', 'rank'] = 2
selected[selected$to_club=='juventus-turin', 'rank'] = 3
selected[selected$to_club=='lazio-rom', 'rank'] = 4
selected[selected$to_club=='inter-mailand', 'rank'] = 5
selected[selected$to_club=='atalanta-bergamo', 'rank'] = 6
selected[selected$to_club=='as-rom', 'rank'] = 7
selected[selected$to_club=='udinese-calcio', 'rank'] = 8
selected[selected$to_club=='fc-turin', 'rank'] = 9
selected[selected$to_club=='fc-bologna', 'rank'] = 10
selected[selected$to_club=='ac-florenz', 'rank'] = 11
selected[selected$to_club=='us-salernitana-1919', 'rank'] = 12
selected[selected$to_club=='fc-empoli', 'rank'] = 13
selected[selected$to_club=='ac-monza', 'rank'] = 14
selected[selected$to_club=='us-sassuolo', 'rank'] = 15
selected[selected$to_club=='us-lecce', 'rank'] = 16
selected[selected$to_club=='spezia-calcio', 'rank'] = 17
selected[selected$to_club=='us-cremonese', 'rank'] = 18
selected[selected$to_club=='sampdoria-genua', 'rank'] = 19
selected[selected$to_club=='hellas-verona', 'rank'] = 20
