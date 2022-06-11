% Created by: Ph.D Nelson Eduardo Diaz Diaz
% Post-doctorado Pontícia Universidad Católica de Valparaíso (PUCV)
% Date 2 February 2022

function [NF]=figure5(N,NF)
%% Comparison 3D random and optimal spheres
%NF = 9;
%N = 256;
set(groot, 'defaultFigureUnits', 'centimeters', 'defaultFigurePosition', [0 0 100.86 30.8]);
fontsize = 16;

code = 2; % 2 Brauers, 4 Uniform
[G] = codedPatterns(N,NF,code);
G = G(1:NF,1:NF);
[T] = distance(G);
minimum = min(T(:));
radius = minimum/2;
[density]= ComputeDensity(minimum,NF);
density = round(density,2);
minimum = round(minimum,2);

fig=figure(1);
subplot(1,4,1)
showSphere(G,radius,fontsize); title("d(256)_{Brauers}="+num2str(minimum)+" \rho(256)_{Brauers}="+num2str(density), 'FontSize', fontsize)
set(gca,'FontSize',fontsize)

code = 5; % 5 IMEC
[G] = codedPatterns(N,NF,code);
G = G(1:NF,1:NF);
[T] = distance(G);
minimum = min(T(:));
radius = minimum/2;
[density]= ComputeDensity(minimum,NF);
density = round(density,2);
minimum = round(minimum,2);

subplot(1,4,2)
showSphere(G,radius,fontsize); title("d(256)_{IMEC}="+num2str(minimum)+" \rho(256)_{IMEC}="+num2str(density), 'FontSize', fontsize)
set(gca,'FontSize',fontsize)

code = 1; % 1 is BTES
[G] = codedPatterns(N,NF,code);
[T] = distance(G);
G = G(1:NF,1:NF);
minimum = min(T(:));
[density]= ComputeDensity(minimum,NF);
density = round(density,2);
radius = minimum/2;
minimum = round(minimum,2);

subplot(1,4,3)
showSphere(G,radius,fontsize); title("d(256)_{BTES}="+num2str(minimum)+" \rho(256)_{BTES}="+num2str(density), 'FontSize', fontsize)
set(gca,'FontSize',fontsize)


code = 6; % 6 Sphere packing 
[G] = codedPatterns(N,NF,code);
G = G(1:NF,1:NF);
[T] = distance(G);
minimum = min(T(:));
[density]= ComputeDensity(minimum,NF);
density = round(density,2);
radius = (minimum/2);
minimum = round(minimum,2);

subplot(1,4,4)
showSphere(G,radius,fontsize);title("d(256)_{OSP}="+num2str(minimum)+" \rho(256)_{OSP}="+num2str(density), 'FontSize', fontsize)
set(gca,'FontSize',fontsize)


%printPDF('./figure2.pdf')
%saveas(fig,'figure2','pdf') %gcf,
orient(fig,'landscape')
print(fig,'figure1.png','-dpng','-r200') %'-dpdf'
end