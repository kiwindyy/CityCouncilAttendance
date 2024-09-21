#### Preamble ####
# Purpose: Tests the city council attendance data
# Author: Wendy Yuan
# Date: 27 September 2024
# Contact: w.yuan@mail.utoronto.ca

#### Tests raw data ####
raw_data <- read_csv("data/raw_data/unedited_data.csv")

# Test for NAs
all(is.na(raw_data))

#### Tests cleaned data ####
cleaned_data <- read_csv("data/cleaned_data/cleaned_data.csv")

# Test for NAs
cleaned_data$committee == "City Council"