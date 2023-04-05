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

fontsize = 18;
cd = [0 1 2 3 4 5 6 7];
N = 512; % Spatial resolution
NF = 16; % Number of filters

set(groot, 'defaultFigureUnits', 'centimeters', 'defaultFigurePosition', [0 0 100.86 30.8]);
fig = figure(3);
x = ["                      (a)                          ","                      (b)                          ","                      (c)                          ","                      (d)                          ","                      (e)                          ","                      (f)                          ","                          (g)                           ","                          (h)                          "];
t = tiledlayout(2,4,'TileSpacing','Compact','Padding','Compact');

for i=1:8
    code = cd(i); % 2 Brauers, 4 Uniform
    [G] = codedPatterns(N,NF,code);
    [textcode] =checkCode2(code);
    G = G(1:NF,1:NF);

    [r,c,z] = find(G);
    B = [r c z];
    D = pdist(B);
    [minimum] = min(D(:)); % minimal value between <v,v> for all v \in r
    radius = minimum/2;
    [density]= ComputeDensity(minimum,NF,G);
    density = round(density,2);
    minimum = round(minimum,2);
    nexttile
    imagesc(G(1:NF,1:NF)),title(textcode, 'FontSize', 14),colormap("jet");
    xticks([])
    yticks([])
    xlabel(['',x(i)], 'FontSize', fontsize,'Fontname','Times');
    grid off;
    hold on;
    pbaspect([1 1 1])
end
print(fig,'figure3.eps','-depsc','-r400')