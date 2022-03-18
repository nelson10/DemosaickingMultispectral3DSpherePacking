% Created by: Ph.D Nelson Eduardo Diaz Diaz
% Post-doctorado Pontícia Universidad Católica de Valparaíso (PUCV)
% Date 2 February 2022

%% Compare BTES Against Designed patterns
close all;
clc;
NF = 16;
N = 512;
method = 2;
code = 3;
d = 32;

if(method==1)
    textmethod ="Convolution_Filter"; % Convolution Filter (CF)
elseif(method == 2)
    textmethod="Iterative_Intensity_Difference";  %Iterative Intensity Difference (IID)
elseif(method ==3)
    textmethod ="Intensity_Difference "; % Intensity Difference (ID)
elseif(method ==4)
    textmethod ="Weighted_Billinear_Method"; % Weighted Billinear Method (WB)
elseif(method ==5)
    textmethod ="Scattered_data_interpolation_methods"; % Scattered data interpolation methods
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