#### Preamble ####
# Purpose: Tests the city council attendance data
# Author: Wendy Yuan
# Date: 27 September 2024
# Contact: w.yuan@mail.utoronto.ca

library(readr)

# creating inital variables
begin_year = 2022
end_year = 2026

#### Tests raw data ####
raw_data <- read_csv("data/raw_data/unedited_data.csv")

# Test for NAs
all(is.na(raw_data))

#### Tests cleaned data ####
cleaned_data <- read_csv("data/cleaned_data/cleaned_data.csv")

#Test first last name deliminator
all(sapply(cleaned_data$name, function(name) {
  split_name <- strsplit(name, " ")[[1]]  # Split by space
  length(split_name) == 2                 # Check if it splits into exactly 2 parts
}))

# Test for City Council Member
all(cleaned_data$committee == "City Council")

# Test session year
all(cleaned_data$session_year >= begin_year & cleaned_data$session_year <= end_year & !is.na(cleaned_data$session_year))

#Test for Session types
all(cleaned_data$session_type %in% c("Morning", "Afternoon", "Evening"))

#Test for present Yes or No
all(cleaned_data$present %in% c("Yes", "No") & !is.na(cleaned_data$present))
