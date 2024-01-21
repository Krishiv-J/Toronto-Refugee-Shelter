#### Preamble ####
# Purpose: Downloads and saves the data from Open Data Toronto 
# Author: Krishiv Jain
# Date: 20 January 2024
# Contact: krishiv.jain@utoronto.ca
# License: MIT
# Pre-requisites: none
# Dataset: https://open.toronto.ca/dataset/toronto-shelter-system-flow/ 

#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)
library(janitor)

#### Download data ####

#Code from: https://open.toronto.ca/dataset/toronto-shelter-system-flow/

## Get package ##
refugees_in_shelters <-
  list_package_resources("ac77f532-f18b-427c-905c-4ae87ce69c93") |>
  filter(name ==
           "toronto-shelter-system-flow.csv") |>
  get_resource()

#### Save data ####
write_csv(refugees_in_shelters, "inputs/data/refugees_in_shelters.csv")