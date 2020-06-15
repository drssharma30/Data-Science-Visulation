#Exercise 1. Blood pressure 1
#Instructions
#Filter the NHANES dataset so that only 20-29 year old females are included and assign this new data frame to the object tab.
#Use the pipe to apply the function filter, with the appropriate logicals, to NHANES.
#Remember that this age group is coded with 20-29, which includes a space. You can use head to explore the NHANES table to construct the correct call to filter.
library(dplyr)
library(NHANES)
data(NHANES)
tab <- NHANES %>% filter(AgeDecade == " 20-29" & Gender == "female")
head(tab)





#Exercise 2. Blood pressure 2
#Instructions
#Now we will compute the average and standard deviation for the subgroup we defined in the previous exercise (20-29 year old females), which we will use reference for what is typical.

#You will determine the average and standard deviation of systolic blood pressure, which are stored in the BPSysAve variable in the NHANES dataset.
#Complete the line of code to save the average and standard deviation of systolic blood pressure as average and standard_deviation to a variable called ref.
#Use the summarize function after filtering for 20-29 year old females and connect the results using the pipe %>%. When doing this remember there are NAs in the data!
library(dplyr)
library(NHANES)
data(NHANES)
ref <- NHANES %>%
  filter(AgeDecade == " 20-29" & Gender == "female") %>%
  summarize(average = mean(BPSysAve, na.rm = TRUE), 
            standard_deviation = sd(BPSysAve, na.rm = TRUE))
ref
A tibble: 1 x 2
average standard_deviation
<dbl>              <dbl>
  1    108.               10.1






#Exercise 3. Summarizing averages
#Now we will repeat the exercise and generate only the average blood pressure for 20-29 year old females. For this exercise, you should review how to use the place holder . in dplyr or the pull function.
#Modify the line of sample code to assign the average to a numeric variable called ref_avg using the . or pull.
library(dplyr)
library(NHANES)
data(NHANES)
## modify the code we wrote for previous exercise.
ref_avg <- NHANES %>%
  filter(AgeDecade == " 20-29" & Gender == "female") %>%
  summarize(average = mean(BPSysAve, na.rm = TRUE), 
            standard_deviation = sd(BPSysAve, na.rm=TRUE))%>% .$average





#Exercise 4. Min and max
#Let's continue practicing by calculating two other data summaries: the minimum and the maximum.

#Again we will do it for the BPSysAve variable and the group of 20-29 year old females.
#Report the min and max values for the same group as in the previous exercises.
#Use filter and summarize connected by the pipe %>% again. The functions min and max can be used to get the values you want.
#Within summarize, save the min and max of systolic blood pressure as minbp and maxbp.
library(dplyr)
library(NHANES)
data(NHANES)
## complete the line
NHANES %>%
  filter(AgeDecade == " 20-29"  & Gender == "female") %>%
  summarise(minbp=min(BPSysAve,na.rm=TRUE),maxbp=max(BPSysAve,na.rm=TRUE))
# A tibble: 1 x 2
minbp maxbp
<int> <int>
  1    84   179




#Exercise 5. group_by
#Now let's practice using the group_by function.

#What we are about to do is a very common operation in data science: you will split a data table into groups and then compute summary statistics for each group.

#We will compute the average and standard deviation of systolic blood pressure for females for each age group separately. Remember that the age groups are contained in AgeDecade.
#Use the functions filter, group_by, summarize, and the pipe %>% to compute the average and standard deviation of systolic blood pressure for females for each age group separately.
#Within summarize, save the average and standard deviation of systolic blood pressure (BPSysAve) as average and standard_deviation.
#Note: ignore warnings about implicit NAs. This warning will not prevent your code from running or being graded correctly.
library(dplyr)
library(NHANES)
data(NHANES)
##complete the line with group_by and summarize
NHANES %>%
  filter(Gender == "female") %>% group_by(AgeDecade)%>% 
  summarise(average= mean(BPSysAve, na.rm=TRUE), standard_deviation=sd(BPSysAve,na.rm=TRUE))

# A tibble: 9 x 3
AgeDecade average standard_deviation
<fct>       <dbl>              <dbl>
  1 " 0-9"       100.               9.07
2 " 10-19"     104.               9.46
3 " 20-29"     108.              10.1 
4 " 30-39"     111.              12.3 
5 " 40-49"     115.              14.5 
6 " 50-59"     122.              16.2 
7 " 60-69"     127.              17.1 
8 " 70+"       134.              19.8 
9  <NA>        142.              22.9






#Exercise 6. group_by example 2
#Now let's practice using group_by some more. We are going to repeat the previous exercise of calculating the average and standard deviation of systolic blood pressure, but for males instead of females.

#This time we will not provide much sample code. You are on your own!
#Calculate the average and standard deviation of systolic blood pressure for males for each age group separately using the same methods as in the previous exercise.

#Note: ignore warnings about implicit NAs. This warning will not prevent your code from running or being graded correctly.
library(dplyr)
library(NHANES)
data(NHANES)
NHANES%>% filter(Gender=="male")%>% group_by(AgeDecade)%>% summarise(average=mean(BPSysAve,na.rm=TRUE), standard_deviation=sd(BPSysAve,na.rm=TRUE))
# A tibble: 9 x 3
AgeDecade average standard_deviation
<fct>       <dbl>              <dbl>
  1 " 0-9"       97.4               8.32
2 " 10-19"    110.               11.2 
3 " 20-29"    118.               11.3 
4 " 30-39"    119.               12.3 
5 " 40-49"    121.               14.0 
6 " 50-59"    126.               17.8 
7 " 60-69"    127.               17.5 
8 " 70+"      130.               18.7 
9  <NA>       136.               23.5






#Exercise 7. group_by example 3
#We can actually combine both of these summaries into a single line of code. This is because group_by permits us to group by more than one variable.

#We can use group_by(AgeDecade, Gender) to group by both age decades and gender.
#Create a single summary table for the average and standard deviation of systolic blood pressure using group_by(AgeDecade, Gender).
#Note that we no longer have to filter!
 # Your code within summarize should remain the same as in the previous exercises.
#Note: ignore warnings about implicit NAs. This warning will not prevent your code from running or being graded correctly.
library(NHANES)
data(NHANES)
NHANES%>% group_by(AgeDecade,Gender)%>% summarise(average=mean(BPSysAve,na.rm=TRUE),standard_deviation=sd(BPSysAve,na.rm=TRUE))
# A tibble: 18 x 4
# Groups:   AgeDecade [9]
AgeDecade Gender average standard_deviation
<fct>     <fct>    <dbl>              <dbl>
  1 " 0-9"    female   100.                9.07
2 " 0-9"    male      97.4               8.32
3 " 10-19"  female   104.                9.46
4 " 10-19"  male     110.               11.2 
5 " 20-29"  female   108.               10.1 
6 " 20-29"  male     118.               11.3 
7 " 30-39"  female   111.               12.3 
8 " 30-39"  male     119.               12.3 
9 " 40-49"  female   115.               14.5 
10 " 40-49"  male     121.               14.0 
11 " 50-59"  female   122.               16.2 
12 " 50-59"  male     126.               17.8 
13 " 60-69"  female   127.               17.1 
14 " 60-69"  male     127.               17.5 
15 " 70+"    female   134.               19.8 
16 " 70+"    male     130.               18.7 
17  <NA>     female   142.               22.9 
18  <NA>     male     136.               23.5





#Exercise 8. Arrange
#Now we are going to explore differences in systolic blood pressure across races, as reported in the Race1 variable.

#We will learn to use the arrange function to order the outcome acording to one variable.

#Note that this function can be used to order any table by a given outcome. Here is an example that arranges by systolic blood pressure.
#NHANES %>% arrange(BPSysAve)

#If we want it in descending order we can use the desc function like this:
  
 # NHANES %>% arrange(desc(BPSysAve))
#In this example, we will compare systolic blood pressure across values of the Race1 variable for males between the ages of 40-49.
#Compute the average and standard deviation for each value of Race1 for males in the age decade 40-49.
#Order the resulting table from lowest to highest average systolic blood pressure.
#Use the functions filter, group_by, summarize, arrange, and the pipe %>% to do this in one line of code.
#Within summarize, save the average and standard deviation of systolic blood pressure as average and standard_deviation.
library(dplyr)
library(NHANES)
data(NHANES)
NHANES %>%
  filter(Gender == "male" & AgeDecade==" 40-49") %>%
  group_by(Race1) %>%
  summarize(average = mean(BPSysAve, na.rm = TRUE), 
            standard_deviation = sd(BPSysAve, na.rm=TRUE)) %>%
  arrange(average)
library(dplyr)
library(NHANES)
data(NHANES)
NHANES %>%
  filter(Gender == "male" & AgeDecade==" 40-49") %>%
  group_by(Race1) %>%
  summarize(average = mean(BPSysAve, na.rm = TRUE), 
            standard_deviation = sd(BPSysAve, na.rm=TRUE)) %>%
  arrange(average)





