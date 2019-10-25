#-------------------Data manipulaton using dplyr--------------------
library(tidyverse)

star = starwars
star #stored as a table unless you use as.data.frame*
#it is more useful if you want to see an overview as data frames will print out the entire data
#As a table, it will only print out a few rows

#-------------------------------------------------to see the entire data---------------------------------------------
#to see the entire data, simply use the View() function**
View(star) #this is super important

#----------------------filter function-------------------------
filter(star, species == "Droid")
filter(star, species == "Droid", homeworld == "Tatooine")
filter(star, eye_color == "red" | eye_color == "yellow" | eye_color == "orange")

#----------------------select function-------------------------
#selects single or multiple variables/columns
select(star, name, birth_year, homeworld, species, starships)
select(star, name, homeworld:starships)

#starts_with() and ends_with() functions work with select() 
#function to enable us to subset data in a more intuitive way
select(star, ends_with("color"))

#to move some columns to the left hand side but show everything else:
select(star, name, vehicles, starships, everything()) #everything() function, 
#"name", "vehicles" and "starships" come first

#mutate() function adds a new variable and preserves the rest
star = mutate(star, bmi = mass/((height/100)^2))
select(star, name:bmi)
View(star)

#to only leave the variable you created:
#transmute() function adds a new variable and drops the rest
star.trans = transmute(star, bmi2 = mass/((height/100)^2))
star.trans

#-------------------arrange() function----------------------
arrange(star, mass)
arrange(star, desc(mass)) #desc(descending order)

#-----------------------summarize()----------------------
summarize(star, avg.height = mean(height, na.rm = T))

#---------------------group_by()---------------------
star.species = group_by(star, species)
summarize(star.species, avg.height = mean(height, na.rm = T))

#---------------------------sampling data------------------------------
#ddplyr has its own sample() function
#sample_n #extracts a random fixed number of rows from data
#sample_frac #extracts a random fixed fraction of rows from data

#10 random rows:
sample_n(star, 10)

#10% of data:
sample_frac(star, 0.1, replace = TRUE)

#------------------------------pipe operator in R--------------------------
#applies order in the way R does the operations
#long method:
star.species = group_by(star, species)
star.species
star.smr = summarize(star.species, count = n(), avg.mass = mean(mass, na.rm = T))
filter(star.smr, count > 1)

#pipe method:
star %>%
  group_by(species) %>%
  summarize(count = n(), mass = mean(mass, na.rm = T)) %>%
  filter(count > 1)
  
#----------------------EXERCISE 19-----------------------
#Load the employees data and convert it into a tibble. 
#Then, make the gender and title variables into a factor.
#Hint: the commands are analogous to the as.data.frame() function.
employee.data = read.csv("employee-data.csv",
                         stringsAsFactors = FALSE, 
                         skip = 23,
                         nrows = 200,
                         col.names = c("Employee number", 
                                       "First name", "Last name", 
                                       "Birth date", "Gender", "Job title", 
                                       "Salary", "From date", "To date"))
View(employee.data)

employee.data = as_tibble(employee.data)
employee.data
employee.data$Gender <- as.factor(employee.data$Gender)
employee.data$Job.title <- as.factor(employee.data$Job.title)

#Check if the data has any missing values.
any(is.na(employee.data))
employee.data

#Arrange the dataset by gender, then last name, and make first_name, last_name, 
#and gender the first three variables in the data frame. Show only the 
#employees whose salary is higher than 70,000.
employee.homework = employee.data %>%
  arrange(Gender, Last.name) %>%
  select(First.name, Last.name, Gender, everything()) %>%
  filter(Salary > 70000)
View(employee.homework)
#answer
employee.a <- employee.data %>% 
  select(ends_with("name"), gender, everything()) %>%
  filter(salary >= 70000) %>% 
  arrange(gender, last_name)

#Use the ends_with() function with select.
select(employee.data, ends_with("name"))

#Create a data frame containing only the employee numbers of those earning more 
#than 70,000.
only.above.70000 = data.frame(employee.data %>%
                                filter(Salary > 70000) %>%
                                select(Employee.number, Salary))
only.above.70000

#Find out how much each position (title) earns on average by gender; 
#create a new variable that represents the average monthly figures and arrange your 
#result by gender and average monthly salary, from largest to smallest.
employee.data %>%
  group_by(Job.title, Gender) %>%
  summarize(count = n(), average.salary = mean(Salary, na.rm = T)) %>%
  mutate(monthly = average.salary / 12) %>%
  arrange(Gender, desc(monthly)) %>%
  filter(count > 1)

#-----------------------------------TIDYING DATA---------------------------------
#tidyr package
#4 easy use functions
#gather(), spread(), unite(), separate()

library(tidyverse)

billboard = read.csv("billboard.csv")
billboard = as_tibble(billboard)
billboard

#gather() function
gather(data, col.m:col.n, 
       key = the name of the variable that will hold the values currently
       mascarading as column names,
       value = the name of the new variable that will hold te values previouly
       hold by the fake columns)

billboard %>%
  gather(x1st.week:x76th.week, key = "week", value = "rank", na.rm = T) %>%
  arrange(artist.inverted)

tb = read.csv("tb.csv")
tb = as_tibble(tb)
tb

tb.gathered = tb %>%
  gather(m.014:f.65, key = "column", value = "cases", na.rm = T) %>%
  arrange(country)
tb.gathered

#separate function
tb.separated = tb.gathered %>%
  separate(column, into = c("sex", "age"), sep = )
tb.separated

#unite function
tb.united = tb.separated %>%
  unite(sex, c("sex", "age"))
tb.united

#spread function
weather = read.csv("weather.csv")
weather = as_tibble(weather)
weather

weather.spread = spread(weather, key = element, value = value)
weather.spread

#-------------------------EXERCISE 20 Data tidying with tidyr---------------------
?str_replace()

weather.untidy = read.csv("weather-untidy.csv")
weather.untidy = as_tibble(weather.untidy)
weather.untidy

tb.untidy = read.csv("tb-untidy.csv")
tb.untidy = as_tibble(tb.untidy)
tb.untidy

weather.untidy %>%
  gather(d1:d31, key = "day", value = "value", na.rm = T) %>%
  spread(key = element, value = value)
  
tb.untidy %>%
  gather(m04:fu, key = "column", value = "cases", na.rm = T) %>%
  arrange(country) %>%
  separate(column, into = c("sex" ,"age"), sep = )

#answers
# Tidying the weather data

weather <- read.csv("weather-untidy.csv", stringsAsFactors = FALSE)
weather <- as_tibble(weather)

weather.a <- weather %>% gather(day, value, d1:d31, na.rm = TRUE)

weather.b <- weather.a %>% mutate(day = parse_number(day)) %>%
  select(id, year, month, day, element, value) %>%
  arrange(id, year, month, day)

weather.b
weather.c <- weather.b %>% spread(element, value)
weather.c
# Tidying the tb data

tb <- read.csv("tb-untidy.csv", stringsAsFactors = FALSE)
tb <- as.tibble(tb)

names(tb) <- str_replace(names(tb), "new_sp_", "")
names(tb) <- str_replace(names(tb), "m", "m.")
names(tb) <- str_replace(names(tb), "f", "f.")

tb$m.04 <- NULL
tb$m.514 <- NULL
tb$f.04 <- NULL
tb$f.514 <- NULL
tb$m.u <- NULL 
tb$f.u <- NULL

tb.a <- tb %>% gather(m.014:f.65, key = "column", value = "cases", na.rm = TRUE) %>% arrange(country)
tb.b <- tb.a %>% separate(column, into = c("sex", "age"))

tb.b$age <- str_replace_all(tb.b$age, "0", "0-")
tb.b$age <- str_replace_all(tb.b$age, "15", "15-")
tb.b$age <- str_replace_all(tb.b$age, "25", "25-")
tb.b$age <- str_replace_all(tb.b$age, "35", "35-")
tb.b$age <- str_replace_all(tb.b$age, "45", "45-")
tb.b$age <- str_replace_all(tb.b$age, "55", "55-")
tb.b$age <- str_replace_all(tb.b$age, "65", "65-100")

tb.b
