# =================================================================
# Title: Ratings
# Author: Ismail Salim
# Description: Analyse the ratings that RA has given the reviews. 
# - Overall ratings
# - Looking at subsets of raw_df
# =================================================================

# set ggplot theme
theme_set(theme_minimal())
          
# summary of rating across all genres
summary(df_rating$rating)

# summary of ratings for each genres
summary_ratings_genre <- ratings_by_genre <- df_style %>% 
  group_by(style) %>% 
  summarise(no._of_reviews = n(),
            average_rating = round(mean(rating),2),
            median_rating = median(rating)) 

# plotting genre counts
png("images/genres-distribution", res = 100)
ggplot(summary_ratings_genre, aes(x = style, y = no._of_reviews)) +
  geom_bar(stat = "identity") +
  ylab("No. of Reviews") + xlab("Style") + 
  ggtitle("All House and Techno...") +
  theme(axis.text.x = element_text(angle = 45))
dev.off()

# creating exportable kable table of summary ratings
summary_ratings_genre %>%
  kable("html", align = "c", col.names = c("Style", "No. of Reviews", "Average Rating", "Median Rating")) %>%
  kable_styling(bootstrap_options = "striped") %>%
  column_spec(1, width = "4em", bold = T, border_right = T) %>%
  column_spec(2, width = "4em") %>%
  column_spec(3, width = "4em") %>%
  column_spec(4, width = "4em")

# chart of ratings across all genres
png("images/ratings-distribution", res = 100)
ggplot(df_rating) + 
  geom_bar(aes(x = rating)) +
  xlab('The Rating Given') + ylab("Number of Reviews") + ggtitle("Generally pretty meh?") + 
  scale_x_continuous(breaks = seq(0,5,0.5)) 
dev.off()

# percentage of ratings 
percentages <- rep(0, 4)
index <- seq(1,4)
ratings <- c(3, 3.5, 4, 4.5)
nrows <- nrow(df_rating)
for(i in index){
  percentages[i] <- nrow(df_rating[df_rating$rating == ratings[i],])/nrows
}
names(percentages) <- c("3.0", "3.5", "4.0", "4.5")


# labels with most reviews and average rating
top_labels <- df_label %>% 
  group_by(label) %>%
  summarise(review_count = n(),
            average_rating = round(mean(rating), 2),
            median_rating = median(rating)) %>%
  arrange(desc(review_count)) %>%
  head(20)

# artists with most reviews and average rating
top_artists <- df_rating %>% 
  group_by(artist) %>%
  summarise(review_count = n(),
            average_rating = round(mean(rating), 2),
            median_rating = median(rating)) %>%
  arrange(desc(review_count)) %>%
  filter(artist != "Unknown") %>% 
  slice(5:24) # due to problems of "various" artists problem

# hottest labels (most reviewed since beginning of 2017)
df_label %>% 
  filter(release_date > "2017-01-01") %>%
  group_by(label) %>%
  summarise(review_count = n(),
            average_rating = mean(rating)) %>%
  arrange(desc(review_count)) %>%
  head(n = 5)

# hottest artist (most review since beginning of 2017)
df_rating %>% 
  filter(release_date > "2017-01-01") %>%
  group_by(artist) %>%
  summarise(review_count = n(),
            average_rating = mean(rating)) %>%
  arrange(desc(review_count), desc(average_rating)) %>%
  slice(2:11) # due to problems of "various" artists problem

# singles rated 5 out of 5
single_rated_5 <- df_rating %>% 
  filter(rating == 5) %>%
  select(c(title, label, release_date))

# singles rated less than 2 out of 5
single_rated_low <- df_rating %>% 
  filter(rating < 2) %>%
  select(c(title, label, release_date, rating))


                  