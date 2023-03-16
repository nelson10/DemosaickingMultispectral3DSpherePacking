%% Created by: Dr. Nelson Eduardo Diaz Diaz
% Post-doctorado Pontícia Universidad Católica de Valparaíso (PUCV)
% Date 2 February 2022

%%Fig. 5.  SP density comparison using IMEC and OSP coding patterns. Two MSFA compared are (a) IMEC and (b) MSFA-OSP, both patterns have 25 filters
% with no dominant ones. The SP on the left depicts IMEC with kernel 5 × 5 with L = 25 [6], and the SP on the right shows the proposed MSFA-OSP
%computed using Eq. (7) with kernel 25 × 25. The corresponding IMEC sphere·s diameter is lower than the diameter of the MSFA-OSP approach. IMEC
%sphere's diameter is 1.41, and the SP density is 0.05; the sphere.s diameter of the MSFA-OSP is 3 and reaches a SP density of 0.5.

%% Generate figures of the paper: Demosaicking Multispectral Images Based on Sphere Packing Filter Design
addpath(genpath('./Dataset'));
addpath(genpath('./codes'));
addpath(genpath('./RGB'));
addpath(genpath('./src'));
addpath(genpath('./Fig'));
addpath(genpath('./Pattern'));
addpath(genpath('./Results'));

clear all;
clc;

NF = 25;
N = 256;
[~]=figure25(N,NF);% 25 filters