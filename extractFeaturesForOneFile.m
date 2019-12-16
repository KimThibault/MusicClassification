% Kim Thibault 2019

function [ceps,freqresp,fb,fbrecon,freqrecon] = extractFeaturesForOneFile(filename)

[audio_data, fs] = audioread(filename);

slice_start = ceil(size(audio_data)/2); #size(audio_data) = 664180 x 1
slice_end = ceil(9*size(audio_data)/16);

# TODO find optimal frame rate
[ceps,freqresp,fb,fbrecon,freqrecon] = mfcc(audio_data(slice_start:slice_end), fs, [16]);

end
