function [x_out, y_out] =  removeGaussianOutliers(x_in, y_in)
% This function assumes a 2D gaussian distribution, removes all points outside 
% three standard deviations from the mean, and returns the points that are within 
% three standard deviations.
  
xcol1 = x_in;
xcol2 = y_in;  
  
thres_col1 = mean(xcol1) + 3*std(xcol1); # std is 1, this is suspect ######
thres_col2 = mean(xcol2) + 3*std(xcol2); 
idx_to_keep = find(xcol1 < thres_col1 & xcol1 > -1*thres_col1 & xcol2 < thres_col2 & xcol2 > -1*thres_col2);
xcol1 = xcol1(idx_to_keep);
xcol2 = xcol2(idx_to_keep);  
  
x_out = xcol1;
y_out = xcol2; 
  
  
  
end  