
# Tutorial 5 - Plotting in R part 2                                    



############################################################################################
##                                                                                        ##
##                                 Basic R set up                                         ##
##                                                                                        ##
############################################################################################

# Set the working directory
#setwd("/Users/aliciahadingham/OneDrive - King's College London/Public_Engagement/The Brilliant Club/Github_content") #Mac
setwd("/Users/alici/OneDrive - King's College London/Public_Engagement/The Brilliant Club/Github_content") #PC
#getwd()

# Load data2
data2 <- read.csv("data/data2_spreadsheet.csv") 

# Load data2 - This is how you can load the data if you have "ï.." symbols in front of ID in the first column
data2 <- read.csv("data/data2_spreadsheet.csv", fileEncoding = "UTF-8-BOM") 

# As an alternative, you can load in data2 this way if you want
data2 <- read.csv(url("https://raw.githubusercontent.com/AliciaHadingham/Preterm_Birth_and_R/main/data/data2_spreadsheet.csv"))

#Change data types
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

#Simple line graph
ggplot(data=data2, aes(x=Weeks, y=fFN, group=ID)) +
  geom_line()

#Line graph with individual points plotted
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





