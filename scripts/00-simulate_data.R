#### Preamble ####
# Purpose: Simulates the Toronto Shelter System Flow data set
# Author: Krishiv Jain
# Date: 19 January 2024
# Contact: krishiv.jain@mail.utoronto.ca
# License: MIT
# Pre-requisites: none

#### Workspace setup ####
library(tidyverse)

#### Simulate data ####
set.seed(555) #random seed

#Start and End Dates of Data
start = as.Date("2023-01-31")
end = as.Date("2023-12-31")

#Start and End Dates of Data
simulated_data <-  
  tibble(
    #Generate Monthly Data
    #Based on: https://stackoverflow.com/a/73361392/23271634
    dates = seq(start + 1, end + 1, by = "1 month") - 1,
    #Randomly pick numbers from the normal distribution
    total_refugees = round(runif(12, min = 0, max = 5000)),
    percent_of_total = runif(12, min = 0, max = 100),
    new_refugees_to_shelter = round(runif(12, min = 0, max = total_refugees))
  )

simulated_data

### Tests ###

##Check the minimum number is equal, or greater than, 0 ##
#Based on: https://tellingstorieswithdata.com/02-drinking_from_a_fire_hose.html#simulate
simulated_data$total_refugees |> min() >= 0
simulated_data$percent_of_total |> min() >= 0

##Check the percent is not higher than 100 ##
simulated_data$percent_of_total |> max() <= 100

## Check that first and third columns only have whole numbers ##

#Based on: https://stackoverflow.com/q/3476782/23271634
is.wholenumber <- function(x, tol = .Machine$double.eps^0.5) abs(x - round(x)) < tol
is.wholenumber(simulated_data$total_refugees)
is.wholenumber(simulated_data$new_refugees_to_shelter)