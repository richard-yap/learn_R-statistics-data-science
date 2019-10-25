#--------- UDEMY R LESSON SECTION 4 VECTORS ---------

#vectors are a sequence of elements that are of the same type
#commonly used types are double, character, logical and integer 

#element-wise execution*
#Everything is carried out element by element
#ensures that variables (or groups of values) are 
#manipulated in an orderly fashion

#Mathematic operations ----> search for R REF CARD on google
#by CRAN

vec <- c(1,2,3)
vic <- c(11,12,13)

#addition 
vec + vic
#substration
vec - vic
#multiplication
vec*vic
#division
vec/vic

mean()
median()
sd()

#summation of all values in an object/variable
sum()
#multiplication of all values in an object/variable
prod()

min()
max()

#R carries out value recycling if the vector is shorter than
#the other vector that you're working with

#Exercise
people <- c("Dr Peter Venkman", "Dr Raymond Stantz", 
            "Dr. Eagon Spengler", "Dana Barrett", 
            "Vigo", "Slimer", "Marshmallow Man"
)
weight <- c(71, 67, 83, 67)
height <- c(1.75, 1.81, 1.78, 1.82, 1.97, 2.12, 2.75)

bmi <- weight/(height*height)
print(bmi)

#Vector attributes ---> Names, Dimensions, classes
#Names
age <- c(23,26,24,26)

attributes(age)
names(age)
#To assign a name to the value:
names(age) <- c("George", "John", "Paul", "Ringo")
age
#To rewrite the names, just rewrite the name code again

#To remove the names from age:
names(age) <- NULL
print(age)

#EXERCISE 8
cards <- c("Blue-Eyes White Dragon", "Exodius", "The Winged Dragon of Ra", 'Raigeki', 'Slifer the Sky Dragon', 'Obelisk the Tormentor', 'Black Luster Soldier', '5-Headed Dragon', 'Exodia the Forbidden One', 'Dragon Master Knight')
typeof(cards)
atk <- c(3000, NA, NA, NA, NA, 4000, 3000, 5000, 1000, 5000)
typeof(atk)

names(atk) <- cards
monster.atk.power <- atk
print(monster.atk.power)

attributes(atk)
names(atk)
names(atk) <- NULL
atk

# You can also add names when creating an object 
#longer method

atk <- c("Blue-Eyes White Dragon" = 3000, "Exodius" = NA, "The Winged Dragon of Ra" = NA,
         "Raigeki" = NA, "Slifer the Sky Dragon" = NA, "Obelisk the Tormentor" = 4000, 
         "Black Luster Soldier" = 3000, "5-Headed Dragon" = 5000, "Exodia the Forbidden One" = 1000, 
         "Dragon Master Knight" = 5000)
atk

#Getting help in R
help(function.name) or ?function.name
?print
?sample
?ls

#If you don't know the name of the function, 
#but know what you want to do:
??sample #type double "?"

#indexing and slicing of vectors:
n.deck <- c(6,7,8,9,10)
deck <- c("Duke", "Assasin", "Captain", "Ambassador", "Contessa") 

deck[4]
deck[-4]
deck[c(1,3,5)]

names(n.deck) <- deck
n.deck[c(1,2,4)]
n.deck[3:5]

lv <- seq(10, 100, by = 10)
lv
lv[-(4:7)]