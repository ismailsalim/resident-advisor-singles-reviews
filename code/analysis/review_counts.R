# =================================================================
# Title: Review Counts
# Author: Ismail Salim
# Description: Number of reviews in each dataframe
# - Looking over time
# - Looking at subsets of raw_df
# =================================================================

# number of reviews in raw database
nrow(raw_df)

# month of last review
sort(df_dates$release_date, decreasing = T)[1]

# month of first review
sort(df_dates$release_date, descreasing = F)[1]


