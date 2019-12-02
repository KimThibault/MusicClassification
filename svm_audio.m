%% Notes
%% Toutes les routines qui sont appelées dans ce programme viennent du cours de 
%% Andrew Ng et peuvent avoir été adaptées. 
%%
%% Les indices commencent a 1
%% Les indices matriciels sont 1 -> row et 2 -> col
%% Pour lire fichier .mat en Octave: load MyMatFile.mat right at the Octave prompt

clear ; close all; clc

set_genre1 = dlmread ('audio-features/party_audio.csv',',',1,0);
set_genre2 = dlmread ('audio-features/dinner_audio.csv',',',1,0);

dims_set_genre1 = size(set_genre1);
n_genre1 = dims_set_genre1(1);

dims_set_genre2 = size(set_genre2);
n_genre2 = dims_set_genre2(1);

n_per_genre = min(n_genre1, n_genre2);

n_train_genre2 = floor(n_per_genre * 0.8);
n_crossval_genre2 = floor(n_per_genre * 0.1);
n_test_genre2 = floor(n_per_genre * 0.1);
n_train_genre1 = floor(n_per_genre * 0.8);
n_crossval_genre1 = floor(n_per_genre * 0.1);
n_test_genre1 = floor(n_per_genre * 0.1);



% Split sets into train, cross-validation and test data
% Remove first row, which contains the column names
data_train_genre1 = set_genre1(2:1+n_train_genre1, 3:end); 
data_test_genre1 = set_genre1(n_train_genre1 + 2 : n_train_genre1 + n_crossval_genre1 + n_test_genre1 + 1, 3:end); 

data_train_genre2 = set_genre2(1:n_train_genre2, 3:end); 
data_test_genre2 = set_genre2(n_train_genre2 + n_crossval_genre2 + 1 : n_train_genre2 + n_crossval_genre2 + n_test_genre2, 3:end); 


%% Entrainement du modele
n_train_per_genre = min(n_train_genre2, n_train_genre1);
% select certain features to plot 2 by 2 graph
X = [[data_train_genre1(1:n_train_per_genre, 3:4)]', [data_train_genre2(1:n_train_per_genre, 3:4)]']'; 
[X, mu, sigma] = featureNormalize(X);

% assigne étiquette 0 à une catégorie et 1 à l'autre
y = [zeros(1, n_train_per_genre), ones(1, n_train_per_genre)]';
plotData(X,y);
xlim([-0.16 -0.12]);

C = 10000; 
model = svmTrain(X, y, C, @linearKernel, 1e-3, 8); 
#w =
#       205.1587
#        -1.1597
# Ca semble mauvais
# b = 26.9 

#visualizeBoundaryLinear(X, y, model); 

#x1 = [1 2 1]; 
#x2 = [0 4 -1]; 
x1 = X(:,1);
x2 = X(:,2);
sigma = 1;
sim = gaussianKernel(x1, x2, sigma);
visualizeBoundary(X, y, model, 0.5);
