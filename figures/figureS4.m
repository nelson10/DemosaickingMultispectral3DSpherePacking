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

set(groot, 'defaultFigureUnits', 'centimeters', 'defaultFigurePosition', [0 0 100.86 30.8]);
fontsize = 18;
fig=figure(5);
cd=[5,7];
t = tiledlayout(1,2,'TileSpacing','Compact','Padding','Compact');
x = ["                                        (a)","                                        (b)"];
for i=1:2
    code = cd(i); % 2 Brauers, 4 Uniform
    [G] = codedPatterns(N,NF,code);
    [textcode] =checkCode2(code);
    G = G(1:NF,1:NF);
    [T] = distance(G);
    minimum = min(T(:));
    radius = minimum/2;
    [density,diameter]= ComputeDensity(minimum,NF,G);
    density = round(density,2);
    minimum = round(minimum,2);
    nexttile
    showSphereGeneral(G,radius,fontsize);
    title("d="+num2str(minimum)+" \rho="+num2str(density), 'FontSize', fontsize,'Fontname','Times');
    xlabel(['X',x(i)], 'FontSize', fontsize,'Fontname','Times');
    ylabel('Y', 'FontSize', fontsize,'Fontname','Times');
    zlabel('\lambda', 'FontSize', fontsize,'Fontname','Times');
    axis equal;
    colormap jet;
    hold on
    %view(40,35)
    grid on;
    set(gca,'FontSize',fontsize,'Fontname','Times')
end
orient(fig,'landscape')
print(fig,'figureS4.eps','-depsc','-r400')