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
  # removing day from date 
  separate(col = session_date,
           into = c("session_year", "session_month"),
           sep = "-") |> 
  # changing months from numbers to words
  mutate(session_month = month.abb[as.numeric(session_month)]) |>
  # selects columns of interest
  select(committee, session_year, session_month, session_type, present)

#### Save data ####
write_csv(cleaned_data, "data/cleaned_data/cleaned_data.csv")
