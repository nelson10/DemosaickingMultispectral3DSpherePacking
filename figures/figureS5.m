%% Created by: Ph.D Nelson Eduardo Diaz Diaz
% Post-doctorado Pontícia Universidad Católica de Valparaíso (PUCV)
% Date 2 February 2022

%% Fig. 3 Comparison between MSFAs with a spatial resolution 16 × 16, and spectral resolution 16.
% (a) RND, (b) BN, (c) BRA, (d) SEQ, (e) UNIF, (f) IMEC,(g) BTES, (h) OSP.
%

%% add directories
addpath(genpath('./Results'));
addpath(genpath('./Pattern'));
addpath(genpath('./src'));

fontsize = 14;
cd = [0 1 2 3 4 5 6 7];
N = 512; % Spatial resolution
NF = 16; % Number of filters
FontSize= 18;
name = {'RND','BN','BRA','SEQ','UNIF','IMEC','BTES','OSP'};
letters={'a','b','c','d','e','a','g','b','i','j','k'};
fig=figure(13);
t = tiledlayout(2,4,'TileSpacing','Compact','Padding','Compact');
for i=1:8
    code = cd(i); % 2 Brauers, 4 Uniform
    [G] = codedPatterns(N,NF,code);
    textcode=name{i};
    G = G(1:50,1:50);
    [T] = distance(G);
    minimum = min(T(:));
    radius = minimum/2;
    [density]= ComputeDensity(minimum,NF);
    density = round(density,2);
    minimum = round(minimum,2);
    nexttile
    plotG(G),title(textcode, 'FontSize', 14), axis off;
    t = text(8.5,-0.25,strcat('( ',letters(i),')'),'HorizontalAlignment', 'center','FontWeight','bold','FontSize',1.2*FontSize);
    pbaspect([1 1 1])
end