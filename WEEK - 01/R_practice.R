# R is a programming language often used for statistical computing 
#  and graphical presentation to analyze and visualize the data.

print("Hello world!")
"Hello world!"
5+5

# There is no Multiline comment 

# a variable is created the moment assign a value
# we use <- and = for assignment

a = 10
b <- 20

a
b

# cancatenate two strings --> paste() fun

s = "hi"
t = "balu!"

paste(s,t)

b = 20.5
c = 30
b+c

a = T
a*0

class(a)  # logical datatype

e = F * T  # F * T is 0
class(e) # integer

# multiple assignment
a = b = c = "hi"


# Basic data types in R can be divided into the following types:
  
# numeric - (10.5, 55, 787)
# integer - (1L, 55L, 100L, where the letter "L" declares this as an integer)
# complex - (9 + 3i, where "i" is the imaginary part)
# character (a.k.a. string) - ("k", "R is exciting", "FALSE", "11.5")
# logical (a.k.a. boolean) - (TRUE or FALSE)

# We can use the class() function to check the data type of a variable

a = 10 # numeric
b = 10L # integer
c = 3+2i # complex

# type conversions
a = as.integer(a)
class(a) # integer
b = as.numeric(b)
class(b) # numeric
a = as.complex(b)
class(a) # a is 10+0i

# math functions
# min(),max(),abs(),sqrt(),ceiling(),floor()

min(1,2,3) # 1
max(1,2,3) # 3
abs(-4.7) # 4.7
sqrt(16) # 4
ceiling(-4.6) # -4
floor(-4.6) # -5
log(1000,10) # 3

# Strings

s = "hello"
t = 'hi'

s = "hi hello,
hello hi,
hello hello."

print(cat(s)) 
# hi hello,
# hello hi,
# hello hello.

s # hi hello,\nhello hi,\nhello hello.

nchar(s) # o/p:32 no of characters in s

# Use the grepl() function to check if a character or
# a sequence of characters are present in a string

grepl('hi',s) # o/p: TRUE

s = "We are the so-called \"Vikings\", from the north."
s
cat(s) # o/p: We are the so-called "Vikings", from the north.

# Booleans

10 > 9    # TRUE because 10 is greater than 9
10 == 9   # FALSE because 10 is not equal to 9
10 < 9    # FALSE because 10 is greater than 9

# Operators

# operator is symbol which specify manipulation or operation on operands

# Arithmetic Operators
x = 10
y = 3

x + y # addition o/p: 13
x - y # subtraction o/p: 7
x * y # multiplication o/p: 30
x / y # division o/p: 3.333333
x ^ y # exponent o/p: 1000
x %% y # modulus o/p: 1
x %/% y # integer division o/p: 3
  
#  Assignment Operators

var = 10
var <- 10
v <<- 10 # global variable
3 -> t # here v is local variable
3 ->> s # s is global variable
v = 100

# Comparison Operators

x == y # equal
x != y # not equal
x > y # greater than
x < y # less than
x <= y # less than or equal
x >= y # greater than or equal

# Logical Operators

x & y # logical and
x | y # logical or
!x # logical not

# Miscellaneous Operators

1:10  # creates a series of elements in sequence
x > 1:5
x > 1:10 # o/p: TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE

# %in% - finds out a element belongs to vector or not
# %*% - matrix multiplication

# Conditional Statements

a = 1
b = 3

ifelse(a>b,"a is greater","a is smaller")

# write a program to find leap year

x <- 2024

if (x %% 400 == 0 || (x %% 4 == 0 && x %% 100 != 0)) {
  print("Leap Year")
} else {
  print("Not a Leap Year")
}

# while Loop

i <- 1
while (i < 8) {
  i = i + 1
  if (i == 4) 
    next
  if(i == 6)
    break
  print(i)
}

# for loop

dice <- 1:6

for(x in dice) {
  if (x == 6) {
    print(paste("The dice number is", x, "Yahtzee!"))
  } else {
    print(paste("The dice number is", x, "Not Yahtzee"))
  }
}

# functions

my_function <- function(x) {
  return (5 * x)  # return() function
}

print(my_function(3))
print(my_function(5))
print(my_function(9))

# default parameter value in function

my_function <- function(country = "Norway") {
  paste("I am from", country)
}

my_function("Sweden")
my_function("India")
my_function() # will get the default value, which is Norway
my_function("USA")

# there other functions like nested functions, recursion

# global variable

txt <- "global variable"
my_function <- function() {
  txt = "fantastic"
  paste("R is", txt)
}

my_function()

txt # print txt

# Data Structures

# Vectors

# A vector is a list of items that are of the same type.
# To combine the list of items to a vector, 
# use the c() function and separate the items by a comma.

fruit = c("Banana", "Mango", "Grape", "Orange") # vector
print(fruit)

fruit[1] # indexing

fruit[c(2,3)] # printing only wanted items o/p:"Mango" "Grape"

fruit[-c(2,3)] # skip items o/p: "Banana" "Orange"

d = 1.5:6.5
d # o/p: 1.5 2.5 3.5 4.5 5.5 6.5

e = seq(0,1,by = 0.1) 
e # o/p: 0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0

v = seq(0,1,length = 11)
v # o/p:  0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0

length(v) # o/p: 11

sort(fruit) # sorting vector o/p: "Banana" "Grape"  "Mango"  "Orange"

fruit[4] = "Apple"
fruit # o/p: "Banana" "Mango"  "Grape"  "Apple"

fruit[5] = "Sapota"
fruit # o/p: "Banana" "Mango"  "Grape"  "Apple"  "Sapota"

r1 = rep(c(1,2,3), each = 3) # repeat vectors
r1 # o/p: 1 1 1 2 2 2 3 3 3

r2 = rep(c(1,2,3), times = 3)
r2 # o/p: 1 2 3 1 2 3 1 2 3

r3 = rep(c(1,2,3), times = c(1,2,3))
r3 # o/p: 1 2 2 3 3 3

# Lists

# list is a collection of elements which can contain different types.
# list is ordered and mutable

fruits_list = list("Banana","Mango","Grape","Apple","Sapota")
fruits_list

fruits_list[1] # indexing o/p: "Banana"

fruits_list[2] = "Peach" # changing items
fruits_list

fruits_list = append(fruits_list,"Orange")
fruits_list

"Apple" %in% fruits_list # item checking in list o/p: TRUE 

length(fruits_list) # o/p: 6

fruits_list = append(fruits_list,"Cherry", after = 2)
fruits_list

new_list = fruits_list[-1] # removing element form list
new_list

for (x in new_list) # looping through list
  print(x)

# o/p:
# [1] "Peach"
# [1] "Cherry"
# [1] "Grape"
# [1] "Apple"
# [1] "Sapota"
# [1] "Orange"

l1 = list(1,2,3)
l2 = list("hello","hi")

l3 = c(l1,l2) # joining two lists
l3

l3[2:5] # range of indexes

# Matrices

# A matrix is a two dimensional data set with columns and rows.
# a matrix can be created using matrix() function

m = matrix(c(1,2,3,4,5,6), nrow = 2, ncol = 3)
m
# o/p:
#   1    3    5
#   2    4    6

m[1,2] # o/p: 3 accessing elements

dim(m) # dimensions of matrix o/p: 2 3
length(m) # no of elements in matrix o/p: 6

m[1,] # accessing row elements
m[,2] # accessing column elements

m[,c(1,3)] # accessing multiple columns
m[,-c(1,3)] # accessing multiple columns by skipping columns

# add column to the existing matrix using cbind() function

thismatrix <- matrix(c("apple", "banana", "cherry", "orange","grape", "pineapple", "pear", "melon", "fig"), nrow = 3, ncol = 3)

newmatrix <- cbind(thismatrix, c("strawberry", "blueberry", "raspberry"))

newmatrix

# add row to existing matrix using rbind() function

thismatrix <- matrix(c("apple", "banana", "cherry", "orange","grape", "pineapple", "pear", "melon", "fig"), nrow = 3, ncol = 3)

newmatrix <- rbind(thismatrix, c("strawberry", "blueberry", "raspberry"))

newmatrix

# remove row or column from matrix

thismatrix <- matrix(c("apple", "banana", "cherry", "orange","grape", "pineapple", "pear", "melon", "fig"), nrow = 3, ncol = 3)

newmatrix <- thismatrix[c(-1),c(-1)] # it removes first row and column

newmatrix 

'apple' %in% thismatrix # check element presence in matrix

# looping through matrix

thismatrix <- matrix(c("apple", "banana", "cherry", "orange"), nrow = 2, ncol = 2)

for (rows in 1:nrow(thismatrix)) {
  for (columns in 1:ncol(thismatrix)) {
    print(thismatrix[rows, columns])
  }
}

# combining two matrices

# Combine matrices
Matrix1 <- matrix(c("apple", "banana", "cherry", "grape"), nrow = 2, ncol = 2)
Matrix2 <- matrix(c("orange", "mango", "pineapple", "watermelon"), nrow = 2, ncol = 2)

# Adding it as a rows
Matrix_Combined <- rbind(Matrix1, Matrix2)
Matrix_Combined

# Adding it as a columns
Matrix_Combined <- cbind(Matrix1, Matrix2)
Matrix_Combined

# Arrays

# same like matrices except, arrays(collection of matrices) can have more than 2 dimensions

# An array with one dimension with values ranging from 1 to 24
thisarray <- c(1:24)
thisarray

# An array with more than one dimension
multiarray <- array(thisarray, dim = c(4, 3, 2))
multiarray

multiarray[,,1] # accessing first matrix
multiarray[1,,1] # accessing first row of first matrix

multiarray[1,2,2] # accessing element o/p: 17

2 %in% multiarray # checking presence of element in array o/p: TRUE

dim(multiarray) # o/p: 4 3 2
length(multiarray) # o/p: 24

# looping through arrays

thisarray <- c(1:24)
multiarray <- array(thisarray, dim = c(4, 3, 2))

for(x in multiarray){
  cat(x," ") # use cat() function for printing o/p in same line
}

# Data Frame

# data frame is data structure where data is organised in rows and columns
# each column have same type of data
# data frame can be created using data.frame() function

employee = data.frame(emp_name = c("ABC", "DEF", "XYZ"), 
                salary = c(10000,12000,30000))
employee

summary(employee)

employee[1] # we can use []/[[]]/& for accessing column data form data frame
employee[["emp_name"]]
employee$emp_name

employee = cbind(employee, emp_id = c(1,2,3)) # adding new column
employee

employee = rbind(employee, c("GHI", 50000, 4)) # adding new row
employee

dim(employee) # o/p: 4 3
length(employee) # o/p: 3 similar to ncol()

new_table = employee[c(-1),c(-1)] # removing first row and column
new_table

# combining data frames horizontally using rbind()

Data_Frame1 <- data.frame (
  Training = c("Strength", "Stamina", "Other"),
  Pulse = c(100, 150, 120),
  Duration = c(60, 30, 45)
)

Data_Frame2 <- data.frame (
  Training = c("Stamina", "Stamina", "Strength"),
  Pulse = c(140, 150, 160),
  Duration = c(30, 30, 20)
)

New_Data_Frame <- rbind(Data_Frame1, Data_Frame2)
New_Data_Frame

# combining data frames vertically using cbind()

Data_Frame3 <- data.frame (
  Training = c("Strength", "Stamina", "Other"),
  Pulse = c(100, 150, 120),
  Duration = c(60, 30, 45)
)

Data_Frame4 <- data.frame (
  Steps = c(3000, 6000, 2000),
  Calories = c(300, 400, 300)
)

New_Data_Frame1 <- cbind(Data_Frame3, Data_Frame4)
New_Data_Frame1

# Factors

# Factors are used to categorize data. Examples of factors are:

# Demography: Male/Female
# Music: Rock, Pop, Classic, Jazz
# Training: Strength, Stamina

# we use factor() function in to create factors

music_genre <- factor(c("Jazz", "Rock", "Classic", "Classic", "Pop", "Jazz", "Rock", "Jazz"))
music_genre

levels(music_genre) # o/p: "Classic" "Jazz" "Pop" "Rock"

length(music_genre) # o/p: 8

# setting levels inside factor() function

music_genre <- factor(c("Jazz", "Rock", "Classic", "Classic", "Pop", "Jazz", "Rock", "Jazz"), levels = c("Classic", "Jazz", "Pop", "Rock", "Other"))
levels(music_genre) 

music_genre[3] # accessing factors o/p: Classic

music_genre[3] = "Pop" # changing factor item - it will work only when "Pop" is in music_genre factor

# looping through factor
# count of "Pop"
count<<-0
for (x in music_genre)
  if (x == "Pop")
    count = count + 1

cat(count)

# sample program
x <- c(TRUE,FALSE,TRUE,TRUE)
sum(x) # o/p: 3

log(exp(1)) # o/p: 1

ls = list("bala",1,3.5) # list can store elements of different data types
ls

tail(employee)
head(employee)

