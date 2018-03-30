# cumulative count of reviews over time
library(caTools)
monthly_stats <- df_dates %>% 
  group_by(release_date) %>% 
  summarise(average_rating = mean(rating),
            count = n(),) %>% 
  mutate(average_rating_3mma = runmean(average_rating, 3),
          count_3mma = runmean(count, 3), 
         cumsum_count = cumsum(count))
monthly_stats

# set theme
theme_set(theme_linedraw())

# plotting monthly counts
ggplot(monthly_stats) + 
  geom_line(aes(x = release_date, y = count))

# plotting monthly counts 3mma
jpeg(filename = "images/monthly-reviews-over-time")
ggplot(monthly_stats) + 
  geom_line(aes(x = release_date, y = count_3mma)) +
  xlab("Release Date") + ylab("No. of Monthly Reviews (3mma)") +
  ggtitle("Increasing Monthly Reviews")
dev.off()

# plotting monthly ratings
ggplot(monthly_stats) + 
  geom_line(aes(x = release_date, y = average_rating))

# plotting monthly ratings 3mma
pdf(filename = "images/monthly-ratings-over-time")
ggplot(monthly_stats) + 
  geom_line(aes(x = release_date, y = average_rating_3mma)) + 
  xlab("Release Date") + ylab("Average Monthly Rating (3mma)") +
  ggtitle("A Trend In Ratings?")
dev.off()

