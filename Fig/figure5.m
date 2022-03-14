% Created by: Ph.D Nelson Eduardo Diaz Diaz
% Post-doctorado Pontícia Universidad Católica de Valparaíso (PUCV)
% Date 2 February 2022

function [NF]=figure5(N,NF,mask,dist)
%% Comparison 3D random and optimal spheres
%NF = 9;
%N = 256;
set(groot, 'defaultFigureUnits', 'centimeters', 'defaultFigurePosition', [0 0 30.86 30.8]);

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
end

if(NF <= 16)
    B = ones(N/4,N/4);
    G = kron(B,A);
end
[T] = distance(G);
G = G(1:NF,1:NF);
m = max(T(:));
minimum = min(T(:));

fontsize = 18;
radius = minimum/2;

fig=figure(1);
subplot(1,2,1)
showSphere(G,radius,fontsize); title("MSFA"+num2str(NF)+" distance="+num2str(minimum), 'FontSize', fontsize)
set(gca,'FontSize',fontsize)

G = mask(1:NF,1:NF);
minimum = dist;

radius = minimum/2;
subplot(1,2,2)
showSphere(G,radius,fontsize);title("Optimization minimum distance="+num2str(minimum), 'FontSize', fontsize)
set(gca,'FontSize',fontsize)

%printPDF('./figure2.pdf')
%saveas(fig,'figure2','pdf') %gcf,
orient(fig,'landscape')
print(fig,'figure2.pdf','-dpdf')
end