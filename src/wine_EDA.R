
#Load the packages
library(tidyverse)

#install.packages("reactable")
library (skimr)

library(corrgram)

library(ggpubr)

library(reactable)


#getwd()

# Reading the dataset 
wine_og <- read_csv("./data/winequality-red.csv")

#needs to get nicer names
head(wine_og,3)

#cleaning the names

wine_clean <- wine_og %>%
  janitor::clean_names()

glimpse(wine_clean)

# First look of the dataset using skim (a very nice package for summary statistics) 
skim(wine_clean)
# all columns are numeric 
# no missing values
# it is not a big dataset

# Find the correlation 
corrgram(wine_claen, order=TRUE,
         upper.panel=panel.cor, main="correlation heat map of wine quality")

#Density plot (univariate)

#quality Distribution 

ggplot(wine_claen,aes(x=quality))+geom_bar(stat = "count",position = "dodge", fill = "Red")+
  scale_x_continuous(breaks = seq(3,8,1))+
  ggtitle("Distribution of Red Wine Quality Ratings")+
  theme_classic()


# ph Distribution

dens_ph <- ggplot(wine_claen)+geom_density(aes(x =p_h), colour='red')
boxplot_ph <- ggplot(wine_claen)+geom_boxplot(aes(x =p_h))

ggarrange(dens_ph,boxplot_ph,  nrow = 2)  



# residual sugar

dens_sugar <- ggplot(wine_claen)+geom_density(aes(x = residual_sugar), colour='red')
boxplot_sugar <- ggplot(wine_claen)+geom_boxplot(aes(x = residual_sugar))

ggarrange(dens_sugar,boxplot_sugar,  nrow = 2) 



#alcohol vs volatile_acidity point plot 

ggplot(wine_claen)+ geom_point(aes(alcohol, volatile_acidity,colour = factor(quality)))

#ggtitle("Distribution of Red Wine Quality Ratings")
















