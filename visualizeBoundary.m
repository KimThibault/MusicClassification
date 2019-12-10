function visualizeBoundary(X, y, model, varargin)
%VISUALIZEBOUNDARY plots a non-linear decision boundary learned by the SVM
%   VISUALIZEBOUNDARYLINEAR(X, y, model) plots a non-linear decision 
%   boundary learned by the SVM and overlays the data on it

% remove outliers
xcol1 = X(:,1);
xcol2 = X(:,2);
[xcol1, xcol2] = removeGaussianOutliers(xcol1, xcol2);

% Plot the training data on top of the boundary
plotData(X, y)
xlim([min(xcol1) - 0.1 max(xcol1) + 0.1])
ylim([min(xcol2) - 0.1 max(xcol2) + 0.1])


% Make classification predictions over a grid of values
x1plot = linspace(min(xcol1), max(xcol1), 500)';
x2plot = linspace(min(xcol2), max(xcol2), 500)';
[X1, X2] = meshgrid(x1plot, x2plot);
vals = zeros(size(X1));
for i = 1:size(X1, 2)
   this_X = [X1(:, i), X2(:, i)];
   vals(:, i) = svmPredict(model, this_X);
end


% Plot the SVM boundary
hold on
contour(X1, X2, vals, [0.5, 0.5], 'LineColor', 'b')
hold off;

end
