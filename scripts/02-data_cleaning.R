#### Preamble ####
# Purpose: Cleans the city council attendance data
# Author: Wendy Yuan
# Date: 27 September 2024
# Contact: w.yuan@mail.utoronto.ca

#### Workspace setup ####
library(tidyverse)
library(dplyr)
library(lubridate)
library(readr)

#### Clean data ####
raw_data <- read_csv("data/raw_data/unedited_data.csv")

cleaned_data <-
  raw_data |>
  janitor::clean_names() |>
  filter(committee == "City Council") |>
  # changing present to be more readable
  mutate(present = ifelse(present == "Y", "Yes", "No")) |>
  mutate(name = paste(first_name, last_name, sep = " ")) |>
  # separate year from session_date
  mutate(session_year = substr(session_date, 1, 4)) |>
  # selects columns of interest
  select(name, committee, session_year, session_type, present)

#### Save data ####
write_csv(cleaned_data, "data/cleaned_data/cleaned_data.csv")