#Exercise 1. Vector lengths
# Instructions
#Define a variable male that contains the male heights.
#Define a variable female that contains the female heights.
#Report the length of each variable.
library(dslabs)
data(heights)
male <- heights$height[heights$sex=="Male"]
female <- heights$height[heights$sex=="Female"]
length(male)
length(female)
# Ans 812
# Ans 238






#Exercise 2. Percentiles
#Create two five row vectors showing the 10th, 30th, 50th, 70th, and 90th percentiles for the heights of each sex called these vectors female_percentiles and male_percentiles.
#Then create a data frame called df with these two vectors as columns. The column names should be female and male and should appear in that order. As an example consider that if you want a data frame to have column names names and grades, in that order, you do it like this:
 # df <- data.frame(names = c("Jose", "Mary"), grades = c("B", "A"))
#Take a look at the df by printing it. This will provide some information on how male and female heights differ.
library(dslabs)
data(heights)
male <- heights$height[heights$sex=="Male"]
female <- heights$height[heights$sex=="Female"]

female_percentiles <- quantile(female, seq(0.1, 0.9, 0.2))
male_percentiles <- quantile(male, seq(0.1, 0.9, 0.2))

df <- data.frame(female = female_percentiles, male = male_percentiles)
df
# Ans
female     male
10% 61.00000 65.00000
30% 63.00000 68.00000
50% 64.98031 69.00000
70% 66.46417 71.00000
90% 69.00000 73.22751







#Exercise 3. Interpreting Boxplots - 1
#Study the boxplots summarizing the distributions of populations sizes by country.

#Which continent has the country with the largest population size?
# Ans Asia








#Exercise 4. Interpreting Boxplots - 2
#Study the boxplots summarizing the distributions of populations sizes by country.

#Which continent has the largest median population?
# Ans Africa





#Exercise 5. Interpreting Boxplots - 3
#Again, look at the boxplots summarizing the distributions of populations sizes by country. To the nearest million, what is the median population size for Africa?
# Ans 10 million





# Exercise 6. Low quantiles
#Examine the following boxplots and report approximately what proportion of countries in Europe have populations below 14 million:
# Ans 0.75






#Exercise 7. Interquantile Range (IQR)
#Using the boxplot as guidance, which continent shown below has the largest interquartile range for log(population)?
# Ans Americans
