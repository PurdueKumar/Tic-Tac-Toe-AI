x = load('winx.csv');
y = load('winy.csv');

xtrain = x(1:3000,:);
ytrain = y(1:3000,:);

xtest = x(3001:end , :);
ytest = y(3001:end , :);