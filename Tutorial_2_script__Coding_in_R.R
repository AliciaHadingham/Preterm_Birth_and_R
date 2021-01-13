
# Tutorial 2 - Coding in R                                     




############################################################################################
##                                                                                        ##
##                              Common notation in R                                      ##
##                                                                                        ##
############################################################################################

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




############################################################################################
##                                                                                        ##
##                                 Basic R set up                                         ##
##                                                                                        ##
############################################################################################

# Set the working directory (the folder you want to work in)
setwd("/Users/your_username/folder/subfolder")

# Examples for setting the working directory on Mac and PC:
setwd("/Users/aliciahadingham/OneDrive - King's College London/PhD") #Mac example 
setwd("/Users/alici/OneDrive - King's College London/PhD") #PC example

# Print the current working directory to the console
getwd()

#List files in your current working directory
list.files()

# Install a R library/package
install.packages("ggplot2")

# Load a library which has already been installed
library(ggplot2)




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




