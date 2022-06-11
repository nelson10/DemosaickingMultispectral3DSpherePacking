% Created by: Ph.D Nelson Eduardo Diaz Diaz
% Post-doctorado Pontícia Universidad Católica de Valparaíso (PUCV)
% Date 2 February 2022

%% Compare BTES Against Designed patterns
close all;
clc;
N = 512; % Spatial resolution
NF = 16; % Number of bands put 8 or 16
method = 6; % 1 Convolution Filter (CF), 2 Iterative Intensity Difference (IID), 3 Intensity Difference (ID), 4 Weighted Billinear Method, 5  Scattered data interpolation methods
code = 6; % 0 Random, 1 Binary Tree-based edge-sensing (BTES), 2 (Brauers and Aach, 2006), 3 Sequential, 4 Uniform, 5 IMEC, 6 Sphere packing
d = 32;

[textmethod] = checkMethod(method);
[textcode] =checkCode(code);

texto = "Results/results_NF="+num2str(NF)+"_N="+num2str(N)+"_Coded_Aperture="+textcode+"_Method="+textmethod+"_datasetsize="+d+".mat";
load(texto);

figure('Renderer', 'painters', 'Position', [10 10 900 600])
fontsize = 14;
set(gca,'FontSize',fontsize)
texto = "Designed Against "+textcode;
xlabel('Dataset','FontSize',fontsize)
ylabel('Reconstruction Quality','FontSize',fontsize)
hold on;
grid on;
for i=1:7
    if(i~=5)
    plot(table(:,1,i),'LineWidth',1.5)
    pbaspect([4 2 1])
    hold on;
    grid on;
    [textcode(i)] =checkCode(i-1);
    disp(textcode(i))
    disp(mean(table(:,:,i)));
    end
end
%legend(textcode(1)+num2str(NF),textcode(2)+num2str(NF),textcode(3)+num2str(NF),textcode(4)+num2str(NF),textcode(5)+num2str(NF),textcode(6)+num2str(NF),textcode(7)+num2str(NF),'FontSize',fontsize);
legend(textcode(1)+num2str(NF),textcode(2)+num2str(NF),textcode(3)+num2str(NF),textcode(4)+num2str(NF),textcode(6)+num2str(NF),textcode(7)+num2str(NF),'FontSize',fontsize);