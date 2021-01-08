############################################################################################
##                                                                                        ##
##                                 Basic R set up                                         ##
##                                                                                        ##
############################################################################################

# Set the working directory
setwd("/Users/aliciahadingham/OneDrive - King's College London/PhD/FYI_or_Other/Public_Engagement/The Brilliant Club/Github_content") #Mac
#getwd()

# Load data1
data1 <- read.csv("data/data1_spreadsheet.csv", header=TRUE) 

# Changing Location from characters to factors & ordering the categories
data1$Location <- factor(data1$Location, levels = c("London", "Surrey", "Essex", "Kent"))

# Load ggplot2 library 
library(ggplot2)




############################################################################################
##                                                                                        ##
##                                     Boxplots                                           ##
##                                                                                        ##
############################################################################################

## Boxplots of Birth vs Age

# Simple boxplot 
ggplot(data=data1, aes(x=Birth, y=Age)) +
  geom_boxplot()

# Boxplot with colours by Birth timing
ggplot(data=data1, aes(x=Birth, y=Age)) +
  geom_boxplot(aes(colour=Birth))

# Boxplot with a scatter plot on top
ggplot(data=data1, aes(x=Birth, y=Age)) +
  geom_boxplot() + 
  geom_point()

# Boxplot with a scatter plot on top (with colours by Birth)
ggplot(data=data1, aes(x=Birth, y=Age)) +
  geom_boxplot() + 
  geom_point(aes(colour=Birth))

# Boxplot with a scatter plot on top (with colours by Location)
ggplot(data=data1, aes(x=Birth, y=Age)) +
  geom_boxplot() + 
  geom_point(aes(colour=Location))




############################################################################################
##                                                                                        ##
##                                   Scatter plots                                        ##
##                                                                                        ##
############################################################################################

## Scatter plots of BMI vs Age

# Simple scatter plot 
ggplot(data=data1, aes(x=BMI, y=Age)) +
  geom_point()

# Scatter plot in a specific colour
ggplot(data=data1, aes(x=BMI, y=Age)) +
  geom_point(colour="purple")

# Scatter plot with colours by Location
ggplot(data=data1, aes(x=BMI, y=Age)) +
  geom_point(aes(colour=Location))

# Scatter plot with colours by Location and shapes by Birth:
ggplot(data=data1, aes(x=BMI, y=Age)) +
  geom_point(aes(colour=Location, shape=Birth))




############################################################################################
##                                                                                        ##
##                       Extra: Boxplots with points jittered                             ##
##                                                                                        ##
############################################################################################ 

# Boxplot with a jitter scatter plot 
ggplot(data=data1, aes(x=Birth, y=Age)) +
  geom_boxplot() + 
  geom_jitter()

# Boxplot with a jitter scatter plot (colours by Birth timing & shapes by Location)
ggplot(data=data1, aes(x=Birth, y=Age)) +
  geom_boxplot() + 
  geom_jitter(aes(colour=Location, shape=Birth))





