% Created by: Ph.D Nelson Eduardo Diaz Diaz
% Post-doctorado Pontícia Universidad Católica de Valparaíso (PUCV)
% Date 2 February 2022

close all;
clc;
addpath(genpath('./Results'));

NF = 31;
N = 256;
fontsize = 14;
figure(1)
set(gca,'FontSize',fontsize)
hold on;
grid on;
for i = 1:6
    texto = "results_NF=" + num2str(NF)+"N="+num2str(N)+"_h="+num2str(i-1)+".mat";
    load(texto);
    plot(table(:,1),'-','LineWidth',1.5)
end
legend('h=0','h=1','h=2','h=3','h=4','h=5','FontSize',fontsize,'Location','SouthEast') %'h=5','h=6','h=7'
title("Quality of Image Reconstruction for each Dataset, NF="+num2str(NF))
xlabel('Datasets','FontSize',fontsize)
ylabel('Reconstruction Quality PSNR[dB]','FontSize',fontsize)
pbaspect([8 4 4])
