library(tidyverse)


#Function takes in a year and a tibble as arguments, to make a scatter plot of employment percentage for women aged 15-24 versus fertility rates for a particular year.

plot <- function(a, b) {
  {
    year<-a
    data2<-filter(b, year==a)
    c<-ggplot(data=data2, aes(x=employpercent, y=children))+geom_point(color="#F3A8EF")+ ylim(0,8) + ggtitle("Fertility Versus Employment Percentage for", year) + labs(x="Employment Percentage of Women Ages 15-24", y="Number of Children")+ theme_minimal()
  }
}
plot(1990, data)
plot(2020, data)






