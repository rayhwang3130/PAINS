# summary of market value
df %>% summarize(avg = mean(market_value), 
max = max(market_value), 
who = .[market_value == max(market_value), 'name'])


# summary of transfer value
df %>% filter(transfer_value != 0) %>%
summarize(avg = mean(transfer_value), 
max = max(transfer_value), 
who = .[transfer_value == max(transfer_value), 'name'])

# who had maximum market value and transfer value for each league?
df %>% filter(to_league == 'bundesliga') %>% summarize(max_market = .[market_value == max(market_value), 'name'],
max_transfer = .[transfer_value == max(transfer_value), 'name'])
df %>% filter(to_league == 'laliga') %>% summarize(max_market = .[market_value == max(market_value), 'name'],
max_transfer = .[transfer_value == max(transfer_value), 'name'])
df %>% filter(to_league == 'premier-league') %>% summarize(max_market = .[market_value == max(market_value), 'name'],
max_transfer = .[transfer_value == max(transfer_value), 'name'])
df %>% filter(to_league == 'serie-a') %>% summarize(max_market = .[market_value == max(market_value), 'name'],
max_transfer = .[transfer_value == max(transfer_value), 'name'])

# Most transfer by league
df %>% count(to_league) %>% 
    ggplot(aes(to_league, n, fill=to_league)) + geom_bar(stat = 'identity') +
    guides(fill=guide_legend(title="Colors by league")) +
    xlab('Leagues') +
    ylab('Number of transfers') +
    ggtitle('Total number of transfers by league') +
    geom_text(aes(label=n), vjust = -0.8, size = 10)

# Most transfer by team
df %>% filter(to_league == 'bundesliga') %>% count(to_club) %>% 
    ggplot(aes(reorder(to_club, n), n, fill=to_club)) + geom_bar(stat = 'identity') +
    coord_flip()+
    guides(fill=guide_legend(title="Colors by team")) +
    xlab('Teams of Bundesliga') +
    ylab('Number of transfers') +
    ggtitle('Total number of transfers by team in the Bundesliga') +
    geom_text(aes(label=n), size = 5)

df %>% filter(to_league == 'laliga') %>% count(to_club) %>% 
    ggplot(aes(reorder(to_club, n), n, fill=to_club)) + geom_bar(stat = 'identity') +
    coord_flip()+
    guides(fill=guide_legend(title="Colors by team")) +
    xlab('Teams of LaLiga') +
    ylab('Number of transfers') +
    ggtitle('Total number of transfers by team in LaLiga') +
    geom_text(aes(label=n), size = 5)

df %>% filter(to_league == 'premier-league') %>% count(to_club) %>% 
    ggplot(aes(reorder(to_club, n), n, fill=to_club)) + geom_bar(stat = 'identity') +
    coord_flip()+
    guides(fill=guide_legend(title="Colors by team")) +
    xlab('Teams of the Premier League') +
    ylab('Number of transfers') +
    ggtitle('Total number of transfers by team in the Premier League') +
    geom_text(aes(label=n), size = 5)

df %>% filter(to_league == 'serie-a') %>% count(to_club) %>% 
    ggplot(aes(reorder(to_club, n), n, fill=to_club)) + geom_bar(stat = 'identity') +
    coord_flip()+
    guides(fill=guide_legend(title="Colors by team")) +
    xlab('Teams of Serie-A') +
    ylab('Number of transfers') +
    ggtitle('Total number of transfers by team in Serie-A') +
    geom_text(aes(label=n), size = 5)
    
# Total inflow of market value to each league
df %>% group_by(to_league) %>% summarize(sum = sum(market_value)) %>%
    ggplot(aes(reorder(to_league, sum), sum, fill=to_league)) + geom_bar(stat = 'identity') +
    coord_flip()+
    guides(fill=guide_legend(title="Colors by league")) +
    xlab('Leagues') +
    ylab('Total market value inflow') +
    ggtitle('Total sum of market value that flowed in to each league') +
    geom_text(aes(label=sum), size = 5, hjust = 1.5)
    
# Total expenditure by league
df %>% group_by(to_league) %>% summarize(sum = sum(transfer_value)) %>%
    ggplot(aes(reorder(to_league, sum), sum, fill=to_league)) + geom_bar(stat = 'identity') +
    coord_flip()+
    guides(fill=guide_legend(title="Colors by league")) +
    xlab('Leagues') +
    ylab('Total money used on transfers') +
    ggtitle('Total sum of transfer fees that each league used') +
    geom_text(aes(label=sum), size = 5, hjust = 1.5)

# Total inflow of market value by team
df %>% filter(to_league == 'bundesliga') %>% group_by(to_club) %>% summarize(sum = sum(market_value)) %>%
    ggplot(aes(reorder(to_club, sum), sum, fill=to_club)) + geom_bar(stat = 'identity') +
    coord_flip()+
    guides(fill=guide_legend(title="Colors by team")) +
    xlab('Teams of Bundesliga') +
    ylab('Total market value inflow') +
    ggtitle('Total sum of market value that flowed in to each team in the Bundesliga') +
    geom_text(aes(label=sum), size = 5, hjust = 0.6)

df %>% filter(to_league == 'laliga') %>% group_by(to_club) %>% summarize(sum = sum(market_value)) %>%
    ggplot(aes(reorder(to_club, sum), sum, fill=to_club)) + geom_bar(stat = 'identity') +
    coord_flip()+
    guides(fill=guide_legend(title="Colors by team")) +
    xlab('Teams of LaLiga') +
    ylab('Total market value inflow') +
    ggtitle('Total sum of market value that flowed in to each team in the LaLiga') +
    geom_text(aes(label=sum), size = 5, hjust = 0.6)

df %>% filter(to_league == 'premier-league') %>% group_by(to_club) %>% summarize(sum = sum(market_value)) %>%
    ggplot(aes(reorder(to_club, sum), sum, fill=to_club)) + geom_bar(stat = 'identity') +
    coord_flip()+
    guides(fill=guide_legend(title="Colors by team")) +
    xlab('Teams of the Premier League') +
    ylab('Total market value inflow') +
    ggtitle('Total sum of market value that flowed in to each team in the Premier League') +
    geom_text(aes(label=sum), size = 5, hjust = 0.6)

df %>% filter(to_league == 'serie-a') %>% group_by(to_club) %>% summarize(sum = sum(market_value)) %>%
    ggplot(aes(reorder(to_club, sum), sum, fill=to_club)) + geom_bar(stat = 'identity') +
    coord_flip()+
    guides(fill=guide_legend(title="Colors by team")) +
    xlab('Teams of Serie-A') +
    ylab('Total market value inflow') +
    ggtitle('Total sum of market value that flowed in to each team in the Serie-A') +
    geom_text(aes(label=sum), size = 5, hjust = 0.6)

# Total expenditure by team
df %>% filter(to_league == 'bundesliga') %>% group_by(to_club) %>% summarize(sum = sum(transfer_value)) %>%
    ggplot(aes(reorder(to_club, sum), sum, fill=to_club)) + geom_bar(stat = 'identity') +
    coord_flip()+
    guides(fill=guide_legend(title="Colors by team")) +
    xlab('Teams of Bundesliga') +
    ylab('Total expenditures') +
    ggtitle('Total expenditures of each team in the Bundesliga') +
    geom_text(aes(label=sum), size = 5, hjust = 0.6)

df %>% filter(to_league == 'laliga') %>% group_by(to_club) %>% summarize(sum = sum(transfer_value)) %>%
    ggplot(aes(reorder(to_club, sum), sum, fill=to_club)) + geom_bar(stat = 'identity') +
    coord_flip()+
    guides(fill=guide_legend(title="Colors by team")) +
    xlab('Teams of LaLiga') +
    ylab('Total expenditures') +
    ggtitle('Total expenditures of each team in the LaLiga') +
    geom_text(aes(label=sum), size = 5, hjust = 0.6)

df %>% filter(to_league == 'premier-league') %>% group_by(to_club) %>% summarize(sum = sum(transfer_value)) %>%
    ggplot(aes(reorder(to_club, sum), sum, fill=to_club)) + geom_bar(stat = 'identity') +
    coord_flip()+
    guides(fill=guide_legend(title="Colors by team")) +
    xlab('Teams of the Premier League') +
    ylab('Total expenditures') +
    ggtitle('Total expenditures of each team in the Premier League') +
    geom_text(aes(label=sum), size = 5, hjust = 0.6)

df %>% filter(to_league == 'serie-a') %>% group_by(to_club) %>% summarize(sum = sum(transfer_value)) %>%
    ggplot(aes(reorder(to_club, sum), sum, fill=to_club)) + geom_bar(stat = 'identity') +
    coord_flip()+
    guides(fill=guide_legend(title="Colors by team")) +
    xlab('Teams of Serie-A') +
    ylab('Total expenditures') +
    ggtitle('Total expenditures of each team in the Serie-A') +
    geom_text(aes(label=sum), size = 5, hjust = 0.6)
