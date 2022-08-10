
# Tutorial 2 - Coding in R                                     




############################################################################################
##                                                                                        ##
##                              Common notation in R                                      ##
##                                                                                        ##
############################################################################################

# R as a calculator
3+4 #addition
3-4 #subtraction
3*3 #multiplication
3/4 #division

# Assigning values to the objects x and y
x <- 5
y <- 2

# The output of these commands will print to the console
x+y #addition
x-y #subtraction
x*y #multiplication
x/y #division
x^y #exponential

# This command assigns the output of x+y to z
z <- x+y

# Print the value of z to the console
z 
print(z) # this works too, but it takes longer to type




############################################################################################
##                                                                                        ##
##                                   Setting up R                                         ##
##                                                                                        ##
############################################################################################

# Set the working directory (the folder you want to work in)
setwd("/Users/your_username/folder/subfolder") # Note that if you run this line you will get an error as this directory/folder doesn't exist on your computer

# Examples for setting the working directory on Mac and PC:
setwd("/Users/aliciahadingham/Desktop") # a Mac example 
setwd("C:/Users/alici/Desktop") # a PC example

# Print the current working directory to the console
getwd()

#List files in your current working directory
list.files()

# Install a R library/package for the first time on your computer
install.packages("ggplot2")

# Load a library which has already been installed
library("ggplot2") # library(ggplot2) also works




############################################################################################
##                                                                                        ##
##                                  Getting help                                          ##
##                                                                                        ##
############################################################################################

# How to get help on using specific commands/functions in R:
# * The help panel in RStudio (type in the command in the 'Help' panel)
# * Type ? followed by the command you want help with:
?setwd
?library

# How to get general help on R:
# * Google (search “How to.... in R”)
# * StackOverflow https://stackoverflow.com/questions (You can post questions here or find answers from previous questions)




############################################################################################
##                                                                                        ##
##                              Extra: Using quotations in R                              ##
##                                                                                        ##
############################################################################################ 

# You can use double quotations or single quotations in R 
setwd("/Users/alici/Desktop") #Using double quotations
setwd('/Users/alici/Desktop') #Using single quotations

# But if you use 2 single quotations instead of double quotations you will get an error
setwd(''/Users/alici/Desktop'') #Using 2 single quotations
# Error: unexpected string constant in "setwd(''/Users/alici/Desktop''"



