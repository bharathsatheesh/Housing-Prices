%% Finding the linear regression model (a)
load('/Users/bharath3910/Google Drive/JuniorF2015/CS 189/hw3/data/housing_data.mat')
dim = size(Xtrain);
leng = dim(1);
wid = dim(2);
bias = -10.*ones(leng,1);
Xtrain = horzcat(Xtrain,bias);
X_hat = Xtrain;
% We piece together the X-X_mean
for i = 1:wid
 X_hat(:,i) = mean(Xtrain(:,i)); 
end
X_mat = Xtrain;
diff_X = X_mat-X_hat;
% We piece together the Y-Y_mean
Y_mat = Ytrain;
Y_hat = Y_mat;
Y_hat(:,1) = mean(Ytrain);
diff_Y = Y_mat - Y_hat;
%We square our differences
diff_sqX = diff_X.^2;
prod_XY = diff_Y'*diff_X;
sum_sqX = sum(diff_sqX,1);
weight_vector = prod_XY./sum_sqX;
beta_zero = Y_hat-X_hat(1,1:8)*weight_vector(1,1:8)';

%% Validating my outcome to find RSS (b)
Y_test = Yvalidate;
Y_test = beta_zero(1:1200,1)+Xvalidate*weight_vector(1,1:8)';

%% Finding the RSS(c)
rss_error = sum((Yvalidate - Y_test).^2); 
%%
%Plotting the RSS(d) 
figure(1)
plot(weight_vector)
hold on
xlabel('Index');
ylabel('Weight');
hold off
%%
%Finding the corresponding Histogram(e)
figure(2)
histogram(Y_test-Yvalidate)















 
 
 
 
 
 
 
