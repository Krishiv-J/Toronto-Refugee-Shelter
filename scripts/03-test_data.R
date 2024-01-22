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
final_refugees_data$New_Refugees |> min() >= 0
final_refugees_data$Total_Refugees |> min() >= 0
final_refugees_data$Percentage_of_Total |> min() >= 0

##Check the percent is not higher than 100 ##
final_refugees_data$Percentage_of_Total |> max() <= 100

##Check class of date col is Date ##
final_refugees_data$Date |> class() == "Date"