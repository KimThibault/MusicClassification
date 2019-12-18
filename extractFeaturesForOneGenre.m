function tracks_features = extractFeaturesForOneGenre(genre, n_tracks)

#TODO: add features other than mean mfccs: std, skewness, kurtosis
n_features = 13;

tracks_features = zeros(n_tracks, n_features);

#ceps a 13x481
#freqresp et freqrecon ont 256x481
#fb et fbrecon ont 40x481

for i=1:n_tracks
  filename = strcat('genres/', genre, '/', genre, '.', stringifyNum(i-1), '.wav');
  [ceps,freqresp,fb,fbrecon,freqrecon] = extractFeaturesForOneFile(filename);
  
  mfcc1 = ceps(1,:);
  mfcc2 = ceps(2,:);
  mfcc3 = ceps(3,:);
  mfcc4 = ceps(4,:);
  mfcc5 = ceps(5,:);
  mfcc6 = ceps(6,:);
  mfcc7 = ceps(7,:);
  mfcc8 = ceps(8,:);
  mfcc9 = ceps(9,:);
  mfcc10 = ceps(10,:);
  mfcc11 = ceps(11,:);
  mfcc12 = ceps(12,:);
  mfcc13 = ceps(13,:);
  
  mean_mfcc1 = mean(mfcc1);
  mean_mfcc2 = mean(mfcc2);
  mean_mfcc3 = mean(mfcc3);
  mean_mfcc4 = mean(mfcc4);
  mean_mfcc5 = mean(mfcc5);
  mean_mfcc6 = mean(mfcc6);
  mean_mfcc7 = mean(mfcc7);
  mean_mfcc8 = mean(mfcc8);
  mean_mfcc9 = mean(mfcc9);
  mean_mfcc10 = mean(mfcc10);
  mean_mfcc11= mean(mfcc11);
  mean_mfcc12 = mean(mfcc12);
  mean_mfcc13 = mean(mfcc13);
  
  tracks_features(i,1) = mean_mfcc1;
  tracks_features(i,2) = mean_mfcc2;
  tracks_features(i,3) = mean_mfcc3;
  tracks_features(i,4) = mean_mfcc4;
  tracks_features(i,5) = mean_mfcc5;
  tracks_features(i,6) = mean_mfcc6;
  tracks_features(i,7) = mean_mfcc7;
  tracks_features(i,8) = mean_mfcc8;
  tracks_features(i,9) = mean_mfcc9;
  tracks_features(i,10) = mean_mfcc10;
  tracks_features(i,11) = mean_mfcc11;
  tracks_features(i,12) = mean_mfcc12;
  tracks_features(i,13) = mean_mfcc13;
end  

end