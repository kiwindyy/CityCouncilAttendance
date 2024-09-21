#### Preamble ####
# Purpose: Simulates data
# Author: Wendy Yuan
# Date: 27 September 2024
# Contact: w.yuan@mail.utoronto.ca

#### Workspace setup ####
library(tidyverse)

#### Simulate data ####
set.seed(304)

observations <- 100
year <- c(2022:2024)
months <- c(1:12)
type <- c("morning", "afternoon")

session_type <- sample(type, observations, replace = TRUE)
session_year <- sample(year, observations, replace = TRUE)
session_month <- sample(months, observations, replace = TRUE)
attendance <- rbinom(observations, 1, 0.75)

sim_data <- 
  data.frame(session_type, session_year, session_month, attendance)

#### Write_csv
write_csv(sim_data, file = "data/simulated_data/simulated_data.csv")

