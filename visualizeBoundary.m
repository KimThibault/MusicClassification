function visualizeBoundary(X, y, model, varargin)
%VISUALIZEBOUNDARY plots a non-linear decision boundary learned by the SVM
%   VISUALIZEBOUNDARYLINEAR(X, y, model) plots a non-linear decision 
%   boundary learned by the SVM and overlays the data on it

% Plot the training data on top of the boundary
plotData(X, y)
xlim([-0.2 0]) % graphic duct tape for the Kaggle data; TODO: generalize

% Make classification predictions over a grid of values
xcol1 = X(:,1);
xcol2 = X(:,2);
idx_to_keep = find(xcol1 < 0); # remove outlier; TODO: generalize using standard deviation
xcol1 = xcol1(idx_to_keep);
xcol2 = xcol2(idx_to_keep);

x1plot = linspace(min(xcol1), max(xcol1), 1000)';
x2plot = linspace(min(xcol2), max(xcol2), 1000)';
[X1, X2] = meshgrid(x1plot, x2plot);
vals = zeros(size(X1));
for i = 1:size(X1, 2)
   this_X = [X1(:, i), X2(:, i)];
   vals(:, i) = svmPredict(model, this_X);
end


% Plot the SVM boundary
hold on
contour(X1, X2, vals, [0.5, 0.5], 'LineColor', 'b')

#vals_debug = ((X1 - mean(X1)).^2) + ((X2 - mean(X2)).^2);
#contour(X1, X2, vals_debug, [0:0.2:1], 'LineColor', 'b')

%x = linspace(-10, 10, 100);
%y = linspace(-10, 10, 100);
%[X,Y] = meshgrid(x, y);
%vals= X.^2 + (Y.^2);
%contour(x,y,vals, [0.5, 0.5]);

hold off;

end
