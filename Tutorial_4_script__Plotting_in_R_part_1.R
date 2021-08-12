
# Tutorial 4 - Plotting in R part 1                                     



############################################################################################
##                                                                                        ##
##                                 Basic R set up                                         ##
##                                                                                        ##
############################################################################################

# Set the working directory
setwd("/Users/aliciahadingham/OneDrive - King's College London/Public_Engagement/The Brilliant Club/Github_content") #Mac
setwd("/Users/alici/OneDrive - King's College London/Public_Engagement/The Brilliant Club/Github_content") #PC
#getwd()

# Load data1
data1 <- read.csv("data/data1_spreadsheet.csv") 

# As an alternative, you can load in data1 this way if you want
data1 <- read.csv(url("https://raw.githubusercontent.com/AliciaHadingham/Preterm_Birth_and_R/main/data/data1_spreadsheet.csv"))

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


# Information on the line of best fit options
?geom_smooth
?loess  # loess = Local Polynomial Regression Fitting
?lm     # lm = Fitting Linear Models
?glm    # glm = Fitting Generalized Linear Models







