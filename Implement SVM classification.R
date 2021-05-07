data = read.csv("D:/Harini(christ unniversity)/2nd sem subjects/R/heart disease.csv")
head(data)
summary(data)
sapply(data, class)#displaying the datatype of each column

library(caTools)

colSums(is.na(data))#checking if their are any null values

#splitting the dataset into training and testing 
sample=sample.split(data$target,SplitRatio=0.75)
train=subset(data,sample==TRUE)
test=subset(data,sample==FALSE)
dim(train)#dimesion of train data
dim(test)
library(e1071)



classifier = svm(formula = target ~ .,
                 data = train,
                 type = 'C-classification',
                 kernel = 'linear')

# Predicting the Test set results
y_pred = predict(classifier, newdata = test)
y_pred


summary(y_pred)
library(caret)
confusionMatrix(table(y_pred, test$target))





