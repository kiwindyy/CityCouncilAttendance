#### Preamble ####
# Purpose: Simulates data
# Author: Wendy Yuan
# Date: 27 September 2024
# Contact: w.yuan@mail.utoronto.ca

#### Workspace setup ####
library(tidyverse)
library(randomNames)
library(lubridate)

#### Simulate data ####
set.seed(1009122423)

# Generate random start and end times
generate_random_time_range <- function() {
  start_time <- sprintf("%02d:%02d%s", sample(1:12, 1), sample(0:59, 1),
                        sample(c("AM", "PM"), 1))
  end_time <- sprintf("%02d:%02d%s", sample(1:12, 1), sample(0:59, 1),
                      sample(c("AM", "PM"), 1))
  time_range <- paste(start_time, "-", end_time)
  return(time_range)
}

# creating inital variables
begin_year <- 2022
end_year <- 2026
observations <- 100
names <- randomNames(10)
committee_names <- c("City Council", "CreateTO", "Executive Committee",
                     "Toronto Parking Authority", "Audit Committee")
session_dates <- as.Date(sample(seq.Date(from = as.Date("2022-01-01"),
                                         to = as.Date("2024-12-31"),
                                         by = "day"),
                                20, replace = FALSE))
mtgs <- c(1:4)
type <- c("Morning", "Afternoon", "Evening")
meeting_times <- replicate(10, generate_random_time_range())

# generating random samples of each variable of interest
full_names <- sample(names, observations, replace = TRUE)
split_result <- strsplit(full_names, ", ")
split_result <- unlist(split_result)
first_name <- split_result[seq(2, length(split_result), by = 2)]
last_name <- split_result[seq(1, length(split_result), by = 2)]
committee <- sample(committee_names, observations, replace = TRUE)
mtg <- sample(mtgs, observations, replace = TRUE)
session_type <- sample(type, observations, prob = c(0.4, 0.4, 0.2),
                       replace = TRUE)
session_date <- sample(session_dates, observations, replace = TRUE)
session_time <- sample(meeting_times, observations, replace = TRUE)
present <- ifelse(rbinom(observations, 1, 0.75) == 1, "Y", "N")

# adding generated samples into a data frame
sim_data <-
  data.frame(Term = paste(begin_year, end_year, sep = "-"),
             `First Name` = first_name,
             `Last Name` = last_name, `Committee` = committee, `MTG #` = mtg,
             `Session Date` = session_date, `Session Type` = session_type,
             `Session Start-End Time` = session_time, `Present` = present,
             check.names = FALSE)

# generating sequence _id
sim_data <- sim_data %>%
  mutate(`_id` = row_number()) %>%
  relocate(`_id`)

#### Writing csv ####
write_csv(sim_data, file = "data/simulated_data/simulated_data.csv")