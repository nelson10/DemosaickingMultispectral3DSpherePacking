% Created by: Ph.D Nelson Eduardo Diaz Diaz
% Post-doctorado Pontícia Universidad Católica de Valparaíso (PUCV)
% Date 2 February 2022

clear all;
clc;
close all;
%addpath(genpath('./utils'));
%addpath(genpath('./Optimal'));
%profile on

n = 3:11;
n2 =[n 16 25 36 49 64 81 100 121 144 169 196 225 256 289 324 361 1024];

fontsize =14;
%nb = 500;
d = n2;
%d = round(linspace(3,nb,nb-3)); % detector size
%nt = length(d);
nt = length(n2);
for k= 1:nt
    %N = d(k);  % spatial size
    N = n2(k);
    [a,b,ma]=DDDRSNNP2(N,N);
    a1 = a(1);
    b1 = b(1);
    x = ones(N,1);
    y = (1:N)';
    I = kron(x',y);
    J = kron(x,y');
    si = a1;
    sj = b1;
    G = mod(I.*si + J.*sj,N)+1;

    text = " a= "+num2str(a1) + " b= "+num2str(b1);
    disp(text);
    [flag] = VerifyStructure(G,N,N);
    flag
    [T] = ComputeDistance(G);
    minimum = min(T(:))
    r(k)=minimum/2;
end

%c = 2:11;
%x = c;
x = [2:11 16 25].^2;
x = [x 1372 2048 2457 4000 6912 10976 14896 21438 29660 39754 51912 66326 83188 108000 131072 1024192 4100625];
dent =[0.4209 0.4710 0.4510 0.4948 0.5026 0.5211 0.5458 0.5447 0.5788 0.5832 0.6364 0.6224 0.6784 0.6858 0.6890 0.6963 0.7034 0.7085 0.7115 0.7148 0.7173 0.7194 0.7212 0.7227 0.7240 0.7253 0.7262 0.7332];
    
cube = (d+1).^3;
sphere = (d.^2).*(4/3).*pi.*(r.^3);
density = (sphere./cube);
id =d.^2;

loglog(id(1:nt),density(1:nt),'-g','MarkerFaceColor','g','MarkerSize',18,'LineWidth',3)
hold on
grid on
set(gca,'FontSize',fontsize)
%% Orange line -> theoretical
dis = 2*(((d+1).^3)./(4*id*sqrt(2))).^(1/3);
dis = dis./2;
sphere = (d.^2).*(4/3).*pi.*(dis.^3);
density = (sphere./cube);
loglog(id(1:nt),density(1:nt),'-b','MarkerFaceColor','b','MarkerSize',18,'LineWidth',3)
axis([0 10^7 0 0.77])
title('Density of Spheres in a (N_x+1)^3 Cube ', 'FontSize', fontsize)
xlabel('Number of Spheres ', 'FontSize', fontsize)
ylabel('Density ', 'FontSize', fontsize)
na=28;
loglog(x(2:na),dent(2:na),'-r','MarkerFaceColor','r','MarkerSize',18,'LineWidth',3)
hold on
grid on
set(gca,'FontSize',fontsize)
legend('Optimized ','Upper bound (theoretical)','Best sphere packing','LineWidth',2,'location','southeast','FontSize', 16)
set(gcf, 'PaperPosition', [0 0 9 7]); %Position plot at left hand corner with width 5 and height 5.
set(gcf, 'PaperSize', [9 7]); %Set the paper to have width 5 and height 5.
saveas(gcf,'figure4','pdf')