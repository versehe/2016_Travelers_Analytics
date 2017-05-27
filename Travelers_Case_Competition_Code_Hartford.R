install.packages("statmod")
install.packages("cplm")
install.packages("caret",dependencies = T)
library(caret)
library(statmod)
library(cplm)

train <- read.csv("C:/Users/Julie/Desktop/Kangaroo_train.csv")
valid <- read.csv("C:/Users/Julie/Desktop/Kangaroo_valid.csv")
hold <- read.csv("C:/Users/Julie/Desktop/Kangaroo_hold.csv")

summary(train)
hist(train$claimcst0,breaks=100)


#--------------------------------

#convert categorical variables

train[["agecat"]]=factor(train[["agecat"]])
train[["veh_age"]]=factor(train[["veh_age"]])
dum=dummyVars(~veh_body+veh_age+gender+area+agecat,data=train)
dummy=cbind(train[c("claimcst0","veh_value","exposure")],head(predict (dum, train),n=nrow(train)))


valid[["agecat"]]=factor(valid[["agecat"]])
valid[["veh_age"]]=factor(valid[["veh_age"]])
dum=dummyVars(~veh_body+veh_age+gender+area+agecat,data=valid)
dummy_valid=cbind(valid[c("claimcst0","veh_value","exposure")],head(predict (dum, valid),n=nrow(valid)))


hold[["agecat"]]=factor(hold[["agecat"]])
hold[["veh_age"]]=factor(hold[["veh_age"]])
dum=dummyVars(~veh_body+veh_age+gender+area+agecat,data=hold)
dummy_hold=cbind(hold[c("id","veh_value","exposure")],head(predict (dum, hold),n=nrow(hold)))


#---------------------------------


#fit a cpglm tweedie model on training data
fit2 = cpglm(claimcst0~.,family=tweedie(var.power=1.55),data=dummy)
hist(predict(fit2),breaks=100)
summary(fit2) 

#predict values on validation data
pred_value_valid = predict(fit2,newdata=dummy_valid)
actual_valid = dummy_valid$claimcst0
predict_valid = cbind(pred_value_valid,actual_valid)
predict_valid = as.data.frame(predict_valid)
predict_valid$split = rep('valid',nrow(predict_valid))
head(predict_valid)

#look at distribution of prediction
hist(predict(fit2,newdata=dummy_valid),breaks=100)

#look at sum of predicted and actual values 
sum(predict(fit2,newdata=dummy_valid))
sum(dummy_valid$claimcst0)


#-------------------------------------------

#fit a new model with select features
fit4 = cpglm(claimcst0~exposure+veh_age.1+agecat.1,family=tweedie(var.power=1.55),data=dummy)
summary(fit4) 

#look at distribution of prediction
hist(predict(fit4),breaks=100)

#predict values on validation data
pred_value_valid2 = predict(fit4,newdata=dummy_valid)
actual_valid = dummy_valid$claimcst0
predict_valid2 = cbind(pred_value_valid2,actual_valid)
predict_valid2 = as.data.frame(predict_valid2)
predict_valid2$split = rep('valid',nrow(predict_valid2))
head(predict_valid2)


#look at sum of predicted and actual values 
sum(predict(fit4,newdata=dummy_valid))
sum(dummy_valid$claimcst0)

#------------------------------------------

#PREDICT ON HOLDOUT
pred_value_hold = predict(fit4,newdata=dummy_hold)
id = dummy_hold$id
predict_hold = cbind(pred_value_hold,id)
predict_hold = as.data.frame(predict_hold)
head(predict_hold)

#look at sum of predicted values 
sum(pred_value_hold)

