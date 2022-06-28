% Created by: Ph.D Nelson Eduardo Diaz Diaz
% Post-doctorado Pontícia Universidad Católica de Valparaíso (PUCV)
% Date 17 May 2022

function [NF]=figure55(N,NF)
%% Comparison 3D random and optimal spheres
%NF = 9;
%N = 256;


%fig = figure('Renderer', 'painters', 'Position', [10 10 1500 1200]);
set(groot, 'defaultFigureUnits', 'centimeters', 'defaultFigurePosition', [0 0 100.86 30.8]);
fontsize = 18;
fig=figure(1);
x = ["                  (a)","                  (b)","                  (c)","                  (d)","                  (e)","                  (f)","                  (g)","                  (h)"];
t = tiledlayout(2,4,'TileSpacing','Compact','Padding','Compact');
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
    
    %subplot(2,4,i)
    %imagesc(G)
    nexttile
    showSphere(G,radius,fontsize); 
    %title("d_{"+textcode+"}="+num2str(minimum)+" \rho_{"+textcode+"}="+num2str(density), 'FontSize', fontsize,'Fontname','Times');
    title("d="+num2str(minimum)+" \rho="+num2str(density), 'FontSize', fontsize,'Fontname','Times');
    xlabel(['X',x(i)], 'FontSize', fontsize,'Fontname','Times');
    ylabel('Y', 'FontSize', fontsize,'Fontname','Times');
    zlabel('\lambda', 'FontSize', fontsize,'Fontname','Times');
    axis equal;
    colormap jet;
    hold on
    view(40,35)
    grid on;
    set(gca,'FontSize',fontsize,'Fontname','Times')
end
orient(fig,'landscape')

%print(fig,'figure1.png','-dpng','-r400') 
print(fig,'figure1.eps','-depsc','-r400')
end