% Created by: Ph.D Nelson Eduardo Diaz Diaz
% Post-doctorado Pontícia Universidad Católica de Valparaíso (PUCV)
% Date 2 February 2022

% Comparison of minimum distance
% Solution using the Discrete Sphere Packing based on 3D N^2 Queens
% Approach
clear;
close all
clc
N = 512;
NF = 16;
code = 5;
C = zeros(N,N,NF);
ti = "Pattern/optimalPattern_"+num2str(N)+"x"+num2str(N)+"_filter="+num2str(NF)+".mat";
load(ti);
G = Go;

for i=1:NF
    C(:,:,i)=(G==i);
end

figure(1)
fontsize = 14;
set(gca,'FontSize',fontsize)
hold on;
grid on;
subplot(2,2,1),imagesc(G(1:N,1:N)),colormap('gray'),title("Designed code NF="+num2str(NF), 'FontSize', 14), colorbar;
colormap('jet')
pbaspect([1 1 1])

[T] = distance(G);

m = max(T(:));
minimum = min(T(:));
text = "Pattern/design-mask_optimize_"+num2str(N)+"x"+num2str(N)+"NF="+num2str(NF);
%save(text,'C','G','minimum');
stand = std(T(:));
prom = mean(T(:));
texto = "Minimum = " + num2str(minimum) + ", Maximun = " + num2str(m) + ", Standart Desv = " + num2str(stand) + ", Mean = " + num2str(prom);
subplot(2,2,2),imagesc(T),title(texto, 'FontSize', 14), colorbar;
pbaspect([1 1 1])


if(code==0)
    textcode ="Random";
    [G] = codedPatterns(N,NF,code);
elseif(code == 1)
    textcode ="BTES";  %Binary Tree-based edge-sensing (BTES)
    [G] = codedPatterns(N,NF,code);
elseif(code ==2)
    textcode ="Brauers"; % (Brauers and Aach, 2006)
    %Brauers, Johannes, and Til Aach. "A color filter array based multispectral camera." 12. Workshop Farbbildverarbeitung. Ilmenau, 2006.
    [G] = codedPatterns(N,NF,code);
elseif(code ==3)
    textcode ="Sequential";
    [G] = codedPatterns(N,NF,code);
elseif(code ==4)
    textcode ="Uniform";
    [G] = codedPatterns(N,NF,code);
elseif(code ==5)
    textcode ="IMEC";
    [G] = codedPatterns(N,NF,code);
end

subplot(2,2,3),imagesc(G(1:N,1:N)),colormap('gray'),title(textcode+num2str(NF)+" code", 'FontSize', 14), colorbar;
pbaspect([1 1 1])
colormap('jet')
[T] = distance(G);
m = max(T(:));
minimum = min(T(:));
text = "Pattern/design-mask_random_"+num2str(N)+"x"+num2str(N)+"NF="+num2str(NF);
%save(text,'C','G','minimum');
stand = std(T(:));
prom = mean(T(:));
texto = "Minimum = " + num2str(minimum) + ", Maximun = " + num2str(m) + ", Standart Desv = " + num2str(stand) + ", Mean = " + num2str(prom);
subplot(2,2,4),imagesc(T),title(texto, 'FontSize', 14), colorbar;
pbaspect([1 1 1])
