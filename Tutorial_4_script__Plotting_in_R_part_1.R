
# Tutorial 4 - Plotting in R part 1                                     



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
data1 <- read.csv("data1_spreadsheet.csv") 

# 2. You can import data1 directly from the internet. This is the EASIER WAY!!
data1 <- read.csv(url("https://raw.githubusercontent.com/AliciaHadingham/Preterm_Birth_and_R/main/data/data1_spreadsheet.csv"))

# Changing the automatically chosen "character" data types to factors
str(data1)
data1$Birth <- factor(data1$Birth)
data1$Diet <- factor(data1$Diet)
data1$ID <- factor(data1$ID)
data1$Location <- factor(data1$Location, levels = c("London", "Surrey", "Essex", "Kent"))
str(data1)

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

# Scatter plot with colours by Location
ggplot(data=data1, aes(x=BMI, y=Age)) +
  geom_point(aes(colour=Location))

# Scatter plot with colours by Location and shapes by Birth:
ggplot(data=data1, aes(x=BMI, y=Age)) +
  geom_point(aes(colour=Location, shape=Birth))








############################################################################################
##                                                                                        ##
##             Extra: Boxplots with points jittered to avoid overlapping points           ##
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




############################################################################################
##                                                                                        ##
##                      Extra: Manually choosing colours in plots                         ##
##                                                                                        ##
############################################################################################ 

# You can choose one of the set colours here http://sape.inf.usi.ch/quick-reference/ggplot2/colour
# Or you can pick any colour you want using the colour codes here https://htmlcolorcodes.com/ which all start with a # symbol


# Boxplot with colours by Birth timing  - colours manually selected
ggplot(data = data1, aes(x = Birth, y = Age)) +
  geom_boxplot(aes(colour = Birth)) +
  scale_colour_manual(values = c("magenta", "blue"))

# Boxplot with a scatter plot on top (with colours by Birth) - colours manually selected
ggplot(data = data1, aes(x = Birth, y = Age)) +
  geom_boxplot()  +
  geom_point(aes(colour = Birth)) +
  scale_colour_manual(values = c("pink", "lightgreen"))

# Scatter plot with colours by Location - colours manually selected
ggplot(data = data1, aes(x = BMI, y = Age)) +
  geom_point(aes(colour = Location)) +
  scale_colour_manual(values = c("red", "cyan", "purple", "green"))

# Scatter plot with colours by Location - colours manually selected 
# You can pick colours here: https://htmlcolorcodes.com/
ggplot(data = data1, aes(x = BMI, y = Age)) +
  geom_point(aes(colour = Location)) +
  scale_colour_manual(values = c("#3AD1FF", "#D8B8FF", "#4D9489", "#F63D88")) 





############################################################################################
##                                                                                        ##
##                        Extra: Including a line of best fit                             ##
##                                                                                        ##
############################################################################################ 

# Website with examples of using a line of best fit: https://ggplot2.tidyverse.org/reference/geom_smooth.html

# Line of best fit - using the default "loess" method
ggplot(data=data1, aes(x=BMI, y=Age)) +
  geom_point() +
  geom_smooth()

# Line of best fit - using the "lm" method
ggplot(data=data1, aes(x=BMI, y=Age)) +
  geom_point() +
  geom_smooth(method="lm")

# Line of best fit - using the "glm" method
ggplot(data=data1, aes(x=BMI, y=Age)) +
  geom_point() +
  geom_smooth(method="glm")

# Line of best fit - using the default "loess" method with no confidence interval shading
ggplot(data=data1, aes(x=BMI, y=Age)) +
  geom_point() +
  geom_smooth(se=FALSE)


# Information on the line of best fit options
?geom_smooth
?loess  # loess = Local Polynomial Regression Fitting
?lm     # lm = Fitting Linear Models
?glm    # glm = Fitting Generalized Linear Models







