# 2022 Qatar WC Knockouts prediction through simple logistic regression

## Data
[FIFA World Cup Ranking Data](https://www.kaggle.com/datasets/cashncarry/fifaworldranking)  
- FIFA rankings (1992~2022)
[WC Match & Result Data](https://www.kaggle.com/datasets/abecklas/fifa-world-cup)  
- World Cup fixtures history data  
All datasets are licensed by CC:0 Public Domain

## Tools : R

## Steps
1. Data wrangling
Assigning points to teams according to their FIFA rankings on the year that the World Cup took place respectively.

2. Modeling
- Team pts.
  - pts. of the nation respective to the FIFA ranking at that time
- Defining “difficulty pressure”
  - (Group point) / (Team point)
- Modeling- logistic regression
  - Made it to the knockouts = b0 + b1 (Difficulty pressure)
  - Train set vs. Test set?
  
3. Estimation
Using the model above, estimating the win rates that underdogs in each group would have, and seeing if they would make it to the knockouts. 

4. Limitations
Weather & climate issues, Area played & homeground advantages, Total movement of the squad (by transportation), Some extraordinary cases (ex. opposition’s main member becomes injured)
