% Created by: Ph.D Nelson Eduardo Diaz Diaz
% Post-doctorado Pontícia Universidad Católica de Valparaíso (PUCV)
% Date 2 February 2022

% Comparison of minimum distance
% Solution using the Discrete Sphere Packing based on 3D N^2 Queens
% Approach

% Solution using The 3-D N2-Queens problem
clear;
close all
clc
addpath(genpath('./utils'));
addpath(genpath('./results'));
N = 512;
NF = 16; % Number of filters
x = ones(N,1);
y = (1:N)';
I = kron(x',y);
J = kron(x,y');
[a,b,dist]=DDDRSNNP2(N,NF);
a(1)
b(1)
si = a(1);
sj = b(1);
G = mod(I.*si + J.*sj,NF)+1;
Go = G;
C = zeros(N,N,NF);
for i=1:NF
    C(:,:,i)=(G==i);
end

ti = "Pattern/optimalPattern_"+num2str(N)+"x"+num2str(N)+"_filter="+num2str(NF)+".mat";
save(ti,'C','Go','dist')

figure('Renderer', 'painters', 'Position', [10 10 900 600])
fontsize = 14;
set(gca,'FontSize',fontsize)
hold on;
grid on;
subplot(1,3,1),imagesc(G(1:N,1:N)),colormap('gray'),title("Designed code NF="+num2str(NF), 'FontSize', 14), colorbar;
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
subplot(1,3,2),imagesc(T),title(texto, 'FontSize', 14), colorbar;
pbaspect([1 1 1])

subplot(1,3,3),imshow(Go==1,[]),title("Pattern at the 1st Band", 'FontSize', 14), colorbar;
pbaspect([1 1 1])
G(1:8,1:8)
