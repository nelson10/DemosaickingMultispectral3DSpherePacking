% Created by: Ph.D Nelson Eduardo Diaz Diaz
% Post-doctorado Pontícia Universidad Católica de Valparaíso (PUCV)
% Date 17 May 2022

function [NF]=figure25(N,NF)
%% Comparison 3D random and optimal spheres
%NF = 9;
%N = 256;
set(groot, 'defaultFigureUnits', 'centimeters', 'defaultFigurePosition', [0 0 100.86 30.8]);
fontsize = 16;

fig=figure(1);
cd=[5,7];
for i=1:2
    code = cd(i); % 2 Brauers, 4 Uniform
    [G] = codedPatterns(N,NF,code);
    [textcode] =checkCode2(code);
    G = G(1:NF,1:NF);
    [T] = distance(G);
    minimum = min(T(:));
    radius = minimum/2;
    [density]= ComputeDensity(minimum,NF);
    density = round(density,2);
    minimum = round(minimum,2);
    
    subplot(1,2,i)
    showSphere(G,radius,fontsize); title("d(625)_{"+textcode+"}="+num2str(minimum)+" \rho(625)_{"+textcode+"}="+num2str(density), 'FontSize', fontsize)
    set(gca,'FontSize',fontsize)
end
orient(fig,'landscape')
print(fig,'figure25.png','-dpng','-r200') 
end