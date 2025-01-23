########## data visualization part-2
#### set working directory
getwd()
setwd("C:/Users/balaj/Desktop/DA/Financial_Analytics_NPTEL")
##### portfolio analytics
####### load the relevant libraries
library(PortfolioAnalytics)
library(tidyverse)
library(patchwork)

#### read dataset
data = read.csv("bitcoin_dataset.csv")
head(data)
class(data)
dim(data)
summary(data)
str(data)

# #### convert it into zoo object
# # Load necessary library
library(zoo)

# data$timestamp <- as.POSIXct(data$timestamp) # Convert timestamp to POSIXct format
# 
# zoo_data <- zoo(data[, -1], order.by = data$timestamp) # Create a zoo object
# 
# print(head(zoo_data)) # View the zoo object
# 
# data = zoo_data
# 
# head(data)
# class(data)
# dim(data)
# summary(data)
# str(data)
data = na.omit(data)

# Convert zoo to data frame for ggplot
data_df <- fortify.zoo(data)
head(data_df$Index)

##### plot the time series data
###### density plot
library(ggplot2)

p1 = ggplot(data_df, aes(x=Index, y=bitcoin))+
  geom_line(col="blue",lwd=0.8)+labs(title = "Bitcoin",y="",x="Date")

p2 = ggplot(data_df, aes(x=Index, y=esg_funds))+
  geom_line(col="green",lwd=0.8)+labs(title = "ESG_funds",y="",x="Date")

p3 = ggplot(data_df, aes(x=Index, y=snp500))+
  geom_line(col="red",lwd=0.8)+labs(title = "SNP_500",y="",x="Date")

p4 = ggplot(data_df, aes(x=Index, y=eua_features))+
  geom_line(col="orange",lwd=0.8)+labs(title = "EUA_features",y="",x="Date")

p1+p2+p3+p4+plot_annotation(title="Time Series of Prices",
   theme = theme(plot.title = element_text(hjust = 0.5,size=20,face = "bold")))

###### data visualization exercise with Box plots
p1 = ggplot(data_df, aes(x=eua_features,fill = factor(year)))+
  geom_boxplot()+labs(fill="Year",title = "EUA_features",y="")

p2 = ggplot(data_df, aes(x=bitcoin,fill = factor(year)))+
  geom_boxplot()+labs(fill="Year",title = "Bitcoin",y="")

p3 = ggplot(data_df, aes(x=esg_funds,fill = factor(year)))+
  geom_boxplot()+labs(fill="Year",title = "ESG_funds",y="")

p4 = ggplot(data_df, aes(x=snp500,fill = factor(year)))+
  geom_boxplot()+labs(fill="Year",title = "SNP_500",y="")

p1+p2+p3+p4+plot_annotation(title = "Box Plot Yearwise",
  theme= theme(plot.title = element_text(hjust = 0.5,size = 20,face = "bold")))

####### visualize with s&p 500 movement
##### Regression visualization
p1 = ggplot(data_df, aes(x=snp500,y=bitcoin))+
   geom_point(col="red")+geom_smooth(col="blue",method="lm")+
   labs(title="Bitcoin Vs SNP_500",y="Bitcoin",x="SNP_500")

p2 = ggplot(data_df, aes(x=snp500,y=esg_funds))+
  geom_point(col="red")+geom_smooth(col="blue",method="lm")+
  labs(title="ESG_funds Vs SNP_500",y="ESG_fund",x="SNP_500")

p3 = ggplot(data_df, aes(x=snp500,y=eua_features))+
  geom_point(col="red")+geom_smooth(col="blue",method="lm")+
  labs(title="EUA_features Vs SNP_500",y="EUA_features",x="SNP_500")

p1+p2+p3
p1/p2/p3  # for horizontal plot

####### Data visualization density plots
p1 = ggplot(data_df, aes(x=bitcoin,color=factor(year),fill = factor(year)))+
  geom_density(linewidth=1,alpha=0.5)+
  labs(title="Bitcoin",y="",x="",col="Year",fill="Year")

p2 = ggplot(data_df, aes(x=eua_features,color=factor(year),fill = factor(year)))+
  geom_density(linewidth=1,alpha=0.5)+
  labs(title="EUA_features",y="",x="",col="Year",fill="Year")

p3 = ggplot(data_df, aes(x=esg_funds,color=factor(year),fill = factor(year)))+
  geom_density(linewidth=1,alpha=0.5)+
  labs(title="ESG_fund",y="",x="",col="Year",fill="Year")

p4 = ggplot(data_df, aes(x=snp500,color=factor(year),fill = factor(year)))+
  geom_density(linewidth=1,alpha=0.5)+
  labs(title="SNP_500",y="",x="",col="Year",fill="Year")

p1+p2+p3+p4+plot_annotation(title = "Density Plot YearWise",
    theme = theme(plot.title=element_text(hjust=0.5,size = 20,face="bold")))














