% Created by: Ph.D Nelson Eduardo Diaz Diaz
% Post-doctorado Pontícia Universidad Católica de Valparaíso (PUCV)
% Date 2 February 2022

%% Compare BTES Against Designed patterns
close all;
clc;
N = 512; % Spatial resolution
NF = 16; % Number of bands put 8 or 16
method = 8; % 1 Convolution Filter (CF), 2 Iterative Intensity Difference (IID), 3 Intensity Difference (ID), 4 Weighted Billinear Method, 5  Scattered data interpolation methods
code = 3; % 0 Random, 1 Binary Tree-based edge-sensing (BTES), 2 (Brauers and Aach, 2006)
d = 32;

if(method==1)
    textmethod ="ConvolutionFilter"; % Convolution Filter (CF)
elseif(method == 2)
    textmethod="IterativeIntensityDifference";  %Iterative Intensity Difference (IID)
elseif(method ==3)
    textmethod ="IntensityDifference "; % Intensity Difference (ID)
elseif(method ==4)
    textmethod ="WeightedBillinearMethod"; % Weighted Billinear Method (WB)
elseif(method ==5)
    textmethod ="ScatteredDataInterpolationMethods"; % Scattered data interpolation methods
elseif(method ==6)
    textmethod="IterativeNearbyChannelDifference(ItNCD)";  %Iterative Nearby Channel Difference(ItNCD)
elseif(method ==7)
    textmethod="SpectralDifference(SD)";  % Spectral Difference(SD)
elseif(method ==8)
    textmethod="IterativeSpectralDifference(ItSD)";  % Iterative Spectral Difference(SD)
end

if(code==0)
    textcode ="Random";
elseif(code == 1)
    textcode ="BTES";  %Binary Tree-based edge-sensing (BTES)
elseif(code ==2)
    textcode ="Brauers"; % (Brauers and Aach, 2006)
    %Brauers, Johannes, and Til Aach. "A color filter array based multispectral camera." 12. Workshop Farbbildverarbeitung. Ilmenau, 2006.
elseif(code ==3)
    textcode ="Sequential";
elseif(code ==4)
    textcode ="Uniform";
end

texto = "Results/results_NF="+num2str(NF)+"_N="+num2str(N)+"_Coded_Aperture="+textcode+"_Method="+textmethod+"_datasetsize="+d+".mat";
load(texto);
figure('Renderer', 'painters', 'Position', [10 10 900 600])
fontsize = 14;
set(gca,'FontSize',fontsize)
hold on;
grid on;
plot(table(:,1),'-b','LineWidth',1.5)
hold on;
grid on;

texto = "Designed Against "+textcode;


xlabel('Dataset','FontSize',fontsize)
ylabel('Reconstruction Quality','FontSize',fontsize)


plot(table2(:,1),'-r','LineWidth',1.5),title(texto, 'FontSize', fontsize)
pbaspect([4 2 1])
legend("Designed"+num2str(NF),textcode+num2str(NF),'FontSize',fontsize)
%legend("Designed "+textcode+num2str(NF),'FontSize',fontsize)

mean(table)
mean(table2)