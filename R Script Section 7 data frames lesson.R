#-------------R Data frames--------------
#1. Vectors
#2. Matrices
#3. Lists
#4. Data frames

#vectors and matrices can only store elements of a single type.
#based on coercion rules in R, we are unable to include both
#strings and numbers together at the same time

#Lists in R also have a cumbersome structure

#data frames is like an excel framesheet
#They look like atrices but are actually lists

#------------creating a data frame in R-----------
#1. vectors with the same length
#2. data.frame function

title = "happy"
year = "2015"
length = "1 hr 30 mins"

my.data = data.frame(title, year, length)
my.data

#naming your data frame
#1.
names(my.data) = c("Movie title", "Release year", "Length of movie")
my.data
#2.
my.data = data.frame("Movie title" = title, 
                     "Release year" = year, 
                     "Length of movie" = length)
my.data

#naming rows
#data.frame(..., row.names =)
str(my.data)

#if don't want R to store character variables as factors:
#set data.frame(..., stringsAsFactors = FALSE rather than TRUE)
my.data = data.frame("Movie title" = title, 
                     "Release year" = year, 
                     "Length of movie" = length,
                     stringsAsFactors = FALSE)
str(my.data)

#----------EXERCISE 16----------
age = c(53,19,34,41,84,140,109)
size = c("medium", "small", "medium", "large", "small", "small", "large")
weight = c(21,8,4,6,7,2,36)
#breed = c(rep("dog", 2), rep("cat", 2), "dog", "cat", "dog" )
breed <- c("dog", "dog", "cat", "cat", "dog", "cat", "dog")
pet.details = data.frame("Months old" = age, 
                         size, weight, "Breed" = breed,
                         stringsAsFactors = FALSE, 
                         row.names = c("Flipper", "Bromley",
                                      "Nox", "Orion",
                                      "Dagger", "Zizi",
                                      "Carrie"))
pet.details
levels(pet.details[, "Breed"]) <- c("dog", "cat")
str(pet.details)

size.and.weight = pet.details[,2:3]
size.and.weight

#-------TIDYVERSE--------
install.packages("tidyverse")
#ggplot2 - data visualisation
#dplyr - data manipulation
#tidyr - tidy your data
#readr - importing data into R
#Tibble - Re-imaging of data.frame() (more tidy)
#purrr - functional programming

#The downloaded binary packages are in
#C:\Users\raikerd\AppData\Local\Temp\RtmpCiyT8H\downloaded_packages


#--------------------------------DATA IMPORT IN R----------------------------------
#import text, .csv, excel
#we use the read.table function
#read.table("file.name", sep = , header = , stringsAsFactors = )
#reads a file in table format and creates a data frame from it

my.pok <- read.table("pokRdex-comma.csv",
                     sep = ',',
                     header = TRUE,
                     stringsAsFactors = FALSE)
my.pok

#read.csv function already have headers set to TRUE and sep set to ','
my.pok <- read.csv("pokRdex-comma.csv",
                     stringsAsFactors = FALSE)
my.pok

#values in a text data file can be separated by tabs
#shortcut to loading tab delimited files:
?read.delim

#read.csv2 read.delim2 #these functions reads csv files with a 
#semi-colon separator for EU notations

?read.csv
my.pok <- read.csv("pokRdex-comma.csv",
                   stringsAsFactors = FALSE,
                   nrows = 70)
my.pok

#-----------EXPORTING DATA IN R-------------
#to save to an excel worksheet:
write.csv(data, file = , row.names =) 
#to save into a tab delimited text document:
write.table(data, file = , row.names = )

#----------example to export our code---------------
age = c(53,19,34,41,84,140,109)
size = c("medium", "small", "medium", "large", "small", "small", "large")
weight = c(21,8,4,6,7,2,36)
#breed = c(rep("dog", 2), rep("cat", 2), "dog", "cat", "dog" )
breed <- c("dog", "dog", "cat", "cat", "dog", "cat", "dog")
pet.details = data.frame("Months old" = age, 
                         size, weight, "Breed" = breed,
                         stringsAsFactors = FALSE, 
                         row.names = c("Flipper", "Bromley",
                                       "Nox", "Orion",
                                       "Dagger", "Zizi",
                                       "Carrie"))
pet.details

write.csv(pet.details, file = "Pet_details.csv", row.names = FALSE)
#if row.names = TRUE, R will mark the table from 1....100..n

#------------------EXERCISE 17-----------------
employee.data = read.csv("employee-data.csv",
                         stringsAsFactors = FALSE, 
                         skip = 23,
                         nrows = 200,
                         col.names = c("Employee number", 
                                       "First name", "Last name", 
                                       "Birth date", "Gender", "Job title", 
                                       "Salary", "From date", "To date"))
employee.data
write.csv(employee.data, file = "employee_data200.csv", 
          row.names = FALSE)

#-------------------------------teacher's answers---------------------------------
# importing data into r

employee.data <- read.csv("C:/Users/pc/data/employee_data.csv", 
                          skip = 23, nrow = 200, stringsAsFactors = FALSE)

# skip = 23 tells R to skip the first 23 rows of the data set when reading the data
# nrow = 200 tells R to only read the first 200 observations

names(employee.data) <- c("Employee number", "First name", 
                          "Last name", "Birth date", "Gender", 
                          "Job title", "Salary", "From date", "To date")

# exporting data as a CSV
write.csv(employee.data, file = "employee_exercise.csv", row.names = FALSE)

#getting a sense of your data frame
#nrow, ncol, colnames, rownames, str, summary

my.pok <- read.csv("pokRdex-comma.csv",
                   stringsAsFactors = FALSE)
nrow(my.pok)
ncol(my.pok)

colnames(my.pok)
rownames(my.pok) #not very useful

str(my.pok)
summary(my.pok)


#---------------subsetting data frames---------------
library(tidyverse)
starwars
my.wars = as.data.frame(starwars)
my.wars = my.wars[ , -(11:13)]
my.wars

head() #shows top 6 of data
tail() #shows bottom 6 of data

head(my.wars)
tail(my.wars)

#referencing a column
head(my.wars[ , 1])
head(my.wars[["name"]])
head(my.wars$name)
head(my.wars["name"])

my.wars[c(1:14), c("name", "hair_color", "birth_year")]

#If you have a data structure that is saved as something else other than a 
#data frame but you want to convert it into a data frame so you can use all 
#the traditional functionalities of the structure, which command would you use?

#------------------extending a data frame-----------------
#adding a column:
#3 ways

my.data
rating = c(5)
revenue = c(1)

#dollar sign
my.data$ratingscore = rating
my.data$revenueamount = revenue
my.data

#double brackets
my.data$ratingscore = NULL
my.data$revenueamount = NULL
my.data
my.data[["ratingscore"]] = rating
my.data[["revenueamount"]] = revenue
my.data

#cbind function
my.data = cbind(my.data, revenueamount = revenue, ratingscore = rating)
my.data


#adding a row
#to add a row, you must create a single row data frame
#since vectors can only hold elements of the same type

data()
rezero = data.frame(Movie.title = "re-zero", Release.year = 2016,
                    Length.of.movie = "1 hour", revenueamount = 23,
                    ratingscore = 5)
rbind(my.data, rezero)

#------------------EXERCISE 18-------------------
age = c(53,19,34,41,84,140,109)
size = c("medium", "small", "medium", "large", "small", "small", "large")
weight = c(21,8,4,6,7,2,36)
#breed = c(rep("dog", 2), rep("cat", 2), "dog", "cat", "dog" )
breed <- c("dog", "dog", "cat", "cat", "dog", "cat", "dog")
pet.details = data.frame("Months old" = age, 
                         size, weight, "Breed" = breed,
                         stringsAsFactors = FALSE, 
                         row.names = c("Flipper", "Bromley",
                                       "Nox", "Orion",
                                       "Dagger", "Zizi",
                                       "Carrie"))
pet.details
levels(pet.details[, "Breed"]) <- c("dog", "cat")

#adding "Vaccinated" column
vaccinated = c(rep("Yes", 2), "No", "Yes", rep("No", 2), "Yes")
pet.details$Vaccinated = vaccinated
pet.details
Milo = data.frame(Months.old = 67, size = "small", weight = 7, 
                  Breed = "dog", Vaccinated = "Yes", row.names = "Milo",
                  stringsAsFactors = F)
pet.details
new.pets = pet.details[-8,] 
new.pets
str(new.pets)

diamonds
str(diamonds)

data()
USJudgeRatings
str(USJudgeRatings)
#------------------------------LMAOéd-----------------------------------
#judge = USJudgeRatings[[1:43, ]]
#judge
#sum = c(rep(0, 12))
#avrg.rating = function(average){
#  for(a in judge){
#    for(b in a){
#      for(total in sum){
#        total = total + b
#      }
#    }
#  }
#  print(sum)
#  print(a)
#}
#avrg.rating(USJudgeRatings)
#str(USJudgeRatings)
#----------------------------------------------------------------
#-----------------------ANSWERS--------------------------
class(diamonds)
# alternatively
str(diamonds)
diamonds.df <- as.data.frame(diamonds)
class(diamonds.df)

str(USJudgeRatings)
my.df <- USJudgeRatings
my.df$AVRG <- rowMeans(my.df)
avrg <- my.df["AVRG"]
avrg

#------------------------------------------------------------------------------
#sorting and subsetting a dataset missing lesson
# the data I am using in the tutorial below

title <- c("Star Wars", "The Empire Strikes Back", "Return of the Jedi", 
           "The Phantom Menace", "Attack of the Clones", "Revenge of the Sith", 
           "The Force Awakens")
year <- c(1977, 1980, 1983, 1999, 2002, 2005, 2015)
length.min <- c(121, 124, 133, 133, 142, 140, 135)
box.office.mil <- c(787, 534, 572, 1027, 657, 849, 2059)

my.data <- data.frame(Title = title, 
                      Year = year, 
                      Length = length.min, 
                      Gross = box.office.mil)
my.data

#                     Title Year Length Gross
#1               Star Wars 1977    121   787
#2 The Empire Strikes Back 1980    124   534
#3      Return of the Jedi 1983    133   572
#4      The Phantom Menace 1999    133  1027
#5    Attack of the Clones 2002    142   657
#6     Revenge of the Sith 2005    140   849
#7       The Force Awakens 2015    135  2059


# ---------- ORDERING A DATA FRAME ----------


# create a vector that stores the sorted indexes of the values in a variable 
# with the order() function
# the variable here is the Gross column with the values 
# 787, 534, 572, 1027, 657, 849, 2059
# the indexes of these values are
# 1,    2,    3,    4,    5,    6,    6
# when sorted, the index for the smallest value (in this case, 2) should be first, 
# then the index for the next smallest value should be second (in this case, 3), 
# and so on

sortedBO <- order(my.data$Gross)

# check if the sorting operation did what you expected

sortedBO

#[1] 2 3 5 1 6 4 7


# sort the entire data frame by asking R to return the data frame, ordered 
# according to the sortedBO vector
# to do this, you can use the square brackets [] 

my.data[sortedBO, ]

#                     Title Year Length Gross
#2 The Empire Strikes Back 1980    124   534
#3      Return of the Jedi 1983    133   572
#5    Attack of the Clones 2002    142   657
#1               Star Wars 1977    121   787
#6     Revenge of the Sith 2005    140   849
#4      The Phantom Menace 1999    133  1027
#7       The Force Awakens 2015    135  2059

# notice that the row numbers in the sorted data frame correspond to the 
# index order in the sortedBO vector


# to get the data in DESCDENDING order of  box office success, use a minus when 
# creating the ordered vector

descBO <- order(-my.data$Gross)
my.data[descBO, ]

#                     Title Year Length Gross
#7       The Force Awakens 2015    135  2059
#4      The Phantom Menace 1999    133  1027
#6     Revenge of the Sith 2005    140   849
#1               Star Wars 1977    121   787
#5    Attack of the Clones 2002    142   657
#3      Return of the Jedi 1983    133   572
#2 The Empire Strikes Back 1980    124   534



# ---------- SUBSETTING A DATA FRAME ----------


# generally, requires using the subset() function and a relational operator to 
# define your criterion (>,<,==, >=, <=, !=)
# to subset the my.data data frame so it only shows movies that grossed over $700 
# million at the box office,
# use the subset function, pass the data frame as the first argument, then 
# define the criterion according to which you are subsetting; 
# in this case, we want to subset according the Gross variable, and we want to 
# see only observations that are larger than 700; so, the condition will be 
# Gross > 700

subset(my.data, Gross > 700)

#                 Title Year Length Gross
# 1           Star Wars 1977    121   787
# 4  The Phantom Menace 1999    133  1027
# 6 Revenge of the Sith 2005    140   849
# 7   The Force Awakens 2015    135  2059
#---------------------------------------------------------------------------------

#--------------------------Dealing with missing data in R-------------------------------
eg.na = c(NA, 1:10)
eg.na
mean(eg.na)
mean(eg.na, na.rm = TRUE) #to omit any NA values

is.na() #returns a table of Boolean values indicating where the NAs are
is.na(my.wars)

any(is.na()) #if the data is too large, you can just use this to check if the data set
#even has any missing values or not
any(is.na(my.wars))
#or check individual columns
any(is.na(my.wars$name))
is.na(my.wars[ , c("homeworld", "species")])

my.wars$species[is.na(my.wars$species)] = "Unknown"
subset(my.wars, species == "Unknown") #***Subset function not taught go self learn

my.wars$species
my.wars
is.na(my.wars$species)
  
?subset     
