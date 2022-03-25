% Created by: Ph.D Nelson Eduardo Diaz Diaz
% Post-doctorado Pontícia Universidad Católica de Valparaíso (PUCV)
% Date 2 February 2022

%% Compare BTES Against Designed patterns
close all;
clc;
N = 512; % Spatial resolution
NF = 16; % Number of bands put 8 or 16
method = 6; % 1 Convolution Filter (CF), 2 Iterative Intensity Difference (IID), 3 Intensity Difference (ID), 4 Weighted Billinear Method, 5  Scattered data interpolation methods
code = 6; % 0 Random, 1 Binary Tree-based edge-sensing (BTES), 2 (Brauers and Aach, 2006)
d = 32;

[textmethod] = checkMethod(method);
[textcode] =checkCode(code);

texto = "Results/results_NF="+num2str(NF)+"_N="+num2str(N)+"_Coded_Aperture="+textcode+"_Method="+textmethod+"_datasetsize="+d+".mat";
load(texto);
figure('Renderer', 'painters', 'Position', [10 10 900 600])
fontsize = 14;
set(gca,'FontSize',fontsize)
hold on;
grid on;
plot(table(:,1,2),'-b','LineWidth',1.5)
hold on;
grid on;

texto = "Designed Against "+textcode;
xlabel('Dataset','FontSize',fontsize)
ylabel('Reconstruction Quality','FontSize',fontsize)
plot(table(:,1,7),'-r','LineWidth',1.5),title(texto, 'FontSize', fontsize)
pbaspect([4 2 1])
legend("Designed"+num2str(NF),textcode+num2str(NF),'FontSize',fontsize)

mean(table)