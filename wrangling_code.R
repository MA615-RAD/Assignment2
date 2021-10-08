#Load tidyverse and excel packages

library(tidyverse)
library(openxlsx)

#Reading in the 2 datasets that were downloaded from (https://www.gapminder.org/data/, saved in the R project file to be read in directly

Children1<-read.xlsx("children_per_woman_total_fertility.xlsx")
View(Children1)
#I can see that this dataset has a lot of years, some that take place in the future. I have decided to omit those for my analysis since I'm only interested in summarizing what has happened. The column names and the datatypes seem to be suffiencient and don't require any extra cleanup

Children<-read.xlsx("children_per_woman_total_fertility.xlsx", cols=1:223)
#Reading in the dataset again and omitting the future years

Employment<-read.xlsx("females_aged_15_24_employment_rate_percent.xlsx")
View(Employment)

#Reading in this data as is, I'm content with the data and it doesn't seem to require any additional trimming or cleaning

child<-Children %>% pivot_longer(!country, names_to = "year", values_to = "children")

#Using the tidyr package, the pivot longer function takes in the first data set and turns each of the columns that contain a year into individual rows (a combination of year and country name make a unique identifier for the row) data set now has 3 columns of country, year, and average number of children 


employ<-Employment %>% pivot_longer(!country, names_to = "year", values_to = "employpercent")

#same process as above, column names are year, country, and percentage of women aged 15-24 employed



data<-left_join(child, employ, by=c("year", "country"))
#To combine the two datasets together, I decided to use a left join function from the dplyr package since Children has many more countries and years available than Employment does, so this will bring in all the rows from Children and Employment and leave blanks in the cells for the Employment stats where data is missing. I will set calculations that I do in the next section to ignore the blanks in the relevant columns. I joined on year and country since that is what creates a unique identifier per row for this data. 

is_tibble(data)
#Verifying that dataset is a tibble for the next section, this returns True