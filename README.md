# Housing-Prices
we will try to predict the median home value in a given Census area by using linear regression.

In this problem we will try to predict the median home value in a given Census area by using
linear regression. The data is in housing_data.mat, and it comes from http://lib.stat.cmu.
edu/datasets/. (houses.zip).There are only 8 features for each data point; you can read about
the features in housing_data_source.txt.
----------------------------------------------------------------------------------------------
1. Implement a linear regression model with least squares. Include your code in the submission.
You should add a constant term to the training data (e.g. add another dimension to each
data point, with the value of 1). This is same as adding the bias term to linear regression
(see discussion 4 question 1).

2. Test your trained model on the validation set. What is the residual sum of squares (RSS) on
the validation set? What is the range of predicted values? Do they make sense?

3. Plot the regression coecients w (plot the value of each coecient against the index of the
coefficient). Be sure to exclude the coecient corresponding to the constant oset you added
earlier.

4. Plot a histogram of the residuals (f(x) 􀀀 y). What distribution does this resemble?
