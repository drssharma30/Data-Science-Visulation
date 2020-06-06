# Exercise 1. Variables names
# Instructions
#Let's start by reviewing how to extract the variable names from a dataset using the names function. What are the two variable names used in the heights dataset?
library(dslabs)
data(heights)
names(heights)



# Exercise 2.Variable Types
# Instructions:
# What data type is the sex variable?
library(dslabs)
data("heights")
head(heights)
# categorical



# Exercise 3. Numerical  values:
# Instructions:
# Use the unique and length functions to determine how many unique heights were reported.
library(dslabs)
data(heights)
x <- heights$height
length(unique(x))
139



# Exercise 4. Tables
# Instructions
# Use the table function to compute the frequencies of each unique height value. Because we are using the resulting frequency table in a later exercise we want you to save the results into an object and call it tab.
library(dslabs)
data(heights)
x <- heights$height
tab<- table(x)
tab




# Exercise 5. Indicator variables
# Instructions
# In the previous exercise we computed the variable tab which reports the number of times each unique value appears. For values reported only once tab will be 1. Use logicals and the function sum to count the number of times this happens.
library(dslabs)
data(heights)
tab <- table(heights$height)
sum<-sum(tab==1)
sum






