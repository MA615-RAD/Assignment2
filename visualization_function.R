library(tidyverse)


#Function takes in a year and a tibble as arguments, to make a scatter plot of employment percentage for women aged 15-24 versus fertility rates for a particular year.

plot <- function(a, b) {
  {
    year<-a
    data2<-filter(b, year==a)
    c<-ggplot(data=data2, aes(x=employpercent, y=children))+geom_point(color="#F3A8EF")+ggtitle("Children Versus Employment Percent", year)
    print(c)
  }
}

plot(2020, data)



