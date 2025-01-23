# set the working directory
### Data Visualization

########### (Read the data set)
library(readxl)

salary = read.csv("Salary Data.csv")
head(salary)
colnames(salary)

colnames(salary)[5] = c("Exp")
colnames(salary)
####### (remove null vlaues and duplicates)
summary(salary)
salary$Age[is.na(salary$Age)] = mean(salary$Age, na.rm = T)
salary$Exp[is.na(salary$Exp)] = mean(salary$Exp, na.rm = T)
salary$Salary[is.na(salary$Salary)] = mean(salary$Salary, na.rm = T)
sum(is.na(salary))

salary = unique(salary)

dim(salary)

########### (scatter plot) the graph bw (exp,age) Vs salary
library(zoo)
par(mfrow=c(2,1), mar = c(4, 4, 1, 1)) 

plot(salary[,5],salary[,6], main="Exp Vs Salary", xlab="Exp", ylab="Salary", col="red", pch=20, cex=1)
#plot(salary[,5],salary[,6], main="Exp Vs Salary", type="l", xlab="Exp", ylab="Salary", col="red", lwd=2)
plot(salary[,1],salary[,6], main="Age Vs Salary", xlab="Age", ylab="Salary", col="blue", pch =20,cex=1)

########### barplot bw (exp,age) Vs salary
par(mfrow=c(1,1), mar=(c(4,4,1,1)))

data = data.frame(as.integer(salary$Exp),salary$Salary)
colnames(data) = c("exp", "salary")
head(data)

library(dplyr)
## perform group by operatins on data frame.
result <- data %>%
  group_by(exp) %>%
  summarise(mean_salary = mean(salary))

result$mean_salary = as.integer(result$mean_salary)

barplot(result$mean_salary, names.arg = result$exp, col = "black",border = 'red')
grid(nx = NA, ny = NULL, col = "lightgray", lty = "dotted", equilogs = F)

############ (bar plot for different levels)
data = iris
head(data)
summary(data)

class(data$Species)
levels(data$Species)
table(data$Species)

help(par)
barplot(table(data$Species), main = "Flower Species", col = "gray")
barplot(table(data$Species), main = "Flower Species", col = "gray",horiz = T)
barplot(table(data$Species),width = 2, main = "Flower Species", col = rainbow(3))
legend("topright",c("Setosa","Versicolor","Virginica"),fill = rainbow(3),cex=0.4)

help("barplot")

############# (pie chart)
# Aggregate hair color data
data(HairEyeColor)
hair_color <- margin.table(HairEyeColor, 1)  # Summarize over hair color

# Plot pie chart
pie(hair_color, 
    labels = names(hair_color), 
    col = rainbow(4), 
    main = "Hair Color Distribution")
legend("topright",names(hair_color),fill=rainbow(4),cex=0.7)

# plot with frequency
pie(hair_color, 
    labels = paste0(round(100*hair_color/sum(hair_color,2)),"%"), 
    col = rainbow(4), 
    main = "Hair Color Distribution")
legend("topright",names(hair_color),fill=rainbow(4),cex=0.7)

#3d pie plot

library(plotrix)
pie3D(hair_color, 
      labels = paste0(round(100*hair_color/sum(hair_color,2)),"%"), 
      col = rainbow(4), 
      main = "Hair Color Distribution")
legend("topright",names(hair_color),fill=rainbow(4),cex=0.4)

###### plotting Histogram
var = sample(50:100, 10000,replace = T)
length(var)
summary(var)

hist(data, xlab = "Frequency", ylab = "Variable", col = rainbow(20), breaks = 100)

#importance of breaks
par(mfrow=c(1,3))

hist(data, xlab = "Frequency", ylab = "Variable", col = rainbow(20), breaks = 100)

hist(data, xlab = "Frequency", ylab = "Variable", col = rainbow(20), breaks = 10)

hist(data, xlab = "Frequency", ylab = "Variable", col = rainbow(20), breaks = 1)

par(mfrow=c(1,1))

hist(data, xlab = "Frequency", ylab = "Variable", col = rainbow(20), breaks = 100,
     border = "green",cex.main = 2, font.main = 4, cex.axis=1.5,col.lab="red",
     col.main="blue",col.axis="black",cex.lab=1.3)

m = hist(data, xlab = "Frequency", ylab = "Variable", col = rainbow(20), breaks = 10,
     border = "green",cex.main = 2, font.main = 4, cex.axis=1.5,col.lab="red",
     col.main="blue",col.axis="black",cex.lab=1.3)

text(m$mids, m$counts, labels=m$counts, adj=c(0.5,-0.5))

par(new=T)

plot(density(var), lwd=4, xlab="",ylab = "",main="",axes=F)
axis(4, col.axis="black",col="black")

mtext("Cell density",side=4,col="black")

########### (stacked bar plot)
# Load Titanic dataset
data(Titanic)

# Convert the Titanic data to a data frame for easier manipulation
titanic_df <- as.data.frame(Titanic)

# Create a stacked bar plot
barplot(
  height = xtabs(Freq ~ Class + Survived, data = titanic_df), 
  col = rainbow(4), 
  main = "Survival by Class (Stacked Bar Plot)", 
  xlab = "Survived", 
  ylab = "Frequency",
  cex.axis = 1
)
legend("topright",rownames(xtabs(Freq ~ Class + Survived, data = titanic_df)),fill=rainbow(4)
       ,cex = 0.6)

