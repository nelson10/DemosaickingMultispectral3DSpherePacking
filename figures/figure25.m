% Created by: Ph.D Nelson Eduardo Diaz Diaz
% Post-doctorado Pontícia Universidad Católica de Valparaíso (PUCV)
% Date 17 May 2022

function [NF]=figure25(N,NF)
%% Comparison 3D random and optimal spheres
%NF = 9;
%N = 256;
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
    [density]= ComputeDensity(minimum,NF);
    density = round(density,2);
    minimum = round(minimum,2);
    %    annotation('textbox',[.9 .5 .1 .2], ...
    %'String','Text outside the axes','EdgeColor','none')
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
    %view(40,35)
    grid on;
    %set(get(gca,'title'),'Position',[25.5 -8 1.00011])
    set(gca,'FontSize',fontsize,'Fontname','Times')
end
orient(fig,'landscape')
%print(fig,'figure25.png','-dpng','-r200')
print(fig,'figure25.eps','-depsc','-r400')
%print(fig,'figure25.pdf','-dpdf','-r400')
end