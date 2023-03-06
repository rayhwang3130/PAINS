# 2022 Summer Transfer Market Overview
# Are teams that spent more money *really* doing better?

## Data
Original dataset from Kaggle:  
[2022 Summer Football Transfer Data](https://www.kaggle.com/datasets/mohamedsiika/football-transfer-window-from-july-to-september/code)  
License: Public Domain

## Tool : R- ggplot2

## Steps
1. Data preprocessing
- Selecting needed columns:
  - `name, to_club, to_league, market_value, transfer_value`

- Selecting the leagues:
  - `bundesliga, premier-league, serie-a, laliga, ligue-1`

- Changing values:
  - `value col`: `m, Th.` → respective values / `free transfer, loan transfer` → 0

- Adding column:
  - `ranks` = rank of each team

2. Correlation
- Totals
  - Total expenditures (total, by league, by team)
  - Total change in market_value
  - Total difference (by league, by team)

- Per league
  - transfer_value per team ~ all the team ranks
  - transfer_value per team ~ team ranks per league
  - market_value ~ team ranks

- Difference
  - difference ~ all the team ranks
  - difference ~ team ranks per league
