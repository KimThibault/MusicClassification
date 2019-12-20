# WIP

# Adaptation of k nearest neighbors where we check for neighbors of a point by slices of 
# increasing width to avoid checking all the n*(n-1) distances between points.

# Inputs: 
# k = num of neighbors
# matrix = data point x feature values
# coord = coordinates in feature space of the point whose neighbors to find

#function label = knnSlice(k, matrix, coord)

k = 3;
n_pts = 20;
matrix = rand(n_pts,3);
matrix(1:n_pts/2,1) = 0;
matrix(n_pts/2 + 1:n_pts,1) = 1;
coord = 0.5 * ones(1,3);

# Assuming a n_points x 3 matrix, i.e. 2 features + column 1 for labels. TODO: generalize
n_feats = 2;
ini_rad = 0.2; # features assumed normalized TODO: check for normalization

# We'll find how many and which points are within a small area around the point.
# If there are at least k, we'll stop.
radius = ini_rad;
n_points_in_hood = 0;

while n_points_in_hood < k
  x = matrix(:,2);
  y = matrix(:,3);
  x2 = coord(2);
  y2 = coord(3);
  dists = sqrt( (x2 .- x).^2 + (y2 .- y).^2 );

  matrix_slice = (dists < radius^2);
  n_points_in_hood = sum(matrix_slice);
  radius += 0.1;
end

reduced_matrix = matrix(matrix_slice == 1, :)

for i=1:n_points_in_hood
  x1 = reduced_matrix(i,2);
  y1 = reduced_matrix(i,3);
  x2 = coord(2);
  y2 = coord(3);
  dist = sqrt( (x2 - x1)^2 + (y2 - y1)^2 )
  
end

# TODO: take k nearest neighbors
# TODO: assign proper label to point
  
#end