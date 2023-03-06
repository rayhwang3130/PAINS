library(corrplot)
library(ggpubr)

# bundesliga
df %>% filter(to_league == 'bundesliga') %>% group_by(rank) %>% 
    summarize(sum_market = sum(market_value), sum_transfer = sum(transfer_value)) %>%
    cor() %>% corrplot(tl.col = "#000000", tl.srt = 30, bg = "White",
         title = "Correlation Plot Of Bundesliga ranks and sum of values",
         type = "full", addCoef.col = "black")

df %>% filter(to_league == 'bundesliga') %>% group_by(rank) %>% 
    summarize(sum = sum(market_value)) %>%
    ggscatter(x='rank', y='sum', alpha=0.0, add = "reg.line", 
    add.params = list(color = "#ff00d0", fill = "lightgray"), conf.int = TRUE) +
    stat_cor(method = "pearson", label.x=6, label.y=200000, size=10) +
    ggtitle('Scatterplot and correlation between rank and total market value inflow, Bundesliga') +
    xlab('Rank') + ylab('Total market value inflow') +
    geom_text(aes(label=rank), size = 10)

df %>% filter(to_league == 'bundesliga') %>% group_by(rank) %>% 
    summarize(sum = sum(transfer_value)) %>%
    ggscatter(x='rank', y='sum', alpha=0.0, add = "reg.line", 
    add.params = list(color = "#ff00d0", fill = "lightgray"), conf.int = TRUE) +
    stat_cor(method = "pearson", label.x=6, label.y=150000, size=10) +
    ggtitle('Scatterplot and correlation between rank and total transfer expenditures, Bundesliga') +
    xlab('Rank') + ylab('Total expenditures') +
    geom_text(aes(label=rank), size = 10)
    
# laliga
df %>% filter(to_league == 'bundesliga') %>% group_by(rank) %>% 
    summarize(sum_market = sum(market_value), sum_transfer = sum(transfer_value)) %>%
    cor() %>% corrplot(tl.col = "#000000", tl.srt = 30, bg = "White",
         title = "Correlation Plot Of Bundesliga ranks and sum of values",
         type = "full", addCoef.col = "black")

df %>% filter(to_league == 'bundesliga') %>% group_by(rank) %>% 
    summarize(sum = sum(market_value)) %>%
    ggscatter(x='rank', y='sum', alpha=0.0, add = "reg.line", 
    add.params = list(color = "#ff00d0", fill = "lightgray"), conf.int = TRUE) +
    stat_cor(method = "pearson", label.x=6, label.y=200000, size=10) +
    ggtitle('Scatterplot and correlation between rank and total market value inflow, Bundesliga') +
    xlab('Rank') + ylab('Total market value inflow') +
    geom_text(aes(label=rank), size = 10)

df %>% filter(to_league == 'bundesliga') %>% group_by(rank) %>% 
    summarize(sum = sum(transfer_value)) %>%
    ggscatter(x='rank', y='sum', alpha=0.0, add = "reg.line", 
    add.params = list(color = "#ff00d0", fill = "lightgray"), conf.int = TRUE) +
    stat_cor(method = "pearson", label.x=6, label.y=150000, size=10) +
    ggtitle('Scatterplot and correlation between rank and total transfer expenditures, Bundesliga') +
    xlab('Rank') + ylab('Total expenditures') +
    geom_text(aes(label=rank), size = 10)
    
# EPL
df %>% filter(to_league == 'premier-league') %>% group_by(rank) %>% 
    summarize(sum_market = sum(market_value), sum_transfer = sum(transfer_value)) %>%
    cor() %>% corrplot(tl.col = "#000000", tl.srt = 30, bg = "White",
         title = "Correlation Plot Of Premier League ranks and sum of values",
         type = "full", addCoef.col = "black")

df %>% filter(to_league == 'premier-league') %>% group_by(rank) %>% 
    summarize(sum = sum(market_value)) %>%
    ggscatter(x='rank', y='sum', alpha=0.0, add = "reg.line", 
    add.params = list(color = "#2c14db", fill = "lightgray"), conf.int = TRUE) +
    stat_cor(method = "pearson", label.x=6, label.y=200000, size=10) +
    ggtitle('Scatterplot and correlation between rank and total market value inflow, Premier League') +
    xlab('Rank') + ylab('Total market value inflow') +
    geom_text(aes(label=rank), size = 10)

df %>% filter(to_league == 'premier-league') %>% group_by(rank) %>% 
    summarize(sum = sum(transfer_value)) %>%
    ggscatter(x='rank', y='sum', alpha=0.0, add = "reg.line", 
    add.params = list(color = "#2c14db", fill = "lightgray"), conf.int = TRUE) +
    stat_cor(method = "pearson", label.x=6, label.y=150000, size=10) +
    ggtitle('Scatterplot and correlation between rank and total transfer expenditures, Premier League') +
    xlab('Rank') + ylab('Total expenditures') +
    geom_text(aes(label=rank), size = 10)

# Serie A
df %>% filter(to_league == 'serie-a') %>% group_by(rank) %>% 
    summarize(sum_market = sum(market_value), sum_transfer = sum(transfer_value)) %>%
    cor() %>% corrplot(tl.col = "#000000", tl.srt = 30, bg = "White",
         title = "Correlation Plot Of Serie A ranks and sum of values",
         type = "full", addCoef.col = "black")

df %>% filter(to_league == 'serie-a') %>% group_by(rank) %>% 
    summarize(sum = sum(market_value)) %>%
    ggscatter(x='rank', y='sum', alpha=0.0, add = "reg.line", 
    add.params = list(color = "#2c14db", fill = "lightgray"), conf.int = TRUE) +
    stat_cor(method = "pearson", label.x=6, label.y=200000, size=10) +
    ggtitle('Scatterplot and correlation between rank and total market value inflow, Serie A') +
    xlab('Rank') + ylab('Total market value inflow') +
    geom_text(aes(label=rank), size = 10)

df %>% filter(to_league == 'serie-a') %>% group_by(rank) %>% 
    summarize(sum = sum(transfer_value)) %>%
    ggscatter(x='rank', y='sum', alpha=0.0, add = "reg.line", 
    add.params = list(color = "#2c14db", fill = "lightgray"), conf.int = TRUE) +
    stat_cor(method = "pearson", label.x=6, label.y=150000, size=10) +
    ggtitle('Scatterplot and correlation between rank and total transfer expenditures, Serie A') +
    xlab('Rank') + ylab('Total expenditures') +
    geom_text(aes(label=rank), size = 10)
