function debugContour()
  
n_points = 100;  
radius = 0.5;

xrandom = 1 - 2*rand(n_points,1); 
yrandom = 1 - 2*rand(n_points,1);
# WIP trouver la relation entre xrandom et X, i.e. comment changer xrandom en X
X = [xrandom, yrandom];

# class 1 inside circle, 0 outside
vals_debug = xrandom.^2 + yrandom.^2 < radius^2;

plotData(X, vals_debug)
hold on

# anatomy of contour, original example from the internets
%x = linspace(-10, 10, 100);
%y = linspace(-10, 10, 100);
%[X,Y] = meshgrid(x, y);
%vals= X.^2 + (Y.^2);
%contour(x,y,vals, [0.5, 0.5]);

# invalid zdata (vals_debug)
contour(xrandom, yrandom, vals_debug, [0.5 0.5], 'LineColor', 'b')
hold off;

end