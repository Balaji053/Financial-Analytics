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



