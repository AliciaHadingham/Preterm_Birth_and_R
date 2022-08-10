
# Tutorial 3 - Analysing data & statistical tests in R                                     



############################################################################################
##                                                                                        ##
##                                 Basic R set up                                         ##
##                                                                                        ##
############################################################################################

# Set the working directory (i.e. select the file path for the folder where your data is) 
setwd("C:/Users/alici/OneDrive - King's College London/Public_Engagement/The Brilliant Club/Github_content/data") #PC

# Confirm we are in the right working directory
getwd()




############################################################################################
##                                                                                        ##
##                              Loading data into R                                       ##
##                                                                                        ##
############################################################################################

# Importing data illustration
x <- 6
data_frame_name <- read.csv("filename.csv") #this line will come up with an error as this file doesn't exist
data_frame_name <- read.csv("folder/subfolder/filename.csv") #this line will come up with an error as this file doesn't exist


# Now we need to import the data which we will analyse into R. There are two methods which we can use: 

# 1. Importing the file from your current working directory (i.e. you need to use setwd to navigate to the working directory/folder where data1_spreadsheet.csv is for this to work)
data1 <- read.csv("data1_spreadsheet.csv") 

# 2. You can import data1 directly from the internet. This is the EASIER WAY!!
data1 <- read.csv(url("https://raw.githubusercontent.com/AliciaHadingham/Preterm_Birth_and_R/main/data/data1_spreadsheet.csv"))




############################################################################################
##                                                                                        ##
##                              Examining our data                                        ##
##                                                                                        ##
############################################################################################

# How can we open data1 in a tab? 
# (This will look similar to viewing data in Excel, Google Sheets, etc.)
View(data1) # Note: use a capital V in View!

# How can we get some basic summary statistics of each column in data1?
summary(data1)

# What are the dimension of data1?
dim(data1) 

# What is the structure of data1? 
# (Dimensions and the data types of each column)
str(data1)

# How can we make a summary table of counts of women that go in each category? 
# (Here we are looking at women that had early or normal births across the locations in data1)
table(data1$Birth)
table(data1$Birth, data1$Location)





############################################################################################
##                                                                                        ##
##                                   Data types                                           ##
##                                                                                        ##
############################################################################################

# Changing characters to factors
data1$Birth <- factor(data1$Birth)

# Changing characters to factors & ordering the categories/factors in a specific order
data1$Location <- factor(data1$Location, levels = c("London", "Surrey", "Essex", "Kent")) # Here the first level of the factor will be "London", so it will be used as the reference when making comparisons by Location


# Looking at impact of changing data types on the earlier commands
str(data1) #Now the columns we changed are factors instead of characters/strings
summary(data1) #Now we have counts of women in each category in the columns Location and Birth
table(data1$Location, data1$Birth) #The locations are now in order we chose for them to be in




############################################################################################
##                                                                                        ##
##                                 Statistical Tests                                      ##
##                                                                                        ##
############################################################################################

# Independent t-test to test for an association between age and birth outcome
t.test(data1$Age ~ data1$Birth, var.equal=T)
?t.test # remember we can put a ? in front of a command to find information about it

# ANOVA to test for an association between pregnancy length and diet
ANOVA_results <- aov(Weeks_at_birth ~ Diet, data=data1)
summary(ANOVA_results)

# The post-hoc Tukey test on the ANOVA results
TukeyHSD(ANOVA_results, "Diet")





