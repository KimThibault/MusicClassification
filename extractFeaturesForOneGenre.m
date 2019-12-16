function tracks_features = extractFeaturesForOneGenre(genre, n_tracks)

#TODO: extend to 13 mfccs
n_features = 4;

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
  
  mean_mfcc1 = mean(mfcc1);
  mean_mfcc2 = mean(mfcc2);
  mean_mfcc3 = mean(mfcc3);
  mean_mfcc4 = mean(mfcc4);
  
  tracks_features(i,1) = mean_mfcc1;
  tracks_features(i,2) = mean_mfcc2;
  tracks_features(i,3) = mean_mfcc3;
  tracks_features(i,4) = mean_mfcc4;
end  

end