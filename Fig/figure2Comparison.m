% Created by: Ph.D Nelson Eduardo Diaz Diaz
% Post-doctorado Pontícia Universidad Católica de Valparaíso (PUCV)
% Date 2 February 2022

%% Compare BTES Against Designed patterns
close all;
clc;
NF = 16;
N = 512;
method = 5;
if(method==1)
    textmethod ="Convolution Filter "; % Convolution Filter (CF)
elseif(method == 2)
    textmethod="Iterative Intensity Difference ";  %Iterative Intensity Difference (IID)
elseif(method ==3)
    textmethod ="Intensity Difference "; % Intensity Difference (ID)
elseif(method ==4)
    textmethod ="Weighted Billinear Method "; % Weighted Billinear Method (WB)
elseif(method ==5)
    textmethod ="Scattered data interpolation methods "; % Scattered data interpolation methods
end
texto = "results_NF=" + num2str(NF)+"N="+num2str(N)+textmethod+".mat";
load(texto);
figure('Renderer', 'painters', 'Position', [10 10 900 600])
fontsize = 14;
set(gca,'FontSize',fontsize)
hold on;
grid on;
plot(table(:,1),'-b','LineWidth',1.5)
hold on;
grid on;

if(NF<=16 & NF>=5)
    texto = "Designed Against BTES ";
elseif(NF==25 | NF==31)
    texto = "Designed Against Random ";
end

xlabel('Dataset','FontSize',fontsize)
ylabel('Reconstruction Quality','FontSize',fontsize)
legend("Designed"+num2str(NF),'FontSize',fontsize)
plot(table2(:,1),'-r','LineWidth',1.5),title(texto, 'FontSize', fontsize)
pbaspect([4 2 1])

if(NF<=16 & NF>=5)
    legend("Designed","BTES"+num2str(NF),'FontSize',fontsize)
elseif(NF==25 | NF==31)
    legend("Designed","Random"+num2str(NF),'FontSize',fontsize)
end
mean(table)
mean(table2)