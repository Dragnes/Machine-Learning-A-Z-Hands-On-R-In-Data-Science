#Data Preprocessing

#Importing the Dataset
dataset = read.csv('Data.csv')
# dataset = dataset[, 2:3]

# Splitting the Dataset into the Training Set and Test Set
install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# # Feature Scaling
# training_set[, 2:3] = scale(training_set[, 2:3])
# test_set[, 2:3] = scale(test_set[, 2:3])
#to do  above 'ctrl+shift+c'

# Fitting Simple Linear Regressioon to the Training Set
regressor = lm(formula = Salary ~ YearsExperience,
               data = training_set)

# Predicting the Test Set Results
y_pred = predict(regressor, newdata = test_set)

# Visualising the Training Set Results
install.packages('ggplot2')
library(ggplot2)
ggplot() +
  geom_point(aes(x = training_set$YearsExperience,
                 y = training_set$Salary),
             color = 'red') +
  geom_line(aes(x = training_set$YearsExperience,
                y = predict(regressor, newdata = training_set)),
            color = 'blue') +
  ggtitle('Salary vs Experience (Training Set)') +
  xlab('Years of Experience') +
  ylab('Salary')

# Visualising the Test Set Results
install.packages('ggplot2')
library(ggplot2)
ggplot() +
  geom_point(aes(x = test_set$YearsExperience,
                 y = test_set$Salary),
             color = 'red') +
  geom_line(aes(x = training_set$YearsExperience,
                y = predict(regressor, newdata = training_set)),
            color = 'blue') +
  ggtitle('Salary vs Experience (Test Set)') +
  xlab('Years of Experience') +
  ylab('Salary')