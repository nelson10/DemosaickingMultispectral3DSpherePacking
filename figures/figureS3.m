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

set(groot, 'defaultFigureUnits', 'centimeters', 'defaultFigurePosition', [0 0 100.86 30.8]);
fontsize = 18;
fig=figure(4);
x = ["(a)                        ","(b)                        ","(c)                        ","(d)                        ","(e)                        ","(f)                        ","(g)                        ","(h)                        "];
t = tiledlayout(2,4,'TileSpacing','Compact','Padding','Compact');
for i=1:8
    code = i-1; % 2 Brauers, 4 Uniform
    [G] = codedPatterns(N,NF,code);
    %[textcode] =checkCode2(code);
    G = G(1:NF,1:NF);
    [T] = distance(G);
    minimum = min(T(:));
    radius = minimum/2;
    [density,diameter]= ComputeDensity(minimum,NF,G);
    density = round(density,2);
    minimum = diameter;%round(minimum,2);
    nexttile
    showSphereGeneral(G,radius,fontsize);
    title("d="+num2str(minimum)+" \rho="+num2str(density), 'FontSize', fontsize,'Fontname','Times');
    xlabel([x(i)], 'FontSize', fontsize,'Fontname','Times');
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
print(fig,'figureS3.eps','-depsc','-r400')

