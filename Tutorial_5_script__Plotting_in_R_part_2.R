############################################################################################
##                                                                                        ##
##                                 Basic R set up                                         ##
##                                                                                        ##
############################################################################################

# Set the working directory
setwd("/Users/aliciahadingham/OneDrive - King's College London/PhD/FYI_or_Other/Public_Engagement/The Brilliant Club/Github_content") #Mac
#getwd()

# Load data2
data2 <- read.csv("data/data2_spreadsheet.csv", header=TRUE) 

#Change data types
str(data2)
data2$ID <- as.factor(data2$ID)
data2$Birth <- as.factor(data2$Birth)
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



