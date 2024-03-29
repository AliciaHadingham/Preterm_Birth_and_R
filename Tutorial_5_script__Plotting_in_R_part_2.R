
# Tutorial 5 - Plotting in R part 2                                    



############################################################################################
##                                                                                        ##
##                                   Setting up                                           ##
##                                                                                        ##
############################################################################################

# Set the working directory (i.e. select the file path for the folder where your data is) 
setwd("C:/Users/alici/OneDrive - King's College London/Public_Engagement/The Brilliant Club/Github_content/data")
getwd()


# Now we need to import the data which we will analyse into R. There are two methods which we can use: 

# 1. Importing the file from your current working directory (i.e. you need to use setwd to navigate to the working directory/folder where data1_spreadsheet.csv is for this to work)
data2 <- read.csv("data2_spreadsheet.csv") 

# 2. You can import data1 directly from the internet. This is the EASIER WAY!!
data2 <- read.csv("https://raw.githubusercontent.com/AliciaHadingham/Preterm_Birth_and_R/main/data/data2_spreadsheet.csv")


# Changing the automatically chosen "character" data types to factors
str(data2)
data2$ID <- factor(data2$ID)
data2$Birth <- factor(data2$Birth)
str(data2)

# Load ggplot2 library 
library(ggplot2)




############################################################################################
##                                                                                        ##
##                                  Line graphs                                           ##
##                                                                                        ##
############################################################################################

# Simple line graph
ggplot(data=data2, aes(x=Weeks, y=fFN, group=ID)) +
  geom_line()

# Line graph with individual points plotted
ggplot(data=data2, aes(x=Weeks, y=fFN, group=ID)) +
  geom_line() +
  geom_point()

# Line graph with colours by ID
ggplot(data=data2, aes(x=Weeks, y=fFN, group=ID)) +
  geom_line(aes(colour=ID)) +
  geom_point(aes(colour=ID))

# Line graph with colours by ID and shape by Birth
ggplot(data=data2, aes(x=Weeks, y=fFN, group=ID)) +
  geom_line(aes(colour=ID)) +
  geom_point(aes(colour=ID, shape=Birth))




############################################################################################
##                                                                                        ##
##                  Extra: Advanced editing of ggplot aesthetics                          ##
##                                                                                        ##
############################################################################################

# Line graph with line type by Birth:
ggplot(data=data2, aes(x=Weeks, y=fFN, group=ID)) +
  geom_line(aes(colour=ID, linetype=Birth))

# Line graph faceted by Birth:
ggplot(data=data2, aes(x=Weeks, y=fFN, group=ID)) +
  geom_line(aes(colour=ID)) +
  facet_grid(~Birth)

# Line graph with labelled axis and title:
ggplot(data=data2, aes(x=Weeks, y=fFN, group=ID)) +
  geom_line(aes(colour=ID, linetype=Birth)) +
  geom_point(aes(colour=ID, shape=Birth)) +
  labs(x="Duration of pregnancy (weeks)", 
       y="Fetal fibronectin (ng/mL)",
       title="Fetal fibronectin across pregnancy in four women")





