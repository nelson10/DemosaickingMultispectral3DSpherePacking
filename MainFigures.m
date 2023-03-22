%% This main reproduce all the figures in the following paper: Multispectral Filter Array Design by Optimal Sphere Packing
% summited for publication in Transaction on Image Processing 
% Authors: Nelson Diaz, Alejandro Alvarado, Pablo Meza, Felipe Guzman, Esteban Vera

clear all;
clc;
close all;
%% Add path to the dataset
addpath(genpath('./Dataset'));
addpath(genpath('./figures'));
addpath(genpath('./src'));

figure2(); % Fig 2: sphere packing upper bound 
figure3(); % Fig 3: MSFA patterns
figure3_1(); % Fig 3: Coded aperture 1st band
figure4(); % Fig 4: sphere packing 16 filters
figure5(); % Fig 5: sphere packing 25 filters
figure6(); % Fig 6: spatial accuracy
figure7(); % Fig 7: spectral accuracy
%figure3fourier(); % % Fig 3: MSFA patterns in Fourier
