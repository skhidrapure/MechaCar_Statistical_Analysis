### Challenge 15 : DELIVERABLE 1

#1. Import Library dplyr
library(dplyr)

#2. Load the csv file
library(tidyverse)
mecha_mpg <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F) 

#3. Perfom linear regression using lm() function
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mecha_mpg)

# 4. Using the summary() function, determine the p-value and the r-squared value for the linear regression model
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mecha_mpg)
)

#5. eliminating the independent variables that have little impact on predicting mpg to see impact:
lm(mpg ~ vehicle_length + ground_clearance, data=mecha_mpg)
summary(lm(mpg ~ vehicle_length + ground_clearance, data=mecha_mpg))


### DELIVERABLE 2

#2.Load the csv file
mecha_coil <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F) 

#3.Create a total_summary dataframe using the summarize() function to get the mean, median, variance, and standard deviation of the suspension coil’s PSI column.
total_summary <- mecha_coil %>% summarize(Mean_PSI=mean(PSI),
                                          Median_PSI=median(PSI),
                                          Var_PSI=var(PSI),
                                          Std_Dev_PSI=sd(PSI),
                                          Num_Coil=n(), .groups = 'keep') 
#4.#4. Create a lot_summary dataframe using the group_by() and the summarize() functions to group each manufacturing lot.                                                                
lot_summary <- mecha_coil  %>% group_by(Manufacturing_Lot) %>% summarize(Mean_PSI=mean(PSI),
                                                                         Median_PSI=median(PSI),
                                                                         Var_PSI=var(PSI),
                                                                         Std_Dev_PSI=sd(PSI),
                                                                         Num_Coil=n(), .groups = 'keep')                                      
#box plot for PSI Whole lot
plt1 <- ggplot(mecha_coil,aes(y=PSI)) 
plt1 + geom_boxplot() 

#box plot for PSI each indicdiual Lot
plt2 <- ggplot(mecha_coil,aes(x=Manufacturing_Lot,y=PSI)) 
plt2 + geom_boxplot()


### DELIVERABLE 3

#1.using t.test() determine if the PSI across ALL lots is statistically different from the pop. mean of 1,500 PSI.
t.test(mecha_coil$PSI,mu=1500)

#2. #2. Using t.test() function 3 more times with subset() to determine if PSI for each manufacturing lot is statistically different from the pop. mean of 1,500 PSI
lot1 <- subset(mecha_coil, Manufacturing_Lot=="Lot1")
lot2 <- subset(mecha_coil, Manufacturing_Lot=="Lot2")
lot3 <- subset(mecha_coil, Manufacturing_Lot=="Lot3")

t.test(lot1$PSI,mu=1500)
t.test(lot2$PSI,mu=1500)
t.test(lot3$PSI,mu=1500)
