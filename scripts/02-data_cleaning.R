#### Preamble ####
# Purpose: Cleans the city council attendance data 
# Author: Wendy Yuan
# Date: 27 September 2024
# Contact: w.yuan@mail.utoronto.ca

#### Workspace setup ####
library(tidyverse)
library(dplyr)

#### Clean data ####
raw_data <- read_csv("data/raw_data/unedited_data.csv")

cleaned_data <-
  raw_data |>
  janitor::clean_names() |>
  filter(committee == "City Council") |> 
  #change from Y = present to 1 and N = absent to 0
  mutate(present = ifelse(present == "Y", 1, 0)) |>
  #removing day from date 
  separate(col = session_date,
           into = c("session_year", "session_month"),
           sep = "-") |> 
  #selects columns of interest
  select(first_name, last_name, committee, 
         session_year, session_month, session_type, present)

#### Save data ####
write_csv(cleaned_data, "data/cleaned_data/cleaned_data.csv")
