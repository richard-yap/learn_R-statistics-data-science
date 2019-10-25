> vector.x = 10:20
> vector.y = vector.x + 2
> vector.z = vector.y * 3
> answer = (vector.z - 6) / 3
> print(answer)
[1] 10 11 12 13 14 15 16 17 18 19 20
> 
> #or
> 
> answer.in.one.line = (1/3)*(3*(10:20 + 2)-6)
> print(answer.in.one.line)
[1] 10 11 12 13 14 15 16 17 18 19 20
    > 
> is.vector(vector.x)
[1] TRUE
> is.vector(answer)
[1] TRUE
> 
> int <- c(5, 6, 7, 8)
> int <- c(5L, 6L, 7L, 8L)
> typeof(int)
[1] "integer"
> ls()
    character(0)
char = ("R for life bro")

>6 types of vectors in R
> Integers, Doubles, Characters, Logicals
> Complex, raw


cards <- c("Blue-Eyes White Dragon, Exodius, The Winged Dragon of Ra, Raigeki, Slifer the Sky Dragon, Obelisk the Tormentor, Black Luster Soldier, 5-Headed Dragon, Exodia the Forbidden One, Dragon Master Knight")

atk <- c(3000, NA, NA, NA, NA, 4000, 3000, 5000, 1000, 5000)
typeof(atk)

#remember the coercion rule 
1) in R where if a vector has even a single string element, 
all other elements will be converted to strings as well 
no matter what type they are.

2) in R if a vector has only logical and numeric elements,
all logicals will be converted to elements.
True/T -> 1, False/F -> 0

monster <- c(T, T, T, F, T, T, T, T, T, T)

round(2, 4723)
mean(1:10)
round(mean(1:10))

lvl <- c(8, 10, 10, 1, 10, 10, 8, 12, 1, 12)
sum(lvl)
mean(lvl)
median(lvl)
length(lvl)
sd.lvl <- sd(lvl)
rounding.off.sd.lvl <- round(sd.lvl)

print(rounding.off.sd.lvl)

#Arguments

3 to know the argument name -> args(round)
round(2.9763, digits = 3)
round(2.9763, 3)

# ---------- BUILDING A FUNCTION ------------

deck <- c("Duke", "Assasin", "Captain", "Ambassador", "Contessa")
print(deck)

sample(deck, size = 3)
hand <- sample(deck, size = 3, replace = T)
print(hand)

#to create a function:
function.name <- function(){body.of.code}

draw <- function(){
  deck <- c("Duke", "Assasin", "Captain", "Ambassador", "Contessa")
  hand <- sample(deck, size = 3, replace = T)
  print(hand)
}  
#to call on the function, you'll also need to put
#parentheses after the variable you want to call
draw() #to run the code with the function


# -------- EXERCISE 6 -----------
coin <- c("heads", "tails")
args(sample)

unfair.coin.toss <- function(){
  coin <- c("heads", "tails")
  toss <- sample(coin, size = 100, replace = TRUE, prob = c(0.3, 0.7))
  return(toss)
}

unfair.coin()
