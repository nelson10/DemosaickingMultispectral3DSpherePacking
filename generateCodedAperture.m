% Created by: Ph.D Nelson Eduardo Diaz Diaz
% Post-doctorado Pontícia Universidad Católica de Valparaíso (PUCV)
% Date 2 February 2022

% Comparison of minimum distance
% Solution using the Discrete Sphere Packing based on 3D N^2 Queens
% Approach

% Solution using The 3-D N2-Queens problem
clear;
close all
clc
addpath(genpath('./utils'));
addpath(genpath('./results'));
N = 256;
NF = 16; % Number of filters
x = ones(N,1);
y = (1:N)';
I = kron(x',y);
J = kron(x,y');
[a,b,dist]=DDDRSNNP2(N,NF);
a(1)
b(1)
si = a(1);
sj = b(1);
G = mod(I.*si + J.*sj,NF)+1;
mask = G;
imagesc(mask==1),colormap('gray')
G(1:8,1:8)
ti = "Pattern/optimalPattern_"+num2str(N)+"x"+num2str(N)+"_filter="+num2str(NF)+".mat";
save(ti,'mask','dist')