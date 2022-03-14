% Created by: Ph.D Nelson Eduardo Diaz Diaz
% Post-doctorado Pontícia Universidad Católica de Valparaíso (PUCV)
% Date 2 February 2022

% Comparison of minimum distance
% Solution using the Discrete Sphere Packing based on 3D N^2 Queens
% Approach

% Find Optimal values of a and b

function [a,b,ma]=DDDRSNNP2(N,NF)
M = round(N/2);
idx = 1:M;
K = length(idx);
distance = zeros(N,N);
x = ones(1,N)';
y = (1:N)';
n = ceil(sqrt(NF));
for i=1:K
    for j=i:K
        si = idx(i);
        sj = idx(j);
        I = kron(x',y);
        J = kron(x,y');
        G = mod(I.*si + J.*sj,NF)+1;
        t = length(unique(G(1:NF,1:NF)));
        if(t == NF)
            [distance(si,sj)]=distan(G);
        else
        end
    end
    disp(i +" out of "+ num2str(K));
end
ma = max(distance(:));
ma
[b,a,~]= find(ma==distance);
%save("results/dist_best"+num2str(N),'distance','a','b')
end