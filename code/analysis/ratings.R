# =================================================================
# Title: Ratings
# Author: Ismail Salim
# Description: Analyse the ratings that RA has given the reviews. 
# - Overall ratings
# - Looking at subsets of raw_df
# =================================================================

# summary of rating across all genres
summary(df_rating$rating)

# summary of ratings for each genres
summary_ratings_genre <- ratings_by_genre <- df_style %>% 
  group_by(style) %>% 
  summarise(no._of_reviews = n(),
            average_rating = round(mean(rating),2),
            median_rating = median(rating)) 

# creating exportable kable table of summary ratings
summary_ratings_genre %>%
  kable("html", align = "c", col.names = c("Style", "No. of Reviews", "Average Rating", "Median Rating")) %>%
  kable_styling(bootstrap_options = "striped") %>%
  column_spec(1, width = "4em", bold = T, border_right = T) %>%
  column_spec(2, width = "4em") %>%
  column_spec(3, width = "4em") %>%
  column_spec(4, width = "4em")

# set theme
theme_set(theme_linedraw())

# chart of ratings across all genres
jpeg("images/ratings-distribution")
ggplot(df_rating) + 
  geom_bar(aes(x = rating)) +
  xlab('The Rating Given') + ylab("Number of Reviews") + ggtitle("The Distribution of Ratings") + 
  scale_x_continuous(breaks = seq(0,5,0.5)) 
dev.off()


# labels with most reviews and average rating
top_labels <- df_label %>% 
  group_by(label) %>%
  summarise(review_count = n(),
            average_rating = round(mean(rating), 2),
            median_rating = median(rating)) %>%
  arrange(desc(review_count)) %>%
  head(20)
# exportable version of top_labels table
top_labels %>% 
  kable("html", align = "c", col.names = c("Record Label", "No. of Reviews", "Average Rating", "Median Rating")) %>%
  kable_styling(bootstrap_options = "striped") %>%
  column_spec(1, bold = T, border_right = T)
  

# artists with most reviews and average rating
top_artists <- df_rating %>% 
  group_by(artist) %>%
  summarise(review_count = n(),
            average_rating = round(mean(rating), 2),
            median_rating = median(rating)) %>%
  arrange(desc(review_count)) %>%
  slice(5:25) # due to problems of "various" artists problem
# exportable version of top_artists table
top_artists %>% 
  kable("html", align = "c", col.names = c("Artist", "No. of Reviews", "Average Rating", "Median Rating")) %>%
  kable_styling(bootstrap_options = "striped") %>%
  column_spec(1, bold = T, border_right = T)

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
# exportable version of singles_rated_5 table
single_rated_5 %>% 
  kable("html", align = "c", col.names = c("Title", "Label", "Release Date")) %>%
  kable_styling(bootstrap_options = "striped") %>%
  column_spec(3, width = "7em")

# singles rated less than 2 out of 5
single_rated_low <- df_rating %>% 
  filter(rating < 2) %>%
  select(c(title, label, release_date, rating))
# exportable version of singles_rated_5 table
single_rated_low %>% 
  kable("html", align = "c", col.names = c("Title", "Label", "Release Date", "Rating")) %>%
  kable_styling(bootstrap_options = "striped") %>%
  column_spec(3, width = "7em")

                  