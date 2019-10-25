#-------------------data visualization ggplot2 package--------------------
#building graphings
#just like english grammar, there also is a grammar of graphics
#determiner, adjective, noun, verb, preposition, adverb, conjuction, pronoun

#------------------GRAMMAR OF GRAPHICS, the seven layers----------------------
#these first three are essential to a graph
#1. data (data you are plotting)
#2. aesthetics (what u map on the x and y axis)
#3. geometries (how yr data is represented visually)

#facets (breaking up a plot into subplots based on a discrete variable)
#stats (the statistical manipulation)
#coordinates (where your data to be plotted)
#themes (the design)
#-----------------------------------------------------------------------------

library(tidyverse)

#data
hdi = read.csv("hdi-cpi.csv", stringsAsFactors = FALSE)
hdi = as_tibble(hdi)
hdi

sc = ggplot(hdi)
sc

#aesthetics
sc = ggplot(hdi, aes(CPI.2015, HDI.2015))
sc

#geometries
sc + geom_point()

#facets (splitting by region)
sc + geom_point() + facet_grid(Region ~.)

#statistics layer
sc + geom_point(aes(color = Region), size = 3) + facet_grid(Region ~.) +
  stat_smooth()

#coordinates layer (zooming in or out, specifying the dimensions of the graph)
sc + geom_point(aes(color = Region), size = 3) + facet_grid(Region ~.) +
  stat_smooth() + coord_cartesian((xlim = c(0.75, 1)))

#theme layer
sc + geom_point(aes(color = Region), size = 3) +
  stat_smooth() + theme_minimal()
#-------------------------------------------------------------------------

#---------------------------Histogram-------------------------- 
#if you have a continuous variable

library(tidyverse)

df = read.csv("titanic.csv", stringsAsFactors = F)
df = as_tibble(df)

df$Survived = as.factor(df$Survived)
df$Pclass = as.factor(df$Pclass)
df$Sex = as.factor(df$Sex)
df$Embarked = as.factor(df$Embarked)
df

#How age is distributed in the ship
hist = ggplot(data = df, aes(x = Age))
hist + geom_histogram(binwidth = 5) #(0-5, 5-10, etc)

#bins = the histogram bars
#alpha represents the level of transparency 1 is 
#completely solid, 0 is see-through
hist = ggplot(data = df, aes(x = Age))
hist + geom_histogram(binwidth = 5, color = "darkslategray",
                      fill = "darkslategray4", alpha = 0.5) +
  ggtitle("Age Distribution on the Titanic") + #title of graph
  labs(y = "Number of Passengers", x = "Age") + 
  #change the x, y axis labels
  theme_minimal()

#--------------EXERCISE 21-----------------
employee.data = read.csv("employee-data.csv",
                         stringsAsFactors = FALSE, 
                         skip = 23,
                         nrows = 200,
                         col.names = c("Employee number", 
                                       "First name", "Last name", 
                                       "Birth date", "Gender", "Job title", 
                                       "Salary", "From date", "To date"))
employee.data$Gender <- as.factor(employee.data$Gender)
employee.data$Job.title <- as.factor(employee.data$Job.title)
employee.data = as_tibble(employee.data)

employee.ex <- employee.data %>% 
  filter(Salary > 45000)

install.packages("ggthemes")
library(ggthemes)

hist.employee.ex = ggplot(data = employee.ex, aes(Salary))
hist.employee.ex + geom_histogram(binwidth = 5000, color = "darkslategray",
                                  fill = "darkseagreen2", alpha = 0.7) +
  ggtitle("Title distribution in the employee data") + 
  labs(y = "Number of employees in the salary bracket", x = "Salary") + 
  theme_solarized_2(light = FALSE, base_size = 15, base_family = "serif")

#-------------------------ANSWER---------------------------
library(tidyverse)
install.packages("ggthemes")
library(ggthemes)

emp <- read.csv("employee-data.csv", skip = 23, stringsAsFactors = FALSE)
emp <- as_tibble(emp)
emp$gender <- as.factor(emp$gender)
emp$title <- as.factor(emp$title)

emp.a <- filter(emp, salary > 45000)

hist <- ggplot(emp.a, aes(salary))
hist + geom_histogram(binwidth = 5000, color = "darkslategray",
                      fill = "darkseagreen2", alpha = 0.7) +
  labs(title = "Salary distribution in the employee data",
       x = "Salary", y = "Number of employees in the salary bracket") +
  theme_solarized_2(light = FALSE, base_size = 15, base_family = "serif")

#-----------------------bar chart-----------------------------

library(tidyverse)

df = read.csv("titanic.csv", stringsAsFactors = F)
df = as_tibble(df)

df$Survived = as.factor(df$Survived)
df$Pclass = as.factor(df$Pclass)
df$Sex = as.factor(df$Sex)
df$Embarked = as.factor(df$Embarked)
df

bar = ggplot(df, aes(x = Sex, fill = Survived))
bar + geom_bar() + theme_light() +
  labs(y = "Passenger Count", 
       x = "Gender",
       title = "Survival Rate on the Titanic by Gender")

#---------------------------------------------------------
bar + geom_bar() + theme_light() +
  labs(y = "Passenger Count", 
       x = "Gender",
       title = "Survival Rate on the Titanic by Gender") +
  facet_wrap(Sex ~ Pclass) # "~" means "by"
#facet_grid() function suits better when working with 2 discrete variables
#or try facet_wrap( ~ Pclass)

#---------------------------EXERCISE 22------------------------------
employee.data = read.csv("employee-data.csv",
                         stringsAsFactors = FALSE, 
                         skip = 23,
                         nrows = 200,
                         col.names = c("Employee number", 
                                       "First name", "Last name", 
                                       "Birth date", "Gender", "Job title", 
                                       "Salary", "From date", "To date"))
employee.data$Gender <- as.factor(employee.data$Gender)
employee.data$Job.title <- as.factor(employee.data$Job.title)
employee.data = as_tibble(employee.data)

bar_employees = ggplot(employee.data, aes(x = Job.title, fill = Gender))
bar_employees + geom_bar() + theme_light() +
  labs(y = "Employee count", 
       x = "Job position",
       title = "Job positions by gender") +
  facet_wrap(Job.title ~ Gender)

#----------------------SOLUTION------------------------------
library(tidyverse)
library(ggthemes)

bar_employees <- ggplot(emp, aes(title, fill = gender))
bar_employees + geom_bar() + theme_fivethirtyeight() + scale_fill_manual(values = c("chartreuse4", "darkorange")) +
  labs(title = "Job Positions by Gender",
       y = "Employee count",
       x = "Job position")

bar <- ggplot(emp, aes(gender, fill = title)) 
bar + geom_bar() + theme_fivethirtyeight() + 
  scale_fill_manual(values = c("magenta", "darkorange", "midnightblue", 
                               "springgreen4", "brown1", "gold")) +
  labs(title = "Job Positions by Gender")

#------------------------box plots----------------------
#a way of grouping grouped numerical data in terms of quartiles
library(tidyverse)

my.box = ggplot(df, aes(x = Survived, y = Age))
my.box + geom_boxplot(outlier.colour = "red", outlier.shape = 4 ) +
  #to specify the outliers as crosses
  geom_jitter(width = 0.3, aes(color = Sex)) +
  labs(title = "Survival Rate on the Titanic based on Age and Gender") +
  theme_light() +
  #to make the box plot vertical
  coord_flip()
#use geom_jitter() function to overlay the observations
#inherit.aes = FALSE prohibits the given layer from inheriting aesthetics

#-------------------------------EXERCISE 23-----------------------------------
employee.data = read.csv("employee-data.csv", skip =23,
                         stringsAsFactors = FALSE)
employee.data$gender <- as.factor(employee.data$gender)
employee.data$title <- as.factor(employee.data$title)
employee.data = as_tibble(employee.data)

my.employee.box = ggplot(employee.data, aes(x = title, y = salary))

employee.boxx = my.employee.box + 
  geom_boxplot(outlier.colour = "orangered1", outlier.shape = 3) +
  geom_jitter(width = 0.3, aes(color = gender)) +
  ggtitle("Salary distribution", subtitle = "based on position and gender") +
  ylab("Salary") + xlab("Job position") + 
  theme_economist_white() +
  theme(legend.position = "right", axis.text.x = element_text(angle = 90, hjust = 1)) +
  coord_flip()

employee.boxx + scale_color_brewer(palette="Set1")

#Lookup the wesanderson package. 
#Lookup the RColorBrewer package. 
#Lookup the scale_color_manual() function, 
#and the scale_color_brewer() function. 
#Set a palette for your graph to make it look great.

#---------------------------------SOLUTION------------------------------------
library(tidyverse)
library(ggthemes)
install.packages("wesanderson")
library(wesanderson)

emp <- read.csv("employee-data.csv", skip = 23, stringsAsFactors = FALSE)
emp <- as.tibble(emp)
emp$gender <- as.factor(emp$gender)
emp$title <- as.factor(emp$title)

emp.a <- filter(emp, salary > 45000)

boxx <- ggplot(emp, aes(x = title, y = salary))
my.bp <- boxx + geom_boxplot(outlier.color = "orangered1", outlier.shape = 3) +
  geom_jitter(width = 0.3, aes(color = gender)) +
  ggtitle("Salary distribution", subtitle = "based on position and gender") +
  ylab("Salary") + xlab("Job position") + 
  theme_economist_white() + 
  theme(legend.position = "right", axis.text.x = element_text(angle = 90, hjust = 1)) +
  coord_flip() # this can be added if the axis.text.x doesn't make sense to you; it's also easier to read

my.bp + scale_color_manual(values=wes_palette(name = "Darjeeling", n = 2))

# or

my.bp + scale_color_brewer(palette="Set1")

# the palette is part of the RColorBrewer package which you should already have on your
# machines because it comes with the tidyverse

#---------------------------Building a scatterplot------------------------

library(tidyverse)

#data
hdi = read.csv("hdi-cpi.csv", stringsAsFactors = FALSE)
hdi = as_tibble(hdi)
hdi

sp = ggplot(hdi, aes(CPI.2015, HDI.2015))
sp + geom_point(aes(color = Region), shape = 21, 
                fill = "white", size = 3, stroke = 2) +
  stat_smooth(se = FALSE
              #set se to false to remove the shaded area (error)
              ) + 
  theme_minimal() +
  labs(x = "Corruption Perception Index 2015",
       y = "Human Development Index 2015",
       title = "corruption nd Human Development") +
  stat_density2d(#if the data points are over-populated in the canvas
    )
