% Created by: Ph.D Nelson Eduardo Diaz Diaz
% Post-doctorado Pontícia Universidad Católica de Valparaíso (PUCV)
% Date 2 February 2022

clear all;
load('optimalPattern_64x64_filter=31.mat')
load('measure.mat')

b = Y(:);
T = 1.0*(mask==1);
A = diag(T(:));
AA = pinv(A'*A)*A';
y = AA * b;
I = reshape(y,[64, 64]);
imagesc(I)

