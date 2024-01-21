#### Preamble ####
# Purpose: Tests to verify data is as expected
# Author: Krishiv
# Date: 21 January 2024
# Contact: krishiv.jain@mail.utoronto.ca
# License: MIT
# Pre-requisites: none

#### Workspace setup ####
library(tidyverse)

#### Test data ####

##Check the minimum number is equal, or greater than, 0 ##
#Based on: https://tellingstorieswithdata.com/02-drinking_from_a_fire_hose.html#simulate
final_refugees_data$newly_identified |> min() >= 0
final_refugees_data$total |> min() >= 0
final_refugees_data$population_group_percentage |> min() >= 0

##Check the percent is not higher than 100 ##
final_refugees_data$population_group_percentage |> max() <= 100

##Check class of date col is Date ##
final_refugees_data$date |> class() == "Date"