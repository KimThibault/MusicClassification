function visualizeBoundary(X, y, model, varargin)
%VISUALIZEBOUNDARY plots a non-linear decision boundary learned by the SVM
%   VISUALIZEBOUNDARYLINEAR(X, y, model) plots a non-linear decision 
%   boundary learned by the SVM and overlays the data on it

% Plot the training data on top of the boundary
plotData(X, y)
xlim([-0.2 0.5]) % graphic duct tape for the Kaggle data

% Make classification predictions over a grid of values
#min(X(:,1))  -0.13
#max(X(:,1))   7.4
#min(X(:,2))  -3.6
#max(X(:,2))  1.6
x1plot = linspace(min(X(:,1)), max(X(:,1)), 1000)';
x2plot = linspace(min(X(:,2)), max(X(:,2)), 1000)';
[X1, X2] = meshgrid(x1plot, x2plot);
vals = zeros(size(X1));
for i = 1:size(X1, 2)
   this_X = [X1(:, i), X2(:, i)];
   vals(:, i) = svmPredict(model, this_X);
end

#X1 varie très peu, même en considérant que les valeurs sont toutes autour de -0.13 à -0.14

% Plot the SVM boundary
hold on
contour(X1, X2, vals, [0.5, 0.5], 'LineColor', 'b')
%x = linspace(-10, 10, 100);
%y = linspace(-10, 10, 100);
%[X,Y] = meshgrid(x, y);
%vals= X.^2 + (Y.^2);
%contour(x,y,vals, [0.5, 0.5]);

hold off;

end
