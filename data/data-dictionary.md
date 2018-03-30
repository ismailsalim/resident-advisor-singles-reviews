# Resident Advisor Singles Reviews
## Ismail Salim

### Datasets:
1. resident-adv.csv 
2. new2.csv
3. raw_df.csv
4. df_dates.csv
5. df_label.csv
6. df_rating.csv
7. df_style.csv

The first two files are the unprocessed web-scraped datasets.
- *resident-adv.csv* is the file that was scraped in late 2017.
- *new2.csv* is the file that was scraped in early 2018. 

The rest of the files are the processed datasets.
- *raw_df* is the concatenation of *resident-adv.csv* and *new2.csv*.

The last 4 are the datasets that maximise the number of valid reviews for each variable.
- E.g. *df_dates.csv* is a subset of *raw_df.csv* dataset, where each row has a valid date input.
- E.g. *df_label.csv* is a subset of *raw_df.csv* dataset, where each row has a valid label input.

Every datatset contains rows with the following variables:
1. Title - the main title of a review on the single's associated webpage
2. Single - the title of the record
3. Arist - the artist associated with the record
4. Record - the title of the released record
5. Label - the label that the record was released by
6. Style - the style categorised by Resident Advisor*
7. Release date - the date of the record's release
8. Rating - the rating that Resident Advisor gives the record
9. Comments - the comments of RA's users on the review's webpage
10. URL - the relevant URL of the review
11. Description - the description by the author of the review

* styles that are similar have been aggregated by myself, refer to the preprocessing notebook.