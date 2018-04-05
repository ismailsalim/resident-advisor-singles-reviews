# =================================================================
# Title: Reading Files
# Author: Ismail Salim
# Inputs: data/processed
# Description: Reading the csv files to R objects
# =================================================================

# reading csv files
raw_df <- read.csv("data/processed/raw_df.csv") # whole dataset
df_style <- read.csv("data/processed/df_style.csv") # music style dataset
df_label <- read.csv("data/processed/df_label.csv") # record labels dataset
df_dates <- read.csv("data/processed/df_dates.csv") # release dates dataset
df_rating <- read.csv("data/processed/df_rating.csv") # ratings dataset

#### bit more pre-processing
# convert dates in realease_dates to R-recognised date-time objects
raw_df$release_date <- as.Date(raw_df$release_date, format = "%Y-%m-%d")
df_style$release_date <- as.Date(df_style$release_date, format = "%Y-%m-%d")
df_label$release_date <- as.Date(df_label$release_date, format = "%Y-%m-%d")
df_dates$release_date <- as.Date(df_dates$release_date, format = "%Y-%m-%d")
df_rating$release_date <- format(as.Date(df_rating$release_date, format = "%Y-%m-%d"), "%b-%Y")

#### correcting specific scraping errors 
# remove row of dates df where release datae is supposedly in 1994
df_dates <- df_dates[df_dates$release_date != sort(df_dates$release_date, descreasing = F)[1],]
# correct error for R&S Records
df_label$label <- as.character(df_label$label)
df_label$label[df_label$label == "R&amp;S Records"] <- "R&S Records"
# correct error of "<li> <div> Label /" in df_rating
df_rating$label <- as.character(df_rating$label)
df_rating$label[df_rating$label == "<li>\n<div>\nLabel /"] <- NA



# remove row

# importing libraries
library(dplyr)
library(ggplot2)
library(knitr)
library(kableExtra) # exporting formatted tables