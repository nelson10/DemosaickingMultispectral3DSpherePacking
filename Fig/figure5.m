% Created by: Ph.D Nelson Eduardo Diaz Diaz
% Post-doctorado Pontícia Universidad Católica de Valparaíso (PUCV)
% Date 2 February 2022

function [NF]=figure5(N,NF)
%% Comparison 3D random and optimal spheres
%NF = 9;
%N = 256;
set(groot, 'defaultFigureUnits', 'centimeters', 'defaultFigurePosition', [0 0 30.86 30.8]);
code = 1;
[G] = codedPatterns(N,NF,code);
[T] = distance(G);
G = G(1:NF,1:NF);
minimum = min(T(:));

fontsize = 18;
radius = minimum/2;

fig=figure(1);
subplot(1,2,1)
showSphere(G,radius,fontsize); title("BTES"+num2str(NF)+" distance="+num2str(minimum), 'FontSize', fontsize)
set(gca,'FontSize',fontsize)
code = 6;
[G] = codedPatterns(N,NF,code);
G = G(1:NF,1:NF);
[T] = distance(G);
minimum = min(T(:));

radius = minimum/2;
subplot(1,2,2)
showSphere(G,radius,fontsize);title("Optimization minimum distance="+num2str(minimum), 'FontSize', fontsize)
set(gca,'FontSize',fontsize)

%printPDF('./figure2.pdf')
%saveas(fig,'figure2','pdf') %gcf,
orient(fig,'landscape')
print(fig,'figure2.pdf','-dpdf')
end