#### Preamble ####
# Purpose: Tests the city council attendance data
# Author: Wendy Yuan
# Date: 27 September 2024
# Contact: w.yuan@mail.utoronto.ca

library(readr)

#### Tests raw data ####
raw_data <- read_csv("data/raw_data/unedited_data.csv")

# Test for NAs
all(is.na(raw_data))

# Test for City Council Member
raw_data$Committee == "City Council"

#### Tests cleaned data ####
cleaned_data <- read_csv("data/cleaned_data/cleaned_data.csv")

# Test for City Council Member
cleaned_data$committee == "City Council"
