#Exercise 1. Proportions
#What proportion of the data is between 69 and 72 inches (taller than 69 but shorter or equal to 72)? A proportion is between 0 and 1.
#Use the mean function in your code. Remember that you can use mean to compute the proportion of entries of a logical vector that are TRUE.
library(dslabs)
data(heights)
x <- heights$height[heights$sex == "Male"]
mean(x>69& x<=72)
# Ans 0.3337438





#Exercise 2. Averages and Standard Deviations
#Instructions
# Use the normal approximation to estimate the proportion the proportion of the data that is between 69 and 72 inches.
#Note that you can't use x in your code, only avg and stdev. Also note that R has a function that may prove very helpful here - check out the pnorm function (and remember that you can get help by using ?pnorm).
library(dslabs)
data(heights)
x <- heights$height[heights$sex=="Male"]
avg <- mean(x)
stdev <- sd(x)
pnorm(72, avg, stdev) - pnorm(69, avg, stdev)
# Ans 0.3061779





#Exercise 3. Approximations
# Instructions
# Use normal approximation to estimate the proportion of heights between 79 and 81 inches and save it in an object called approx.
# Report how many times bigger the actual proportion is compared to the approximation.
library(dslabs)
data(heights)
x <- heights$height[heights$sex == "Male"]
exact <- mean(x > 79 & x <= 81)
avg<- mean(x)
stdev<- sqrt(sum((x-avg)^2)/length(x))
approx<- pnorm(81,avg,stdev )- pnorm(79,avg,stdev)
exact/approx
# Ans 1.621602




#Exercise 4. Seven footers and the NBA
#Instruction
#Using the normal approximation, estimate the proportion of adult men that are taller than 7 feet, referred to as seven footers. Remember that 1 foot equals 12 inches.
#Use the pnorm function. Note that pnorm finds the proportion less than or equal to a given value, but you are asked to find the proportion greater than that value.
#Print out your estimate; don't store it in an object.
# use pnorm to calculate the proportion over 7 feet (7*12 inches)
1- pnorm(84,69,3)
# Ans 2.866516e-07




# Exercise 5. Estimating the number seven footers
# Instructions
# Use your answer to the previous exercise to estimate the proportion of men that are seven feet tall or taller in the world and store that value as p.
#Then multiply this value by 1 billion (10^9) round the number of 18-40 year old men who are seven feet tall or taller to the nearest integer with round. (Do not store this value in an object.)
p<- 1- pnorm(84,69,3)
round(p* 10^9)
# Ans 287





# Exercise 6. How many seven footers are in the NBA?
#Instructions
#Use your answer to exercise 4 to estimate the proportion of men that are seven feet tall or taller in the world and store that value as p.
#Use your answer to the previous exercise (exercise 5) to round the number of 18-40 year old men who are seven feet tall or taller to the nearest integer and store that value as N.
#Then calculate the proportion of the world's 18 to 40 year old seven footers that are in the NBA. (Do not store this value in an object.)
p <- 1-pnorm(84,69,3)
N<- round(p*10^9)
10/N
# Ans 0.03484321





#Exercise 7. Lebron James' height
#Instructions
#Repeat the calculations performed in the previous question for Lebron James' height: 6 feet 8 inches. There are about 150 players, instead of 10, that are at least that tall in the NBA.
## Change the solution to previous answer
p <- 1 - pnorm(80, 69, 3)
N <- round(p * 10^9)
150/N
#Ans 0.001220842








