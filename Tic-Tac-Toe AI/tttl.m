% Tic-Tac-Toe AI neural network training algorithm

%  Description
%  ------------
% 
%  This script uses the data gathered from the C++ tic-tac-toe program and
%  using the backward propogation learning algorithm, trains a neural network to 
%  improve the AI's ability to play tic tac toe
%     
%  External functions
%  ------------------
%  fmincg.m
%  randInitializeWeights.m
%  sigmoidGradient.m
%  sigmoid.m
%  nnCostFunction.m
%  loadData.m
%

% Initialization
clear ; close all; clc

% Setup the parameters
input_layer_size  = 9;  % 3x3 grid of moves
hidden_layer_size = 50;   % 5 hidden units
num_labels = 9;          % output with optimal move

%Load Training Data and split into the different catagories
%%loadData;
loadWins;

fprintf('training data from winning moves...\n');

%Initialize weights for the neural networks

init_theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
init_theta2 = randInitializeWeights(hidden_layer_size, num_labels);
init_params = [init_theta1(:) ; init_theta2(:)];

%specifying number of iterations and the regularization constant
options = optimset('MaxIter' , 300);
lambda = 0;

%specifying cost function used in regression
%input parameters are changed depending on which data is used
costFunction = @(p) nnCostFunction(p, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, xtrain, ytrain, lambda);


%regression funciton
[nn_params , cost] = fmincg(costFunction , init_params, options);

% Obtain Theta1 and Theta2 back from nn_params
Theta1win = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2win = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));
				 
csvwrite('Theta1win.csv' , Theta1win);
csvwrite('Theta2win.csv' , Theta2win);

%{
fprintf('training data from losing moves...\n');
%Initialize weights for the neural networks

init_theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
init_theta2 = randInitializeWeights(hidden_layer_size, num_labels);
init_params = [init_theta1(:) ; init_theta2(:)];

%specifying number of iterations and the regularization constant
options = optimset('MaxIter' , 50);
lambda = 1;

%specifying costfunction used in regression
costFunction = @(p) nnCostFunction(p , input_layer_size , hidden_layer_size , num_labels , xlose , ylose , lambda);

%regression funciton
[nn_params , cost] = fmincg(costFunction , init_params, options);

% Obtain Theta1 and Theta2 back from nn_params
Theta1lose = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2lose = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));
             
csvwrite('Theta1lose.csv' , Theta1lose);
csvwrite('Theta2lose.csv' , Theta2lose);


fprintf('training data from draw moves...\n');

%Initialize weights for the neural networks

init_theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
init_theta2 = randInitializeWeights(hidden_layer_size, num_labels);
init_params = [init_theta1(:) ; init_theta2(:)];

%specifying number of iterations and the regularization constant
options = optimset('MaxIter' , 50);
lambda = 1;

%specifying costfunction used in regression
costFunction = @(p) nnCostFunction(p , input_layer_size , hidden_layer_size , num_labels , xdraw , ydraw , lambda);

%regression funciton
[nn_params , cost] = fmincg(costFunction , init_params, options);

% Obtain Theta1 and Theta2 back from nn_params
Theta1draw = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2draw = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));
             
csvwrite('Theta1draw.csv' , Theta1draw);
csvwrite('Theta2draw.csv' , Theta2draw);
%}