% Created by: Ph.D Nelson Eduardo Diaz Diaz
% Post-doctorado Pontícia Universidad Católica de Valparaíso (PUCV)
% Date 17 May 2022

function [NF]=figure55(N,NF)
%% Comparison 3D random and optimal spheres
%NF = 9;
%N = 256;

%fig = figure(1);
fig = figure('Renderer', 'painters', 'Position', [10 10 1500 1200]);
set(groot, 'defaultFigureUnits', 'centimeters', 'defaultFigurePosition', [0 0 100.86 30.8]);
fontsize = 16;

for i=1:8
    code = i-1; % 2 Brauers, 4 Uniform
    [G] = codedPatterns(N,NF,code);
    [textcode] =checkCode2(code);
    G = G(1:NF,1:NF);
    [T] = distance(G);
    minimum = min(T(:));
    radius = minimum/2;
    [density]= ComputeDensity(minimum,NF);
    density = round(density,2);
    minimum = round(minimum,2);
    
    subplot(2,4,i)
    %imagesc(G)
    showSphere(G,radius,fontsize); title("d_{"+textcode+"}="+num2str(minimum)+" \rho_{"+textcode+"}="+num2str(density), 'FontSize', fontsize)
    %pbaspect([1 1 1])
    set(gca,'FontSize',fontsize)
end
orient(fig,'landscape')
set(gcf, 'PaperPosition', [0 0 18 10]); %Position plot at left hand corner with width 5 and height 5.
set(gcf, 'PaperSize', [18 10]); %Set the paper to have width 5 and height 5.


%print(fig,'figure1.png','-dpng','-r400') 
print(fig,'figure1.eps','-depsc','-r400')
end