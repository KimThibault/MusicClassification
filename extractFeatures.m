% Kim Thibault 2019

clear ; close all; clc

[audio_data, fs] = audioread('genres/disco/disco.00000.wav');
[ceps,freqresp,fb,fbrecon,freqrecon] = mfcc(audio_data, fs, [10]) # TODO find optimal frame rate
