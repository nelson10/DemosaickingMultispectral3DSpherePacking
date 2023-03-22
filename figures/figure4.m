%% Created by: Ph.D Nelson Eduardo Diaz Diaz
% Post-doctorado Pontícia Universidad Católica de Valparaíso (PUCV)
% Date 2 February 2022

%% Fig. 4: SP density comparison of MSFAs coding patterns with 16 filters and no dominant one. The first row depicts the MSFAs (a) RND, (b) BN CAs [10],
% (c) BRA [12], and (d) SEQ. The second row shows the MSFAs (e) UNIF, (f) IMEC [6], (g) BTES [5], and the proposed (h) MSFA-OSP computed using
% Eq. (7). State-of-the-art MSFAs experiments have corresponding sphere%s diameter lower than the sphere s diameter of the OSP approach. Six state-of-the-art
% MSFAs have the same sphere$s diameter and, therefore, the same SP density, corresponding to 1.41 and 0.08, respectively. The coding pattern BTES has
% sphere%s diameter of 1.73 and the SP density of 0.14; the MSFA-OSP sphere s diameter is 2.44 and reaches a SP density of 0.4.


%% Generate figures of the paper: Demosaicking Multispectral Images Based on Sphere Packing Filter Design
addpath(genpath('./Dataset'));
addpath(genpath('./codes'));
addpath(genpath('./RGB'));
addpath(genpath('./src'));
addpath(genpath('./Fig'));
addpath(genpath('./Pattern'));
addpath(genpath('./Results'));

% to compare spheres packing:

NF = 16;
N = 256;
[~]=figure44(N,NF); % 16 filters

