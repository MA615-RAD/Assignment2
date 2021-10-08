#The plotting function below takes in a year and a tibble as arguments and makes a scatter plot of Employment Percentages and the Number of Children per women. It labels the scatter dots with the Country name that contain either a maximum or minimum for those variables (so the country that has the most or least number of children per woman, the country that has the most or least percentage of young women employed). 


plot <- function(a, b) {
  {
    year<-a
    data2<-filter(b, year==a)
    #The first thing it does is filters the dataset for the year that is taken in by the function and it uses the filter function from the dplyr package
    t<-max(data2$children, na.rm=T)
    z<-max(data2$employpercent, na.rm=T)
    x<-min(data2$children, na.rm=T)
    y<-min(data2$employpercent, na.rm=T)
    #it then calculates the mean and the minimum of each of the variables, ignores blanks in the data
    data2$test<-ifelse(data2$children==t|data2$employpercent==z|data2$children==x|data2$employpercent==y, data2$country, "")
    #creates a column in the filtered dataset that grabs the country name if a row contained the max or min value of the statistic and leaves the row blank if it doesn't. This is for the conditional labeling in the next section of the countries
    c<-ggplot(data=data2, aes(x=employpercent, y=children))+geom_point(color="#F3A8EF")+ ylim(0,9) + geom_text(aes(label=test),hjust=0.5, vjust=0) + ggtitle("Fertility Versus Employment Percentage for", year) + labs(x="Employment Percentage of Women Ages 15-24", y="Number of Children")+
theme_minimal()
    #Creates a scatter plot, gives it an html color scheme, sets the y axis to be fixed so it's easier to compare trends year over year, labels only the four countries that take on the max and min values from the conditional column, gives it a title that tells you what year you're looking at, and labels the x and y axis, and gives it a theme
    print(c)
  }
}

#For reproducibility purposes, an opportunity to improve this code would be to avoid hard coding in x and y variables, that way generic datasets could be fed into the function, however the titles and labels would have to be modified since that is specific to whichever dataset is being used

#For fun I just wanted to make a plot for each year for the last 30 years to watch how the scatterplot eventually becomes more concentrated towards the lower end of each axis, I set the for loop to run backwards so the first plot that comes up is 1990 and you have to tab backwards to see the next year (kind of like a flip book). Only the years 1990 and 2020 will be included in the next step to talk about comparisons between two subsets of data.

years<-2020:1990

for (year in years) {
  plot(year, data)
}












