a <- seq(10, 120, by = 10)
a
dim(a) <- c(3, 4)
a
args(dim)
args(sample)
args(matrix)

cards
atk

mtrx <- matrix(1:12, 3, 5, byrow = T)
mtrx

usa <- c(1.3, 1.5, 1.2, 1.4, 1.5)
de <- c(0.2, 0.4, 0.7, 0.8, 0.8)
usa
de

ngo <- cbind(usa, de)
ngo
ngo.row <- rbind(usa, de)
ngo.row

rownames(ngo) <- c("2013", "2014", "2015", "2016", "2017")
ngo
ngo <- t(ngo)
ngo
ind <- c(2, 2.2, 2.4, 2.5, 2.6)
ngo <- rbind(ngo, ind)
ngo


gdp <- matrix(c(23.9, 492.4, 82.8, 42.3, 24.4, 13.3, 41.4, 134.13, 134.1), 
              nrow = 3, byrow = T, 
              dimnames = list(c("a", "b", "c"), c("numbers", "super", "nice"))
)
gdp
gdp = t(gdp)
gdp
rownames(gdp) = c("1", "2", "3")
gdp
d = c(23, 54, 24)
gdp = cbind(gdp, d)
gdp
f = gdp[NULL, -4]
f

Player <- c(rep("dark", 5), rep("light", 5))
Player
Piece <- c("King", "Queen", "pawn", "pawn", "knight", "bishop",
           "king", "rook", "pawn", "pawn")

chess <- c(Player, Piece)
chess
mtrx.chess <- matrix(chess, nrow = 10, ncol = 2, dimnames = list(NULL, c("Player", "Piece")))
mtrx.chess
mtrx.chess <- t(mtrx.chess)                    
mtrx.chess
Turn <- c(3, 5, 2, 2, 7, 4, 6, 5, 2, 1)
mtrx.chess <- rbind(mtrx.chess, Turn)
mtrx.chess
mtrx.chess[2, 6]
mtrx.chess <- t(mtrx.chess)
mtrx.chess

mtrx.chess[6, -3]
mtrx.chess[ , c(1,2)]
mtrx.chess[1:20]
mtrx.chess[1:5, ]
args(matrix)
mtrx.chess[,-2]
mtrx.chess[2, -2]
mtrx.chess[7, 3] <- 3
mtrx.chess

mtrx.chess[, 2, drop = FALSE]
mtrx.chess[, 2]

budget <- matrix(c(63, 100, 34), nrow = 3, ncol = 2)
budget
num2 <- num[ , 1:2, drop = FALSE]
margin <- num2 - budget 
margin

args(runif)
num <- runif(12, min = 1, max = 100)
num
random.num <- matrix(num, nrow = 3, ncol = 4, 
                     byrow = TRUE,
                     dimnames = list(c("x", "y", "z"),
                                     c("uno", "dos", "tres", "cuatro")))
random.num
random.num.scaled.10 <- random.num * 10
random.num.scaled.10

args(rnorm)
numm <- rnorm(12, 5, 7.5)
numm
random.numm <- matrix(numm, nrow = 3, ncol = 4, 
                      byrow = TRUE)
random.numm
uno <- random.num[, "uno"]
random.num - uno
random.num
random.num %*% t(random.numm) 
random.num * (t(random.numm)) 

#------------------MATRIX OPERATIONS IN R---------------------

matrix.mat <- matrix(c(171.5, 292, 281.6, 460.6, 139.3, 288), nrow = 3, byrow = T, 
                     dimnames = list(c("The Matrix", "Reloaded", "Revolutions"),
                                     c("US", "Worldwide")))
matrix.mat

#Summation of all values in the column/row:
total <- colSums(matrix.mat)
rowSums(matrix.mat)
#Average of all values in column/row:
average <- colMeans(matrix.mat)
rowMeans(matrix.mat)

matrix.mat.prelim <- rbind(matrix.mat, average, total)
matrix.mat.prelim

matrix.mat %*% t(matrix.mat.prelim)

#----------------EXERCISE 14------------------
a <- matrix(rnorm(25, 4, 5.5), nrow = 5, ncol = 5)
b <- matrix(runif(25, 1, 20), nrow = 5, ncol = 5)
a
b
#------------colMean-------------
col.ave.a <- colMeans(a)
dim(col.ave.a) <- c(5, 1)
col.ave.a
col.ave.b <- colMeans(b)
dim(col.ave.b) <- c(5, 1)
col.ave.b
#------------rowMean-------------
row.ave.a <- rowMeans(a)
dim(row.ave.a) <- c(5, 1)
row.ave.a
row.ave.b <- rowMeans(b)
dim(row.ave.b) <- c(5, 1)
row.ave.b
#------------colSum-------------
col.sum.a <- colSums(a)
dim(col.sum.a) <- c(5, 1)
col.sum.a
col.sum.b <- colSums(b)
dim(col.sum.b) <- c(5, 1)
col.sum.b
#------------rowSum-------------
row.sum.a <- rowSums(a)
dim(row.sum.a) <- c(5, 1)
row.sum.a
row.sum.b <- rowSums(b)
dim(row.sum.b) <- c(5, 1)
row.sum.b
#-------------------------
min(a)
max(a)
min(b)
max(b)
#-------------------------
min(a[,3])
max(a[,3])
min(b[,3])
max(b[,3])
#-------------------------
mean(a)
mean(b)
sd(a)
sd(b)

#------------------SOLUTION--------------------

n <- matrix(rnorm(25), nrow = 5, byrow = TRUE)
u <- matrix(runif(25), nrow = 5, byrow = TRUE)

avg.n <- colMeans(n)
avg.u <- colMeans(u)

total.n <- colSums(n)
total.u <- colSums(u)

n.avg.total <- rbind(n, avg.n, total.n)
u.avg.total <- rbind(u, avg.u, total.u)

r.avg.n <- rowMeans(n.avg.total)
r.avg.u <- rowMeans(u.avg.total)

r.total.n <- rowSums(n.avg.total)
r.total.u <- rowSums(u.avg.total)

n.avg.total <- cbind(n.avg.total, r.avg.n, r.total.n)
u.avg.total <- cbind(u.avg.total, r.avg.u, r.total.u)


min(n)
min(u)

max(n)
max(u)

min(n[, 3])
min(u[, 3])

max(n[, 3])
max(u[, 3])

mean(n)
mean(u)

sd(n)
sd(u)

# the data generated with rnorm() will always have an sd close to 1, because this is 
# how the function is defined to work
# rnorm() generates data with default settings mean = 0, standard deviation = 1 
# runif() generates data within the [0, 1] range


#------------Matrix categorical variables---------------
#ordinal variables (ordered in the level/list)
#nominal variables (unable to be ordered)


#---------------creating a factor in R----------------

marital.status <- c("Married", "Married", "Single", "Married", "Divorced",
                    "Widowed", "Divorced")
str(marital.status)
marital.factor <- factor(marital.status)
marital.factor
typeof(marital.factor)
str(marital.factor)
args(factor)

new.factor <- factor(marital.status,
                     levels = c("single", "Married", "Divorced", "Widowed"))
str(new.factor)
#------Changing the name of the labels-------
levels(new.factor) <- c("s", "m", "d", "w")
str(new.factor)
new.factor

new.factor <- factor(marital.status,
                     levels = c("single", "Married", "Divorced", "Widowed"),
                     labels = c("sin", "mar", "div", "wid"))

new.factor

ordered.factor <- factor(marital.status, ordered = TRUE,
                         levels = c("single", "Married", "Divorced", "Widowed"))
ordered.factor

#------------------EXERCISE 11----------------
mtrx.chess <- matrix(chess, nrow = 10, ncol = 2, dimnames = list(NULL, c("Player", "Piece")))
mtrx.chess

piece.column.vec <- mtrx.chess[,2]
piece.column.vec
piece.factor <- factor(piece.column.vec, 
                                  levels = c("King", "Queen", "Rook", "Bishop",
                                             "Knight", "Pawn"))
piece.factor

piece.factor.2 <- factor(piece.column.vec, ordered = TRUE,
                                  levels = c("King", "Queen", "Rook", "Bishop",
                                             "Knight", "Pawn"),
                                  labels = c("K", "Q", "R", "B", "K", "P"))
piece.factor.2 

#---------------LISTS----------------
#First lists are also called recursive vectors and lists don't group values.
#They group our objects into a set.
#Third lists can store other lists for list are one dimensional like atomic 
#vectors that lists are a
#step up from vectors because they can store elements of different basic 
#types without having them undergo
#coersion. Six, lists have no inherent structure which makes them a lot 
#less functional than vectors
#or matrices or data frames.
#Especially when it comes to doing direct calculations on them.

#-----------------------------EXERCISE-----------------------------------

# create a list which prints like this: 

# [[1]]
# [1]  1  3  5  7  9 11
#
# [[2]]
# [[2]][[1]]
# [1] "Happy Birthday"
#
# [[2]][[2]]
# [1] "Archery" 

newList <- list(seq(1, 11, by = 2), list("Happy Birthday", "Archery"))
newList
str(newList)

# extract the numbers as a vector
newList[[1]]

# extract the phrase Happy Birthday as a vector
newList[[2]][[1]]

# extract the second item of the second list as a list
newList[[2]][2]

# extract the second list as a list
newList[[2]]

# extract the numbers item as a list
newList[1]

# add 2 to each element in the numbers item
newList[[1]] <- newList[[1]] + 2
newList[[1]]

# name the items in the list as "Numbers" and "Phrases"
names(newList) <- c("Numbers", "Phrases")
newList

# you can use the $ to extract named items of a list
# if you extract the numbers item from newList with the $, what other extraction method is this equivalent to?
newList$Numbers
newList[[1]]

# use the dollar sign to repeat the addition from above (add 2 to each element in the numbers list)
newList$Numbers <- newList$Numbers + 2
newList$Numbers

# add a new item called "Brands" to the list. It should contain the brands Kellogs, Nike, iPhone
# use either brackets or the dollar sign to do that
newList$Brands <- c("Kellogs", "Nike", "iPhone")
str(newList)
# or 
newList[[3]] <- c("Kellogs", "Nike", "iPhone")
names(newList)[[3]] <- "Brands"
newList

# remove the iPhone from the Brands item
newList[[3]] <- newList[[3]][-3]
# or
newList$Brands <- newList$Brands[-3]
newList

# remove the Brands item from the list
newList$Brands <- NULL
# or
newList[[3]] <- NULL
newList