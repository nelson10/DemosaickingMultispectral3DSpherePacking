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
figure

t = tiledlayout(2,4,'TileSpacing','Compact','Padding','Compact');
for i=1:8
    code = cd(i); % 2 Brauers, 4 Uniform
    [G] = codedPatterns(N,NF,code);
    [textcode] =checkCode2(code);
    G = G(1:NF,1:NF);
    [T] = distance(G);
    minimum = min(T(:));
    radius = minimum/2;
    [density]= ComputeDensity(minimum,NF,G);
    density = round(density,2);
    minimum = round(minimum,2);
    nexttile
    imshow(G==1,[]),title(textcode+", 1st Band ", 'FontSize', fontsize), axis off;%colorbar;
    pbaspect([1 1 1])
end