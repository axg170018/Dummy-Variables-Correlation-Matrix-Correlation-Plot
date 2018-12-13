rm(list= ls()) #This command drops all obects or data from the environment
data1 <- read.csv("~/Desktop/session 4/ToyotaCorolla.csv")#This command reads the file ToyotaCorolla dataset.
sum(is.na(data1)) # This command checks for all null values in the dataset.
library(dummies) # We use the library dummies to create dummy variables.
data2 <- as.data.frame(data1) # this converts the dataset to a dataframe and stores it into data2
data1.new <- cbind(data2,dummy(data2$Fuel_Type))# Now we make data1.new which creates dummy variables for data2$Fuel_Type and column binds them to data2. 
data2.new <- cbind(data1.new,dummy(data2$Color))# Now we make data2.new which creates dummy variables for data2$Color and column binds them to data1.new.
View(data2.new)# Now when we view the data2.new we have "Model","Fuel_Type","Color" which are not needed any more as their dummy variables have been created.
colnames(data2.new)#to see all the colnames
which(colnames(data2.new)=="Model")#This gives the location of "Model" column which is [2]
which(colnames(data2.new)=="Fuel_Type")#This gives the location of "Fuel_Type" column which is [8]
which(colnames(data2.new)=="Color")#This gives the location of "Color" column which is [11]
data2.new[2] <- NULL #we remove the fields from which dummies have been created.
data2.new[7] <- NULL#we remove the fields from which dummies have been created.
data2.new[9] <- NULL#we remove the fields from which dummies have been created.
View(data2.new)
library(corrplot)# we use this library to make a correlation matrix and also for plotting a correlation plot.
data3.new <- data2.new[1:15]
View(data3.new)
data3.new[13] <- NULL# now we remove the variables that we do not need to use for finding correlations in correlation#plot
data3.new[12] <- NULL#Remove the unrequired variable in correlation matrix.
data3.new[11] <- NULL#remove  variable doors
data3.new[4] <- NULL#Remove variable manufac_month
data3.new[4] <- NULL#Remove variable manufac_year
data3.new[1] <- NULL# we can also remove id 
res1 <- round(cor(data3.new),2)#this will create a correlation matrix with values upto two decimal places
View(res1)
corrplot(res1,method="circle")#this creates a correlation plot
View(data3.new)




