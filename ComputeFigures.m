% Created by: Ph.D Nelson Eduardo Diaz Diaz
% Post-doctorado Pontícia Universidad Católica de Valparaíso (PUCV)
% Date 2 February 2022

clear all;
close all;
%% Generate figures of the paper: Demosaicking Multispectral Images Based on Sphere Packing Filter Design
addpath(genpath('./Dataset'));
addpath(genpath('./codes'));
addpath(genpath('./RGB'));
addpath(genpath('./src'));
addpath(genpath('./Fig'));
addpath(genpath('./Pattern'));
addpath(genpath('./Results'));

%% Figure's selection
% Select 1 to compare coded apertures
% Select 2 to compare methods in terms of PSNR
% Select 3 to compare spatial correlation
% Select 4 to obtain upper bound
% Select 5 to compare spheres packing: 
figu = 5; 

if(figu == 1)
    figure1DistanceComparison();
elseif(figu == 2)
    figure2PSNRComparison();
%elseif(figu == 3)
 %   figure3();
elseif(figu == 4)
    figure4_simple();
elseif(figu == 5)
    NF = 16;
    N = 512;
    [~]=figure55(N,NF);
%     NF = 25;
%     N = 512;
%     [~]=figure25(N,NF);
end
