% Created by: Ph.D Nelson Eduardo Diaz Diaz
% Post-doctorado Pontícia Universidad Católica de Valparaíso (PUCV)
% Date 2 February 2022

% Comparison of minimum distance
% Solution using the Discrete Sphere Packing based on 3D N^2 Queens
% Approach
clear;
close all
clc
N = 256;
NF = 16;
mask = zeros(N,N,NF);
ti = "Pattern/optimalPattern_"+num2str(N)+"x"+num2str(N)+"_filter="+num2str(NF)+".mat";
load(ti);
G = mask;

for i=1:NF
    mask(:,:,i)=(G==i);
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
text = "codes/design-mask_optimize_"+num2str(N)+"x"+num2str(N)+"NF="+num2str(NF);
save(text,'mask','G','minimum');
stand = std(T(:));
prom = mean(T(:));
texto = "Minimum = " + num2str(minimum) + ", Maximun = " + num2str(m) + ", Standart Desv = " + num2str(stand) + ", Mean = " + num2str(prom);
subplot(2,2,2),imagesc(T),title(texto, 'FontSize', 14), colorbar;
pbaspect([1 1 1])
%% MSFA(5-16)
if(NF ==5)
    A = [1 5 2 5;4 3 4 3;2 5 1 5;4 3 4 3]; % MSFA5
elseif(NF ==6)
    A = [1 5 2 5;6 3 6 4;2 5 1 5;6 4 6 3]; % MSFA6
elseif(NF ==7)
    A = [1 7 2 7;5 3 6 4;2 7 1 7; 6 4 5 3]; % MSFA7
elseif(NF ==8)
    A = [1 7 2 8;5 3 6 4;2 8 1 7;6 4 5 3]; % MSFA8
elseif(NF ==9)
    A = [1 8 3 9;6 4 7 5;3 9 2 8; 7 5 6 4]; % MSFA9
elseif(NF ==10)
    A = [1 9 4 10;7 5 8 6;3 10 2 9;8 6 7 5]; % MSFA10
elseif(NF ==11)
    A = [1 10 4 11;8 5 9 7;3 11 2 10;9 7 8 6]; % MSFA11
elseif(NF ==12)
    A = [1 11 4 12;9 5 10 7;3 12 2 11;10 8 9 6]; % MSFA12
elseif(NF ==13)
    A = [1 12 4 13;9 5 11 7;3 13 2 12;11 8 10 6]; % MSFA13
elseif(NF ==14)
    A = [1 13 4 14;9 5 11 7;3 14 2 13;12 8 10 6]; % MSFA14
elseif(NF ==15)
    A = [1 13 4 15;9 5 11 7;3 15 2 14;12 8 10 6]; % MSFA15
elseif(NF == 16)
    A = [1,13,4,15;9,5,11,7;3,16,2,14;12,8,10,6]; % MSFA16
elseif(NF > 16)
    x = 1:NF;
    x = x(randperm(length(x)));
    A(1,:) = x;
    for i=2:NF
        temp = x(2:end);
        A(i,1:end-1) = temp;
        A(i,end) = x(1);
        x = A(i,:);
    end
    A = A(x,:);
    r = ceil(N/NF);
    B = ones(r,r);
    G = kron(B,A);
    G = G(1:N,1:N);
elseif(NF==256)
    x = 1:NF;
    x = x(randperm(length(x)));
    A(1,:) = x;
    for i=2:NF
        temp = x(2:end);
        A(i,1:end-1) = temp;
        A(i,end) = x(1);
        x = A(i,:);
    end
    A = A(x,:);
    G = A;
end

if(NF <= 16)
    B = ones(N/4,N/4);
    G = kron(B,A);
end

if(NF >= 5 & NF <= 16)
    subplot(2,2,3),imagesc(G(1:N,1:N)),colormap('gray'),title("MSFA"+num2str(NF)+" code", 'FontSize', 14), colorbar;
    pbaspect([1 1 1])
elseif(NF > 16)
    subplot(2,2,3),imagesc(G(1:N,1:N)),colormap('gray'),title("Random NF="+num2str(NF)+" code", 'FontSize', 14), colorbar;
    pbaspect([1 1 1])
end
colormap('jet')
[T] = distance(G);
m = max(T(:));
minimum = min(T(:));
text = "codes/design-mask_random_"+num2str(N)+"x"+num2str(N)+"NF="+num2str(NF);
save(text,'mask','G','minimum');
stand = std(T(:));
prom = mean(T(:));
texto = "Minimum = " + num2str(minimum) + ", Maximun = " + num2str(m) + ", Standart Desv = " + num2str(stand) + ", Mean = " + num2str(prom);
subplot(2,2,4),imagesc(T),title(texto, 'FontSize', 14), colorbar;
pbaspect([1 1 1])
