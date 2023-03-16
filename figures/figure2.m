%% Created by: Ph.D Nelson Eduardo Diaz Diaz
% Post-doctorado Pontícia Universidad Católica de Valparaíso (PUCV)
% Date 2 February 2022

% Fig. 2: SP density comparison for different dimensions; (blue line) theoretical
% upper bound where the cubic container has size (M + 1)3, and the total
% number of spheres is V = M N ; (red line) best known optimal sphere packing
% without the MSFA restriction; (green line) OSP density with MSFA restriction.

clear all;
close all;
close all;
%% Generate figures of the paper: Demosaicking Multispectral Images Based on Sphere Packing Filter Design
addpath(genpath('./Dataset'));
addpath(genpath('./codes'));
addpath(genpath('./RGB'));
addpath(genpath('./src'));
addpath(genpath('./Fig'));
addpath(genpath('./Pattern'));
addpath(genpath('./Results'));

% to obtain upper bound

figure4_simple();
