############################################################################################
##                                                                                        ##
##                                 Basic R set up                                         ##
##                                                                                        ##
############################################################################################

# Set the working directory (the folder you want to work in)
setwd("/Users/aliciahadingham/OneDrive - King's College London/PhD/FYI_or_Other/Public_Engagement/The Brilliant Club/Github_content") #Mac

#Confirm we are in the right working directory
getwd()




############################################################################################
##                                                                                        ##
##                              Loading data into R                                       ##
##                                                                                        ##
############################################################################################

# Load data (that is in the current working directory):
data_frame_name <- read.csv("filename.csv", header=TRUE)

# Load data (that is not in the current working directory):
data1 <- read.csv("data/data1_spreadsheet.csv", header=TRUE) #read.csv("folder/filename.csv", header=TRUE)




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

# How can we make a summary table of counts of women that go in each category? 
# (In this case we are looking at the number of women that had early or normal births across the locations in data1)
table(data1$Location, data1$Birth)

# What are the dimension of data1?
dim(data1) 

# What is the structure of data1? 
# (Dimensions and the data types of each column)
str(data1)




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



