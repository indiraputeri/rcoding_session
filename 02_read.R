# Load Packages -------------------------
library(tidyverse)

c(41, 39, 36, 40, 38, 42, 39) %>% mean()

# Example 1: Read data ------------------
data <- read_csv("data/gsseduc_2021.csv")
data

ny_data <- read_csv("data/bym_nyc_study.csv")
ny_data

# Filter & Sort
ny_data <-
  ny_data  %>% 
  filter(med_hhincome > 50000) %>% 
  arrange(-med_hhincome)

# Example 2 ------------------------------
gmob_data <- read_csv("data/gmobility_report.csv")
gmob_data

str_replace(month.name, "ember$", "")

new_gmob <- select(gmob_data, 
                               country_region_code:sub_region_1, 
                               date, 
                               residential_percent_change_from_baseline) %>%
  rename(resi = 5)
