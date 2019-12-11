function debugContour()
% class 1 is inside circle, 0 outside

n_points = 100;  
radius = 0.5;
X = 1 - 2*rand(n_points, 2);
y = int8(X(:,1).^2 + X(:,2).^2 < radius^2);

plotData(X, y)
hold on

# values from -1 to 1
xplot = linspace(-1, 1, n_points)'; 
yplot = linspace(-1, 1, n_points)'; 
[XX,YY] = meshgrid(xplot, yplot); 
vals_debug = zeros(size(XX));
for i = 1:size(XX, 2)
   this_X = [XX(:, i), YY(:, i)]; 
   vals_debug(:, i) = int8(this_X(:,1).^2 + this_X(:,2).^2 < radius^2); 
end
 
contour(xplot, yplot, vals_debug, [0.5 0.5], 'LineColor', 'b')
hold off;

end