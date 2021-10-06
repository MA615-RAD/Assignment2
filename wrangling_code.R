#Load tidyverse and excel packages
library(tidyverse)
library(openxlsx)
#Reading in the 2 datasets, saved in the project file


Children<-read.xlsx("children_per_woman_total_fertility.xlsx", cols=1:223)
#putting contraints on which columns to read since I'm not interested in future projections, this data set contains years that haven't happened yet
Employment<-read.xlsx("females_aged_15_24_employment_rate_percent.xlsx")


child<-Children %>% pivot_longer(!country, names_to = "year", values_to = "children")



employ<-Employment %>% pivot_longer(!country, names_to = "year", values_to = "employpercent")


data<-left_join(child, employ, by=c("year", "country"))
#joining the two data sets together, expects blank values in the employpercent column since there are several years where there is no employment data for 

is_tibble(data)

