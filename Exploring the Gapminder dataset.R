#Exercise 1. Life expectancy vs fertility - part 1
#nstructions

#Using ggplot and the points layer, create a scatter plot of life expectancy versus fertility for the African continent in 2012.
#Remember that you can use the R console to explore the gapminder dataset to figure out the names of the columns in the dataframe.
#In this exercise we provide parts of code to get you going. You need to fill out what is missing. But note that going forward, in the next exercises, you will be required to write most of the code.

library(dplyr)
library(ggplot2)
library(dslabs)
data(gapminder)
## fill out the missing parts in filter and aes
gapminder %>% filter( year== 2012 & continent== "Africa") %>%
  ggplot(aes(fertility ,life_expectancy )) +
  geom_point()




#Exercise 2. Life expectancy vs fertility - part 2 - coloring your plot
#Instructions
#Remake the plot from the previous exercises but this time use color to distinguish the different regions of Africa to see if this explains the clusters. Remember that you can explore the gapminder data to see how the regions of Africa are labeled in the data frame!
  
 # Use color rather than col inside your ggplot call - while these two forms are equivalent in R, the grader specifically looks for color.

library(dplyr)
library(ggplot2)
library(dslabs)
data(gapminder)
gapminder %>% filter(year==2012 & continent=="Africa")%>% ggplot(aes(fertility, life_expectancy, color= region))+ geom_point()



#Exercise 3. Life expectancy vs fertility - part 3 - selecting country and region
#Create a table showing the country and region for the African countries (use select) that in 2012 had fertility rates of 3 or less and life expectancies of at least 70.
#Assign your result to a data frame called df.

library(dplyr)
library(dslabs)
data(gapminder)
df <- gapminder %>% 
  filter(continent=="Africa" & year == 2012 & fertility <=3 & life_expectancy>=70) %>%
  select(country, region)



#Exercise 4. Life expectancy and the Vietnam War - part 1
#Use filter to create a table with data for the years from 1960 to 2010 in Vietnam and the United States.
#Save the table in an object called tab.

library(dplyr)
library(dslabs)
data(gapminder)
tab<- gapminder%>% filter(year %in% seq(1960,2010)& country %in% c("Vietnam","United States"))




#Exercise 5. Life expectancy and the Vietnam War - part 2
#Instructions
#Use geom_line to plot life expectancy vs year for Vietnam and the United States and save the plot as p. The data table is stored in tab.
#Use color to distinguish the two countries.
#Print the object p.

p <- # code for your plot goes here - the data table is stored as `tab`
  p<- tab %>% ggplot(aes(year, life_expectancy, color= country))+geom_line()



   


#Exercise 6. Life expectancy in Cambodia
#Cambodia was also involved in this conflict and, after the war, Pol Pot and his communist Khmer Rouge took control and ruled Cambodia from 1975 to 1979. He is considered one of the most brutal dictators in history. Do the data support this claim?
  
 # Instructions

#Use a single line of code to create a time series plot from 1960 to 2010 of life expectancy vs year for Cambodia.

library(dplyr)
library(ggplot2)
library(dslabs)
data(gapminder)
gapminder%>% filter(year %in% seq(1960, 2010)& country=="Cambodia")%>% ggplot(aes(year,life_expectancy))+geom_line()







#Exercise 7. Dollars per day - part 1
#Now we are going to calculate and plot dollars per day for African countries in 2010 using GDP data.

#In the first part of this analysis, we will create the dollars per day variable.
library(dplyr)
library(dslabs)
data(gapminder)
daydollars <- # write your code here
  daydollars<- gapminder%>% mutate(dollors_per_day= gdp/population/365)%>% filter(continent=="Africa" & year==2010 & !is.na(dollors_per_day))





#Exercise 8. Dollars per day - part 2
#Now we are going to calculate and plot dollars per day for African countries in 2010 using GDP data.
#In the second part of this analysis, we will plot the smooth density plot using a log (base 2) x axis.

# your code here
daydollars%>% ggplot(aes(dollars_per_day))+geom_density()+scale_x_continuous(trans="log2")





#Exercise 9. Dollars per day - part 3 - multiple density plots
#Now we are going to combine the plotting tools we have used in the past two exercises to create density plots for multiple years.

library(dplyr)
library(ggplot2)
library(dslabs)
data(gapminder)
gapminder %>% 
  mutate(dollars_per_day = gdp/population/365) %>%
  filter(continent == "Africa" & year %in% c(1970,2010) & !is.na(dollars_per_day)) %>%
  ggplot(aes(dollars_per_day)) + 
  geom_density() + 
  scale_x_continuous(trans = "log2") + 
  facet_grid(year ~ .)






#Exercise 10. Dollars per day - part 4 - stacked density plot

#Now we are going to edit the code from Exercise 9 to show a stacked density plot of each region in Africa.
library(dplyr)
library(ggplot2)
library(dslabs)
data(gapminder)

gapminder %>% 
  mutate(dollars_per_day = gdp/population/365) %>%
  filter(continent == "Africa" & year %in% c(1970,2010) & !is.na(dollars_per_day)) %>%  
  ggplot(aes(dollars_per_day, fill = region)) + 
  geom_density(bw=0.5, position = "stack") + 
  scale_x_continuous(trans = "log2") + 
  facet_grid(year ~ .)





#Exercise 11. Infant mortality scatter plot - part 1
#We are going to continue looking at patterns in the gapminder dataset by plotting infant mortality rates versus dollars per day for African countries.
library(dplyr)
library(ggplot2)
library(dslabs)
data(gapminder)
gapminder_Africa_2010 <- gapminder%>% mutate(dollars_per_day=gdp/population/365)%>% filter(year==2010 & continent=="Africa"& !is.na(dollars_per_day))

# now make the scatter plot
gapminder_Africa_2010%>% ggplot(aes(dollars_per_day,infant_mortality,color =region))+geom_point()





#Exercise 12. Infant mortality scatter plot - part 2 - logarithmic axis
#Now we are going to transform the x axis of the plot from the previous exercise.
gapminder_Africa_2010 %>% ggplot(aes(dollars_per_day,infant_mortality,color=region))+geom_point()+scale_x_continuous(trans="l)





#Exercise 13. Infant mortality scatter plot - part 3 - adding labels
#In this exercise, we will remake the plot from Exercise 12 with country names instead of points so we can identify which countries are which.
gapminder_Africa_2010 %>% 
  ggplot(aes(dollars_per_day, infant_mortality, color = region, label = country)) +
  geom_text() + 
  scale_x_continuous(trans = "log2")
  
  
  
  
  
#Exercise 14. Infant mortality scatter plot - part 4 - comparison of scatter plots
#Now we are going to look at changes in the infant mortality and dollars per day patterns African countries between 1970 and 2010.

library(dplyr)
library(ggplot2)
library(dslabs)
data(gapminder)
gapminder %>% 
  mutate(dollars_per_day = gdp/population/365) %>%
  filter(continent == "Africa" & year %in% c(1970, 2010) & !is.na(dollars_per_day) & !is.na(infant_mortality)) %>%
  ggplot(aes(dollars_per_day, infant_mortality, color = region, label = country)) +
  geom_text() + 
  scale_x_continuous(trans = "log2") +
  facet_grid(year~.)
  
  
  



  
  
  
  
  