load('/Users/bharath3910/Google Drive/JuniorF2015/CS 189/hw3/data/spam.mat')
%Preprocessing stage
X_stand = zscore(Xtrain); %Part i
X_transform = log(Xtrain+0.1); %Part i
%Kernel Switch
kernel_degree = 1;
Y = double(Ytrain);
X = X_transform;
X_train = X(1:2300,:);
X_test = X(2301:3450,:);
Y_train = Y(1:2300);
Y_test = Y(2301:3450);
loss = [];
loss_v = [];
%%
% Show regression on training set to find risk
alpha = 5*ones(2300,1);
kern = (X_train*X_train'+1).^kernel_degree;
for i = 1:1000
    f = alpha'*kern;
    z = Y_train.*f';
    z = z/10000000;
    s = 1./(1+exp(z));
    l_r = 5/(1000000*i);
    delta_alpha = l_r*(s.*Y_train);
    loss(i) = sum(log(1+exp(-z)));
    if z<0
        alpha = (1-l_r)*alpha + delta_alpha;
    else
        alpha = (1-l_r)*alpha ;
    end
end

figure(10)
    plot(loss)
    hold on
    xlabel('Iterations')
    ylabel('Risk')
    hold off
%%
%Show same for validation
alpha = 5*ones(1150,1);
kern = (X_test*X_test'+1).^kernel_degree;
for i = 1:1000
f = alpha'*kern;
z = Y_test.*f';
z = z/10000000;
s = 1./(1+exp(z));
l_r = 1/(1000000*i);
delta_alpha = l_r*(s.*Y_test);
loss_v(i) = sum(log(1+exp(-z)));
if z<0
        alpha = (1-l_r)*alpha + delta_alpha;
    else
        alpha = (1-l_r)*alpha ;
    end
end

figure(11)
    plot(loss_v)
    hold on
    xlabel('Iterations')
    ylabel('Risk')
    hold off
    
%%
figure(12) %Validating the difference in Risk to show that we are not overfitting
    plot(abs(zscore(loss_v)-zscore(loss)))
    hold on
    xlabel('Iterations')
    ylabel('risk change')
    hold off
    
 


