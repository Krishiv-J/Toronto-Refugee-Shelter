#### Preamble ####
# Purpose: Cleans the raw Toronto Shelter System Flow data
# Author: Krishiv Jain
# Date: 20 January 2024
# Contact: krishiv.jain@mail.utoronto.ca
# License: MIT
# Pre-requisites: none

#### Workspace setup ####
library(tidyverse)

#### Read in the raw data ####
raw_refugees_shelters_data <-
  read_csv(
    file = "inputs/data/refugees_in_shelters.csv",
    show_col_types = FALSE
  )

#### Cleaning data ####

cleaned_data <-
  clean_names(raw_refugees_shelters_data)

## Keeping refugee rows ##
refugees_data <- cleaned_data[raw_refugees_shelters_data$population_group == "Refugees",]

## Creating new date col in date format and replacing old one, and renaming it ##
start = as.Date("2018-01-01")
end = as.Date("2023-12-01")
refugees_data$date_mmm_yy = seq(start + 1, end + 1, by = "1 month") - 1
refugees_data <- refugees_data |> 
  rename(date = date_mmm_yy)

## Adding a new column that adds all ages to give total ##
total_refugees_data <- mutate(refugees_data, total = ageunder16 + age16_24 + age25_44 + age45_64 + age65over)

## Keeping necessary columns, renaming, and reordering them ##
final_refugees_data <- select(total_refugees_data, date, newly_identified, population_group_percentage, total)

final_refugees_data <- final_refugees_data |>
  rename(Date = date, New_Refugees = newly_identified, 
         Percentage_of_Total = population_group_percentage, 
         Total_Refugees = total)

#Based on: https://stackoverflow.com/a/7496246/23271634

final_refugees_data <- final_refugees_data[,c(1,2,4,3)]

## Converting percentage col to numeric ##
final_refugees_data$Percentage_of_Total <- 
  as.numeric(sub("%", "",final_refugees_data$Percentage_of_Total))

#### Save data ####
write_csv(final_refugees_data, "outputs/data/final_refugees_data.csv")