load('/Users/bharath3910/Google Drive/JuniorF2015/CS 189/hw3/data/spam.mat')

%Preprocessing stage
X_stand = zscore(Xtrain); %Part i
X_transform = log(Xtrain+0.1); %Part ii
X_binarized = Xtrain > 0;  %Part iii
Y = double(Ytrain);
X_choice = [X_stand,X_transform,X_binarized];

%%
%Part 1 for the Question
for j = 1:3
    X = X_choice(:,((j-1)*57)+1:57*j);
    w = ones(57,1)/1000;
    risk = [];
    for i = 1:1000
        f = sum(X*w);
        dz = Y'*X;
        z = dz*w;
        z = z/10;
        ldz = -exp(-z)/(1+exp(-z));
        l_rate = 5/100000;
        delta_w = -l_rate*ldz*dz;
        risk(i) = log(1+exp(z));
        w = w - delta_w';
    end
    figure(j)
    plot(risk)
    hold on
    xlabel('Iterations')
    ylabel('Risk')
    hold off
    
end
%%
%Part 2 of the Question
for j = 1:3
    X = X_choice(:,((j-1)*57)+1:57*j);
    w = ones(57,1)/1000;
    risk = [];
    matrix_count = 1;
    for i = 1:1000
        for k = 1:length(X)
            f = sum(X(k,:)*w);
            dz = Y(k)*X(k,:);
            z = dz*w;
            ldz = -exp(-z)/(1+exp(-z));
            l_rate = 1/10000;
            delta_w = l_rate*ldz*dz;
            risk(matrix_count) = log(1+exp(z));
            matrix_count = matrix_count +1;
            w = w + delta_w';
        end
    end
    figure(j+3)
    plot(risk(1:1000))
    hold on
    xlabel('Iterations')
    ylabel('Risk')
    hold off
    
end

%%
%Part 3 of the Question
for j = 1:3
    X = X_choice(:,((j-1)*57)+1:57*j);
    w = ones(57,1)/1000;
    risk = [];
    matrix_count = 1;
    for i = 1:1000
        for k = 1:length(X)
            f = sum(X(k,:)*w);
            dz = Y(k)*X(k,:);
            z = dz*w;
            z = z/1000;
            ldz = -exp(-z)/(1+exp(-z));
            l_rate = 1/(100000*i);
            delta_w = l_rate*ldz*dz;
            risk(matrix_count) = -log(1+exp(z));
            matrix_count = matrix_count +1;
            w = w + delta_w';
        end
    end
    figure(j+6)
    plot(risk)
    hold on
    xlabel('Iterations')
    ylabel('Risk')
    hold off
    
end




    
    




