#### Preamble ####
# Purpose: Downloads and saves the data from Open Data Toronto
# Author: Wendy Yuan
# Date: 27 September 2024
# Contact: w.yuan@mail.utoronto.ca

#### Workspace setup ####
library(opendatatoronto)
library(dplyr)
library(readr)

# get package
package <- show_package("9426c94d-abdb-45fe-9a81-79be40d204d2")
package

# get all resources for this package
resources <- list_package_resources("9426c94d-abdb-45fe-9a81-79be40d204d2")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
data <- filter(datastore_resources, row_number()==1) %>% get_resource()
data

#### Save data ####
write_csv(data, "data/raw_data/unedited_data.csv") 
