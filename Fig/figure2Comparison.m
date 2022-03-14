% Created by: Ph.D Nelson Eduardo Diaz Diaz
% Post-doctorado Pontícia Universidad Católica de Valparaíso (PUCV)
% Date 2 February 2022

%% Compare MSFA Against Designed patterns
close all;
clc;
NF = 31;
N = 256;
texto = "results_NF=" + num2str(NF)+"N="+num2str(N)+".mat";
load(texto);
figure(1)
fontsize = 14;
set(gca,'FontSize',fontsize)
hold on;
grid on;
plot(table(:,1),'-b','LineWidth',1.5)
hold on;
grid on;

if(NF<=16 & NF>=5)
    texto = "Designed Against MSFA ";
elseif(NF==25 | NF==31)
    texto = "Designed Against Random ";
end

xlabel('Dataset','FontSize',fontsize)
ylabel('Reconstruction Quality','FontSize',fontsize)
legend("Designed"+num2str(NF),'FontSize',fontsize)
plot(table2(:,1),'-r','LineWidth',1.5),title(texto, 'FontSize', fontsize)

if(NF<=16 & NF>=5)
    legend("Designed","MFSA"+num2str(NF),'FontSize',fontsize)
elseif(NF==25 | NF==31)
    legend("Designed","Random"+num2str(NF),'FontSize',fontsize)
end
mean(table)
mean(table2)


