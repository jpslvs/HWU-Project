#Preliminary HWU Data Analysis
#Set Working Directory and Clear Environment
setwd('/Users/yo/Documents/Research/HWU Ecology/Data/')
rm(list=ls())
#Install Packages
install.packages('tidyverse')
library(tidyverse)

#########################################DATA ORGANIZATION#################################################
#Load Data
data=read.csv("HWUData.csv",header=TRUE)
#Convert columns to numeric
data[3:4] <- lapply(data[3:4], as.numeric)
data[8:13] <- lapply(data[8:13], as.numeric)
data$DATE=as.Date(data$DATE, origin = "1899-12-30")
#Verify Data Type
str(data)

#Organize Data
#Create datasets for each POPULATION
#ZOO
zoodata=data[1:28,1:13]
#DBG
dbgdata=data[29:56,1:13]
#CRESCENT
cstdata=data[85:112,1:13]
#EEGRET
egtdata=data[113:140,1:13]
#Create datasets for each HABITAT type
#AQUATIC
aquatic.data=data[1:56,8:10]
#TERRESTRIAL
terrestrial.data=data[1:56,11:13]

#######################################CALCULATIONS & ANALYSIS#############################################
#ABUNDANCE 
#General ABUNDANCE of BUDS at each POPULATION
abd.bud.pop=as.vector(c(sum(zoodata$TOT_A_BUD),(sum(dbgdata$TOT_A_BUD)),(sum(egtdata$TOT_A_BUD)),(sum(cstdata$TOT_A_BUD))))
#General ABUNDANCE of FRUITS at each POPULATION
abd.frt.pop=as.vector(c(sum(zoodata$TOT_A_FRT),(sum(dbgdata$TOT_A_FRT)),(sum(egtdata$TOT_A_FRT)),(sum(cstdata$TOT_A_FRT))))
#General ABUNDANCE of BUDS at each HABITAT 
abd.bud.hbt=as.vector(c(sum(zoodata$TOT_A_BUD),(sum(dbgdata$TOT_A_BUD)),(sum(zoodata$TOT_T_BUD)),(sum(dbgdata$TOT_T_BUD))))
#General ABUNDANCE of FRUITS at each HABITAT 
abd.frt.hbt=as.vector(c(sum(zoodata$TOT_A_FRT),(sum(dbgdata$TOT_A_FRT)),(sum(zoodata$TOT_T_FRT)),(sum(dbgdata$TOT_T_FRT))))
#Total ABUNDANCE of BUDS at each POPULATION
tot.bud.pop=as.vector(c(sum(41,75),(sum(1057,3010))))
#Total ABUNDANCE of FRUITS at each POPULATION
tot.frt.pop=as.vector(c(sum(5,5),(sum(312,1274))))
#Total ABUNDANCE of BUDS at each HABITAT
tot.bud.hbt=as.vector(c(sum(aquatic.data$TOT_A_BUD),(sum(terrestrial.data$TOT_T_BUD))))
#Total ABUNDANCE of FRUITS at each HABITAT
tot.frt.hbt=as.vector(c(sum(aquatic.data$TOT_A_FRT),(sum(terrestrial.data$TOT_T_FRT))))

#Percentage of Buds matured into Fruits
#Calculate percent of buds that turned into fruit (productivity) at each POPULATION
prod.pop=as.vector(c((sum(zoodata$TOT_A_FRT)/sum(zoodata$TOT_A_BUD)),(sum(dbgdata$TOT_A_FRT)/sum(dbgdata$TOT_A_BUD)),(sum(egtdata$TOT_A_FRT)/(sum(egtdata$TOT_A_BUD))),(sum(cstdata$TOT_A_FRT)/(sum(cstdata$TOT_A_BUD)))))
#Total 
tot.prd.pop=as.vector(c((sum(aquatic.data$TOT_A_FRT,aquatic.data$TOT_T_FRT)/sum(aquatic.data$TOT_A_BUD,aquatic.data$TOT_T_BUD)),(sum(egtdata$TOT_A_FRT,cstdata$TOT_A_FRT)/(sum(egtdata$TOT_A_BUD,cstdata$TOT_A_BUD)))))
#Calculate percent of buds that turned into fruit (productivity) at each HABITAT  
prod.hbt=as.vector(as.vector(c((sum(zoodata$TOT_A_FRT)/sum(zoodata$TOT_A_BUD)),(sum(dbgdata$TOT_A_FRT)/sum(dbgdata$TOT_A_BUD)),(sum(zoodata$TOT_T_FRT)/(sum(zoodata$TOT_T_BUD))),(sum(dbgdata$TOT_T_FRT)/(sum(dbgdata$TOT_T_BUD))))))
#Total 
tot.prd.hbt=as.vector(c((sum(aquatic.data$TOT_A_FRT,aquatic.data$TOT_T_FRT)/sum(aquatic.data$TOT_A_BUD,aquatic.data$TOT_T_BUD)),(sum(terrestrial.data$TOT_A_FRT,terrestrial.data$TOT_T_FRT)/sum(terrestrial.data$TOT_A_BUD,terrestrial.data$TOT_T_BUD))))


