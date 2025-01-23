## data handling and data cleaning ##

### setting the working directory #
getwd()
setwd("C:/Users/balaj/Desktop/DA/Financial_Analytics_NPTEL")

### load the data
data = read.csv("Salary Data.csv")
dim(data) # o/p: 375 6
class(data) # o/p: data.frame

summary(data)
str(data) # features
colnames(data)
head(data,8)

### changing the names 
colnames(data)[4] = "Job"
colnames(data)[3:5] = c("Education", "Job", "Exp(Y)")
colnames(data)

### cleaning the data frame
x = c(0, NA, 2, 3.4, 4)
x

x>2 # o/p: FALSE    NA FALSE  TRUE  TRUE here NA not compared with 2

x>2 & !is.na(x) #o/p: FALSE FALSE FALSE  TRUE  TRUE

is.nan(0/0) # o/p: TRUE
is.infinite(1/0) # o/p: TRUE

################(marked na values as 0)
data_1 = data # making copy of data
sum(is.na(data_1)) # o/p: 6 there are size na values
all(!is.na(data_1)) # o/p: FALSE data have na values

data_1[is.na(data)] = 0 # marking na as 0
sum(is.na(data_1)) # o/p: 0
all(!is.na(data_1)) # o/p: TRUE no na values

################(remove rows with null values)
data_1 = data
sum(is.na(data))
summary(data)
# in the data_1 fetures age,exp(y),salary conatain 2 each na values
# we remove rows with na 

subset(data_1, is.na(Age)) # age feature rows with null values
subset(data_1, complete.cases(data_1)) # rows with non na
data_1 = na.omit(data_1) # removing rows with na
dim(data_1) # o/p: 373 6

summary(data_1) 
################(filling na values with mean/median)
data_1 = data
summary(data_1$Age)
mean(data_1$Age) # o/p: NA
mean(data_1$Age, na.rm=T) # o/p: 37.43164
median(data_1$Age, na.rm=T) # o/p: 36

data_1$Age[is.na(data_1$Age)] = mean(data_1$Age, na.rm = T)
mean(data_1$Age)

############### (removing non-unique values-duplicates)
data_2 = data
dim(data_2) #o/p: 375 6

data_3 = unique(data_2)
dim(data_3) # o/p: 325 6 (50 rows are duplicates)

### Data handling
############# (selection rows and columns in R)
head(iris)
colnames(iris)
dim(iris) # o/p: 150 5

iris[,5]
head(iris[,3])
unique(iris[,5])
class(iris[,5])  # o/p: factor

iris[,c(3,5)]
head(iris[,c(3,4)])

head(iris[,c(3:5)])

############# (creation of new variables)
iris$Petal.Ratio = iris$Petal.Length/iris$Petal.Width
iris$Sepal.Ratio = iris$Sepal.Length/iris$Sepal.Width
head(iris)

############# (extracting observations)
iris[iris$Petal.Width > 0.4 & iris$Species=="setosa",]
subset(iris, Petal.Width > 0.4 & Species == "setosa") #both will do same job

############ (summarize the observations )
summary(iris)
str(iris)

##########################################
### working with data frame
library(car)  # install car library

dim(Davis)
head(Davis)
colnames(Davis)

output = data.frame(matrix(nrow = dim(Davis)[1],ncol = dim(Davis)[2]))
head(output)
dim(output)

colnames(output) = c("sex", "weight", "height", "repwt", "repht")
colnames(output)

output$sex = Davis$sex
output$weight = Davis$weight
output$height = Davis$height
output$repwt = Davis$repwt
output$repht = Davis$repht

head(output)

################# (working with factor variables)
library(UsingR)

head(Cars93)
summary(Cars93)

levels(Cars93$Model)

Cars93[3,c(2,4)] = list("A3", 40) # o/p: invalid factor bec A3 is not level

Cars93$Model = droplevels(Cars93$Model) 
Cars93$Model

levels(Cars93$Model) = c(levels(Cars93$Model), c("A3","A4")) # adding factors
Cars93[3,c(2,4)] = list("A3", 40) 

levels((Cars93$Model))

################ (transform the data frames across long and wide formats)
Speed.1 = c(234,456,435,657,456,978)
Speed.2 = c(265,374,427,288,266,992)
Speed.3 = c(246,377,437,737,565,299)
Speed.4 = c(246,357,437,473,565,377)
Speed.5 = c(546,477,497,337,565,287)
id = c(1,2,3,4,5,6)
Run = c("A","B","C","D","E","F")
Speed = cbind.data.frame(id,Run,Speed.1,Speed.2,Speed.3,Speed.4,Speed.5)
head(Speed)
str(Speed)

library(reshape2)
long = melt(Speed, id.vars=names(Speed)[1:2], variable.name="Speed")
head(long)

wide = dcast(long, id+Run ~Speed)
head(wide)

################## (merging the data frames)
v1 = c("Bahubali", "RRR", "Dhangal", "Pushpa", "PK", "Kalki")
v2 = c(1820, 1120, 2040, 1850, 750, 1200)

d1 = cbind.data.frame(v1,v2)
head(d1)
colnames(d1) = c("Name", "India_Collection")
head(d1)

v1 = c("Bahubali", "RRR", "Dhangal", "Pushpa", "Animal", "Kalki")
v2 = c(1820, 1120, 2040, 1850, 950, 1200)

d2 = cbind.data.frame(v1,v2)
head(d2)
colnames(d2) = c("Name", "World_Collection")
head(d2)

final = merge(d1,d2, by="Name") # inner join
head(final)

final = merge(d1,d2, by="Name", all = T) # outer join
head(final,7)

final = merge(d1,d2, by="Name", all.x = T) # left join
head(final)

final = merge(d1,d2, by="Name", all.y = T) # right join
head(final)