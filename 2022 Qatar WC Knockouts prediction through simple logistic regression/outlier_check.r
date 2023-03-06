# Outlier check
plot(org.data$knockouts ~ org.data$diffpts, main='Group difficulty pts. of teams to knockouts', ylab='Knockouts(0: Fail, 1: Success)', xlab='Group difficulty pts.')

# There are teams that made it to the knockouts despite the high difficulty pts., and there are teams that failed to make it to the knockouts despite the low difficulty pts.

# 1. Teams that succeeded to go to the knockouts despite the high diff. pts.
# → 2010 WC Italy, 2018 WC Germany, 2014 WC Spain, 2010 WC France

# 2. Teams that failed to go to the knockouts despite the low diff. pts.
# → 2018 WC Russia, 2002 WC Senegal, 2006 WC Ghana, 1998 WC Paraguay

# We will consider these as outliers, and delete them off the dataset.

# DATASET : wc 2018-1998 adj.csv
