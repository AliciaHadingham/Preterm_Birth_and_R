
# Tutorial 3 - Analysing data & statistical tests in R                                     



############################################################################################
##                                                                                        ##
##                                 Basic R set up                                         ##
##                                                                                        ##
############################################################################################

# Set the working directory (the folder you want to work in)
setwd("/Users/aliciahadingham/OneDrive - King's College London/Public_Engagement/The Brilliant Club/Github_content") #Mac
setwd("/Users/alici/OneDrive - King's College London/Public_Engagement/The Brilliant Club/Github_content") #PC

#Confirm we are in the right working directory
getwd()




############################################################################################
##                                                                                        ##
##                              Loading data into R                                       ##
##                                                                                        ##
############################################################################################

# Load data (that is in the current working directory):
data_frame_name <- read.csv("filename.csv")

# Load data (that is not in the current working directory):
data1 <- read.csv("data/data1_spreadsheet.csv") #read.csv("folder/filename.csv")

# As an alternative, you can load in data1 this way if you want (this downloads the csv file directly from the internet)
data1 <- read.csv(url("https://raw.githubusercontent.com/AliciaHadingham/Preterm_Birth_and_R/main/data/data1_spreadsheet.csv"))




############################################################################################
##                                                                                        ##
##                              Examining our data                                        ##
##                                                                                        ##
############################################################################################

# How can we open data1 in a tab? 
# (This will look similar to viewing data in Excel, Google Sheets, etc.)
View(data1)

# How can we get some basic summary statistics of each column in data1?
summary(data1)

# What are the dimension of data1?
dim(data1) 

# What is the structure of data1? 
# (Dimensions and the data types of each column)
str(data1)

# How can we make a summary table of counts of women that go in each category? 
# (Here we are looking at women that had early or normal births across the locations in data1)
table(data1$Location, data1$Birth)
table(data1$Diet, data1$Birth)



############################################################################################
##                                                                                        ##
##                                   Data types                                           ##
##                                                                                        ##
############################################################################################

# Changing characters to factors
data1$Birth <- factor(data1$Birth)

# Changing characters to factors & ordering the categories/factors in a specific order
data1$Location <- factor(data1$Location, levels = c("London", "Surrey", "Essex", "Kent"))


# Looking at impact of changing data types on the earlier commands
summary(data1) #Now we have counts of women in each category in the columns Location and Birth
table(data1$Location, data1$Birth) #The locations are now in order we chose for them to be in




############################################################################################
##                                                                                        ##
##                                 Statistical Tests                                      ##
##                                                                                        ##
############################################################################################

# Independent t-test to test for an association between age and birth outcome
t.test(data1$Age ~ data1$Birth, var.equal=T)


# ANOVA to test for an association between pregnancy length and diet
ANOVA_results <-aov(Weeks_at_birth ~ Diet, data=data1) 
summary(ANOVA_results)

# The post-hoc Tukey test on the ANOVA results
TukeyHSD(ANOVA_results, "Diet")




