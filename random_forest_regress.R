# Polynomial linear regression

# Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
#library(caTools)
# set.seed(123)
# split = sample.split(dataset$Salary, SplitRatio = 2/3)
# training_set = subset(dataset, split == TRUE)
# test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)

# Fitting the Decision Tree Regression to the dataset
install.packages('randomForest')
library(randomForest)
set.seed(1234)
regressor = randomForest(x = dataset[1], y = dataset$Salary, ntree = 500)
                  


# Predicting a new result
y_pred = predict(regressor, data.frame(Level = 6.5))

# Visualizing the Decision Tree Regression model results
#library(ggplot2)
#ggplot() + geom_point(aes(x = dataset$Level, y= dataset$Salary), color = "red") + geom_line(aes(x = dataset$Level, y= predict(regressor, newdata = dataset)), color = "blue") + ggtitle("Workforce_Salary_Analysis(Random Forest Regression)") + xlab("Level")+ ylab("Salary")
# division of x -axis independent variable into a number of intervals
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.01)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = x_grid, y = predict(regressor, newdata = data.frame(Level = x_grid))),
            colour = 'blue') +
  ggtitle(' Workforce_Salary_Analysis(Random Forest Model)') +
  xlab('Level') +
  ylab('Salary')

