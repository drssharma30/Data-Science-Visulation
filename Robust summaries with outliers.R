#Exercise 1. Exploring the Galton Dataset - Average and Median
#Instructions
#Compute the average and median of these data. Note: do not assign them to a variable.
library(HistData)
> data(Galton)
> x <- Galton$child
> mean(x)
[1] 68.08847
> median(x)
[1] 68.2





#Exercise 2. Exploring the Galton Dataset - SD and MAD
#Instructions
#Compute the standard deviation and the median absolute deviation of these data.
library(HistData)
> data(Galton)
> x <- Galton$child
> sd(x)
[1] 2.517941
> mad(x)
[1] 2.9652





#Exercise 3. Error impact on average
#Instructions
#Report how many inches the average grows after this mistake. Specifically, report the difference between the average of the data with the mistake x_with_error and the data without the mistake x.
library(HistData)
> data(Galton)
> x <- Galton$child
> x_with_error <- x
> x_with_error[1] <- x_with_error[1]*10
> mean(x_with_error)-mean(x)
[1] 0.5983836




#Exercise 4. Error impact on SD
#Instructions
#Report how many inches the SD grows after this mistake. Specifically, report the difference between the SD of the data with the mistake x_with_error and the data without the mistake x.
x_with_error <- x
> x_with_error[1] <- x_with_error[1]*10
> sd(x_with_error)-sd(x)
[1] 15.6746






#Exercise 5. Error impact on median
#Report how many inches the median grows after the mistake. Specifically, report the difference between the median of the data with the mistake x_with_error and the data without the mistake x.
> x_with_error <- x
> x_with_error[1] <- x_with_error[1]*10
> median(x_with_error)-median(x)
[1] 0





#Exercise 6. Error impact on MAD
#Instructions
#Report how many inches the MAD grows after the mistake. Specifically, report the difference between the MAD of the data with the mistake x_with_error and the data without the mistake x.
x_with_error <- x
> x_with_error[1] <- x_with_error[1]*10
> mad(x_with_error)-mad(x)
[1] 0





#Exercise 7. Usefulness of EDA
#How could you use exploratory data analysis to detect that an error was made?
#A boxplot, histogram, or qq-plot would reveal a clear outlier.




#Exercise 8. Using EDA to explore changes
#Instructions
#Write a function called error_avg that takes a value k and returns the average of the vector x after the first entry changed to k. Show the results for k=10000 and k=-10000.
> x <- Galton$child
> 
  > error_avg <- function(k){
    x[1] <- k
    mean(x)
  }
> 
  > error_avg(10000)
[1] 78.79784
> error_avg(-10000)
[1] 57.24612




