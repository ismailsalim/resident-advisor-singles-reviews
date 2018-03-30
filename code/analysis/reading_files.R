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

# bit more pre-processing
# convert dates in realease_dates to R-recognised date-time objects
raw_df$release_date <- as.POSIXct(strptime(raw_df$release_date, format = "%Y-%m-%d"))
df_style$release_date <- as.POSIXct(strptime(df_style$release_date, format = "%Y-%m-%d"))
df_label$release_date <- as.POSIXct(strptime(df_label$release_date, format = "%Y-%m-%d"))
df_dates$release_date <- as.POSIXct(strptime(df_dates$release_date, format = "%Y-%m-%d"))
df_rating$release_date <- format(as.POSIXct(strptime(df_rating$release_date, format = "%Y-%m-%d")), "%b-%Y")

# remove row of dates df where release datae is supposedly in 1994
df_dates <- df_dates[df_dates$release_date != sort(df_dates$release_date, descreasing = F)[1],]

# remove row

# importing libraries
library(dplyr)
library(ggplot2)
library(knitr)
library(kableExtra) # exporting formatted tables
library(Cairo) # exporting plots with clarity