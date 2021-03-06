#Exercise 1. ggplot2 basics
#Instructions
#What is the class of the object p?
library(dplyr)
> library(ggplot2)
> library(dslabs)
> data(heights)
> data(murders)
> p <- ggplot(murders)
> class(p)
[1] "gg"     "ggplot"





#Exercise 2. Printing
#Print the object p defined in exercise one

#p <- ggplot(murders)
#and describe what you see.
print(p)
# Ans A blank slate plot





#Exercise 3. Pipes
#Instructions
#Using the pipe %>%, create an object p associated with the heights dataset instead of with the murders dataset as in previous exercises.
#data(heights)
> # define ggplot object called p like in the previous exercise but using a pipe
  > p<- heights%>% ggplot()





#Exercise 4. Layers
#Now we are going to add layers and the corresponding aesthetic mappings. For the murders data, we plotted total murders versus population sizes in the videos.

#Explore the murders data frame to remind yourself of the names for the two variables (total murders and population size) we want to plot and select the correct answer.
total and population





#Exercise 5. geom_point 1
#Instructions
#Fill out the sample code with the correct variable names to plot total murders versus population size.
## Fill in the blanks
> murders %>% ggplot(aes(x =population , y = total )) +
  geom_point()



#Exercise 6. geom_point 2
#Remake the plot but flip the axes so that total is on the x-axis and population is on the y-axis.
murders%>% ggplot(aes(total, population))+geom_point()




#Exercise 7. geom_point text
#If instead of points we want to add text, we can use the geom_text() or geom_label() geometries. However, note that the following code

#murders %>% ggplot(aes(population, total)) +
 # geom_label()
#will give us the error message: Error: geom_label requires the following missing aesthetics: label

#Why is this?
# Ans We need to map a character to each point through the label argument in aes




#Exercise 8. geom_point text
#Instructions
#Rewrite the code from the previous exercise to:

#add a label aesthetic to aes equal to the state abbreviation
#use geom_label instead of geom_point
library(dplyr)
library(ggplot2)
library(dslabs)
data(murders)
## edit the next line to add the label
murders %>% ggplot(aes(population, total, label=abb)) +
  geom_point()+ geom_label()




#Exercise 9. geom_point colors
#Now let's change the color of the labels to blue. How can we do this?
# Ans By using the color argument in geom_label because we want all colors to be blue so we do not need to map colors




#Exercise 10. geom_point colors 2
# Instructions
#Rewrite the code above to make the labels blue by adding an argument to geom_label.
#You do not need to put the color argument inside of an aes col.
#Note that the grader expects you to use the argument color instead of col; these are equivalent.
murders %>% ggplot(aes(population, total,label= abb)) +
  geom_label(color= "blue")




#Exercise 11. geom_labels by region
#Now suppose we want to use color to represent the different regions. So the states from the West will be one color, states from the Northeast another, and so on. In this case, which of the following is most appropriate:
# Ans Mapping the colors through the color argument of aes because each label needs a different color





#Exercise 12. geom_label colors
#Rewrite the code above to make the label color correspond to the state's region. Because this is a mapping, you will have to do this through the aes function. Use the existing aes function inside of the ggplot function.
## edit this code
> murders %>% ggplot(aes(population, total, label = abb,color= region)) +
  geom_label()




#Exercise 13. Log-scale
# Instructions
#Change both axes to be in the log scale on a single graph. Make sure you do not redefine p - just add the appropriate layers.
p <- murders %>% ggplot(aes(population, total, label = abb, color = region)) + geom_label()
## add layers to p here
p+ scale_x_log10()+ scale_y_log10()





#Exercise 14. Titles
#Instructions
#Edit the code above to add the title "Gun murder data" to the plot.
p <- murders %>% ggplot(aes(population, total, label = abb, color = region)) +
  geom_label()
# add a layer to add title to the next line
p + scale_x_log10() + 
  scale_y_log10()+ ggtitle("Gun murder data")





#Exercise 15. Histograms
#We are going to shift our focus from the murders dataset to explore the heights dataset.

#We use the geom_histogram function to make a histogram of the heights in the heights data frame. When reading the documentation for this function we see that it requires just one mapping, the values to be used for the histogram.

#What is the variable containing the heights in inches in the heights data frame?
# Ans height






#Exercise 16. A second example
#Instructions
#Create a ggplot object called p using the pipe to assign the heights data to a ggplot object.
#Assign height to the x values through the aes function.
# define p here
p <- heights%>% ggplot(aes(x= height))



#Exercise 17. Histograms 2
#Instructions
#Add a layer to the object p (created in the previous exercise) using the geom_histogram function to make the histogram.
p <- heights %>% 
  ggplot(aes(height))
## add a layer to p
p+ geom_histogram()





#Exercise 18. Histogram binwidth
#Instructions
#Use the binwidth argument to change the histogram made in the previous exercise to use bins of size 1 inch.
p <- heights %>% 
  ggplot(aes(height))
## add the geom_histogram layer but with the requested argument
p+ geom_histogram(binwidth=1)






#Exercise 19. Smooth density plot
#Instructions
#Add the appropriate layer to create a smooth density plot of heights.
## add the correct layer using +
heights %>% 
  ggplot(aes(height))+ geom_density()





#Exercise 20. Two smooth density plots
#Instructions
#Create separate smooth density plots for males and females by defining group by sex. Use the existing aes function inside of the ggplot function.
## add the group argument then a layer with +
heights %>% 
  ggplot(aes(height, group= sex))+geom_density()






#Exercise 21. Two smooth density plots 2
# Instructions
#We can also assign groups through the color or fill argument. For example, if you type color = sex ggplot knows you want a different color for each sex. So two densities must be drawn. You can therefore skip the group = sex mapping. Using color has the added benefit that it uses color to distinguish the groups.
## edit the next line to use color instead of group then add a density layer
heights %>% 
  ggplot(aes(height, color = sex)) + geom_density()






#Exercise 22. Two smooth density plots 3
# Instructions
#We can also assign groups using the fill argument. When using the geom_density geometry, color creates a colored line for the smooth density plot while fill colors in the area under the curve.
#However, here the second density is drawn over the other. We can change this by using something called alpha blending.
heights %>% 
  ggplot(aes(height, fill = sex)) + 
  geom_density(alpha=0.2)



