#------------Relational/comparison operators in R--------------
#for evaluating objects in relation to one another
#==, !=, <, >, <=, >=
  
3 == 3
TRUE * 2

#------------LOGICAL OPERATORS----------------
#and "&"
w = 9
(w < 12) & (w > 6)

#or "|" 
(w > 1) | (w < 12)

#not "!"
#flips the result of a logical test
!TRUE
!(w < 12)

#----------vectors and logical operators--------------
v = c(1, 3, 5, 7)
y = c(1, 2, 3, 4)
3 == v
3 == y
#R checks if 3 is equals to any of the elements in the variable

12 > c(11, 11, 13, 14)
"catch" == c("catch", 22, "is")

"mode" > "mope"

s = c(3,1,2,5)
(s < 4) && (s > 2)

# Explain the difference between | , || , & and &&

# Answer:
# Single operators (|, &) can return a vector

((-2:2) >= 0) & ((-2:2) <= 0)
# FALSE FALSE  TRUE FALSE FALSE

# Double operators (||, &&) return a single value
((-2:2) >= 0) && ((-2:2) <= 0)
# FALSE

#--------------if, else, else if-----------------
#if(A){Z}
#in parentheses, the condition that R should check
#in curly brackets, the code that R must exercute if the condition 
#in the parentheses is met

num = 3
if(num >0){
  print("the number is 3")
}

#if(A){
#  scenario 1
#} else {
#  scenario 2
#}

v = 8
if(v < 0){
  v = v*-1
  print("the number is now positive")
} else{
  print("the number is still negative")
}

#---------EXERCISE IF, ELSE, ELSE IF---------------
input = 80
if((input >= 1) & (input < 60)){
  print("Rotten")
} else if((input >60) & (input < 75)){
  print("Fresh")
} else if((75 <= input)){
  print("Certified fresh!")
} else {
  print("Please input a number between 1 and 100")
}

# What are the components of an if-else statement? Define the syntax.


if(condition_expression){
  statementA
} else {
  statementB
}

args(setdiff)
args(length)
args(runif)
args(rnorm)

# Bonus exercise:

# Imagine the following: Your mother announced yesteday that she's going to win the lottery. She did it with the casual
# nonchalance of a person who's going to the shop to pick up some pasta. Today is the number draw. 
# If she gets 6 numbers correct, she wins the lottery. If she doesn't get 6 numbers correct, she will sit staring 
# at the screen wondering how on earth she did not manage to achive this very simple task.

# Write a statement that will print "Mom wins the lottery!" if the six numbers she guessed matched the lottery numbers,
# and "Mom did not win the lottery." if the numbers do not match.

# Hint: it will be best if you create one object with randomly generated numbers, and another object which you populate
# manually (as if you're playing the lottery), and compare the two. 

# Hint: look into the length() and setdiff() functions 

myinputs <- c(4,5,9,15,18,22)
lottery <- sample(1:49,6,replace=F) 
wrongGuesses <- length(setdiff(lottery, myinputs))

if(wrongGuesses == 0){
  print("Mom won the lottery!")
} else {
  print("Mom did not win the lottery.")
}

#--------------LOOPS---------------
number = c(14, 53, 24, 13, 423)

for(num in number){
  if(num > 20){
    print(num)
  } else if(num == 13){
    print(num)
  }
}

empty.vector = vector(length = 5)
for(i in 1:5){
  empty.vector[i] = number[i]
}
empty.vector

n = 10
sum = 0
for(number in 1:n){
  sum = number + sum
}
print(sum)

#--------------WHILE LOOPS-----------------

?paste

#my solution
n = 10
sum = 0
while(n > 0){
  sum = sum + n
  n = n - 1
}
print(sum)

#teacher's solution
n <- 10
i <- 1
sum <- 0

while(i <= n){
  sum <- sum + i
  i <- i + 1
  print(sum)
}

#-------------building a function 2.0--------------------
draw <- function(){
  deck <- c("Duke", "Assasin", "Captain", "Ambassador", "Contessa")
  hand <- sample(deck, size = 3, replace = T)
  print(hand)
}  

draw <- function(deck){
  hand <- sample(deck, size = 3, replace = T)
  print(hand)
}  

coup = matrix(rep(c("Duke", "Assasin", "Captain", 
                    "Ambassador", "Contessa"), 3), ncol = 1)
coup
deal = function(deck){
  cards = deck[1:3,]
  print(cards)
}
deal(deck = coup)

#-------------shuffling the deck-------------
shuffle = function(deck){
  random = sample(1:15, size = 15)
  deck.s = deck[random, , drop = FALSE]
  print(deck.s)
}
deck.shuffled = shuffle(coup)
#and then deal the cards
deal = function(deck){
  cards = deck[1:3,]
  print(cards)
}
deal(deck = deck.shuffled)

#-------------part 2--------------
#each function creates its own local environment
shuffle = function(deck){
  random = sample(1:15, size = 15)
  deck.s = deck[random, , drop = FALSE]
  return(deck.s)
}

#and then deal the cards
deal = function(deck){
  shuffled = shuffle(deck)
  cards = shuffled[1:3,]
  return(cards)
}

deal(coup)

#-------------EXERCISE Scoping--------------
f <- function(x) {
  f <- function(x) {
    f <- function(x) {
      x ^ 2
    }
    f(x) + 1
  }
  f(x) * 2
}

f(10)

# Answer:
# If a function is defined inside another function, 
#R looks inside the current function for a value, 
# then where that function was defined, and so on, 
#all the way up to the global environment. 
