clear all;
clc;
%% add directories
addpath(genpath('./Results'));
addpath(genpath('./Pattern'));
addpath(genpath('./src'));

fontsize = 18;
cd = [0 1 2 3 4 5 6 7];
N = 512; % Spatial resolution
NF = 16; % Number of filters
set(groot, 'defaultFigureUnits', 'centimeters', 'defaultFigurePosition', [0 0 100.86 30.8]);
fig = figure(10)

x = ["                      (a)                          ","                      (b)                          ","                      (c)                          ","                      (d)                          ","                      (e)                          ","                      (f)                          ","                          (g)                           ","                          (h)                          "];
t = tiledlayout(2,4,'TileSpacing','Compact','Padding','Compact');
for i=1:8
    code = cd(i); % 2 Brauers, 4 Uniform
    [G] = codedPatterns(N,NF,code);
    [textcode] =checkCode2(code);
    G1 = G(1:NF,1:NF);
    [r,c,z] = find(G1);
    B = [r c z];
    D = pdist(B);
    T = min(D(:)); % minimal value between <v,v> for all v \in r
    minimum = min(T(:));
    radius = minimum/2;
    [density]= ComputeDensity(minimum,NF,G1);
    density = round(density,2);
    minimum = round(minimum,2);
    nexttile
    imshow(G(1:64,1:64)==1,[]),title(textcode+", 1st Band ", 'FontSize', fontsize), axis off;
    xlabel([x(i)], 'FontSize', fontsize,'Fontname','Times');
    pbaspect([1 1 1])
end
print(fig,'figureS2.eps','-depsc','-r400')
