#Exercise 1: Customizing plots - watch and learn
#To make the plot on the right in the exercise from the last set of assessments, we had to reorder the levels of the states' variables.

library(dplyr)
library(ggplot2)
library(dslabs)
dat <- us_contagious_diseases %>%
  filter(year == 1967 & disease=="Measles" & !is.na(population)) %>% mutate(rate = count / population * 10000 * 52 / weeks_reporting)
state <- dat$state 
rate <- dat$count/(dat$population/10000)*(52/dat$weeks_reporting)
levels(reorder(state,rate))




#Exercise 2: Customizing plots - redefining
#Now we are going to customize this plot a little more by creating a rate variable and reordering by that variable instead.

library(dplyr)
library(ggplot2)
library(dslabs)
dat <- us_contagious_diseases %>% filter(year == 1967 & disease=="Measles" & count>0 & !is.na(population)) %>%
  mutate(rate = count / population * 10000 * 52 / weeks_reporting) %>%
  mutate(state = reorder(state, rate))
dat %>% ggplot(aes(state, rate)) +
  geom_bar(stat="identity") +
  coord_flip()






#Exercise 3: Showing the data and customizing plots
#Say we are interested in comparing gun homicide rates across regions of the US. We see this plot:
  
  library(dplyr)
library(ggplot2)
library(dslabs)
data("murders")
murders %>% mutate(rate = total/population*100000) %>%
  group_by(region) %>%
  summarize(avg = mean(rate)) %>%
  mutate(region = factor(region)) %>%
  ggplot(aes(region, avg)) +
  geom_bar(stat="identity") +
  ylab("Murder Rate Average")
#and decide to move to a state in the western region. What is the main problem with this interpretaion?
#It does not show all the data. We do not see the variability within a region and it's possible that the safest states are not in the West.





#Exercise 4: Making a box plot
#To further investigate whether moving to the western region is a wise decision, let's make a box plot of murder rates by region, showing all points.

murders %>% mutate(rate = total/population*100000) %>%
  mutate(region=reorder(region, rate, FUN=median)) %>%
  ggplot(aes(region, rate)) +
  geom_boxplot() +
  geom_point()