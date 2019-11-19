%% Notes
%% Toutes les routines qui sont appelées dans ce programme viennent du cours de 
%% Andrew Ng et peuvent avoir été adaptées. 
%%
%% Les indices commencent a 1
%% Les indices matriciels sont 1 -> row et 2 -> col
%% Pour lire fichier .mat en Octave: load MyMatFile.mat right at the Octave prompt

clear ; close all; clc

party_set = dlmread ('audio-features/party_audio.csv',',',1,0);
dinner_set = dlmread ('audio-features/dinner_audio.csv',',',1,0);

dims_party_set = size(party_set);
n_party = dims_party_set(1);

dims_dinner_set = size(dinner_set);
n_dinner = dims_dinner_set(1);

n_per_genre = min(n_party, n_dinner);

n_train_dinner = floor(n_per_genre * 0.8);
n_crossval_dinner = floor(n_per_genre * 0.1);
n_test_dinner = floor(n_per_genre * 0.1);
n_train_party = floor(n_per_genre * 0.8);
n_crossval_party = floor(n_per_genre * 0.1);
n_test_party = floor(n_per_genre * 0.1);

%if (n_test_dinner < 3) 
%  'The dinner test set is too small'
%if (n_test_party < 3) 
%  'The party test set is too small'

% Split sets into train, cross-validation and test data
% Remove first row, which contains the column names
data_train_party = party_set(2:1+n_train_party, 3:end); 
data_test_party = party_set(n_train_party + 2 : n_train_party + n_crossval_party + n_test_party + 1, 3:end); 

data_train_dinner = dinner_set(1:n_train_dinner, 3:end); 
data_test_dinner = dinner_set(n_train_dinner + n_crossval_dinner + 1 : n_train_dinner + n_crossval_dinner + n_test_dinner, 3:end); 


%% Entrainement du modele
n_train_per_genre = min(n_train_dinner, n_train_party);
% select certain features to plot 2 by 2 graph
X = [[data_train_party(1:n_train_per_genre, 3:4)]', [data_train_dinner(1:n_train_per_genre, 3:4)]']'; 

% assigne étiquette 0 à une catégorie et 1 à l'autre
y = [zeros(1, n_train_per_genre), ones(1, n_train_per_genre)]';
plotData(X,y)
xlim([18 25])

%C = 10000; 
%model = svmTrain(X, y, C, @linearKernel, 1e-3, 8); 
%visualizeBoundaryLinear(X, y, model); 
