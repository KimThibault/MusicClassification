%% Notes
%% Toutes les routines qui sont appelées dans ce programme viennent du cours de 
%% Andrew Ng et peuvent avoir été adaptées. 
%%
%% Les indices commencent a 1
%% Les indices matriciels sont 1 -> row et 2 -> col
%% Pour lire fichier .mat en Octave: load MyMatFile.mat right at the Octave prompt

clear ; close all; clc

n_tracks = 100;
disco_tracks_features = extractFeaturesForOneGenre('disco', n_tracks);
rock_tracks_features = extractFeaturesForOneGenre('rock', n_tracks);

prop_train = 0.8;
prop_crossval = 0.1;
prop_test = 0.1;

n_train = prop_train * n_tracks;
n_crossval = prop_crossval * n_tracks;
n_test = prop_test * n_tracks;

% Split sets into train, cross-validation and test data
% Remove first row, which contains the column names
data_train_genre1 = disco_tracks_features(1:n_train, :); 
data_crossval_genre1 = disco_tracks_features(1 + n_train : n_train + n_crossval, :); 
data_test_genre1 = disco_tracks_features(1 + n_train + n_crossval : end, :); 

data_train_genre2 = rock_tracks_features(1:n_train, :); 
data_crossval_genre2 = rock_tracks_features(1 + n_train : n_train + n_crossval, :); 
data_test_genre2 = rock_tracks_features(1 + n_train + n_crossval : end, :); 


% select certain features to plot 2 by 2 graph
# Mean MFCCs 1-2, 1-3, 1-4, 2-3, 2-4, 3-4 pas separables
feat1 = 3;
feat2 = 4;
X = [[data_train_genre1(1:n_train, feat1:feat2)]', [data_train_genre2(1:n_train, feat1:feat2)]']'; 
[X, mu, sigma] = featureNormalize(X);

y = [zeros(1, n_train), ones(1, n_train)]';
plotData(X,y);
#xlim([-0.2 0]);

C = 100;
model = svmTrain(X, y, C, @linearKernel, 1e-3, 20);
visualizeBoundaryLinear(X, y, model)



%
%C = 1000; 
%sigma = 0.3;
%x1 = [-0.13 -0.135 -0.135 -0.14]; 
%x2 = [0 1.5 -0.5 0]; 
%
%model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma)); 
%visualizeBoundary(X, y, model);
