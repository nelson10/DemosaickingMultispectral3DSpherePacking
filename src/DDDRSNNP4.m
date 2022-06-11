% Created by: Ph.D Nelson Eduardo Diaz Diaz
% Post-doctorado Pontícia Universidad Católica de Valparaíso (PUCV)
% Date 2 February 2022

% Comparison of minimum distance
% Solution using the Discrete Sphere Packing based on 3D N^2 Queens
% Approach

% Find Optimal values of a and b

function [a,b,ma,G1]=DDDRSNNP4(N,NF)
x = ones(1,NF)';
y = (1:NF)';
I = kron(x',y);
J = kron(x,y');

M = round(NF/2);
id = 1:M;
t = zeros(M,1);
for m = 1:M
    t(m) = iscoprime([m NF]);
end
idx =id(t==1);
K = length(idx);
distance = zeros(K,K);
for i=1:K
    for j=i:K
        si = idx(i);
        sj = idx(j);
        G = mod(I.*si + J.*sj,NF)+1;
        t = length(unique(G(1:NF,1:NF)));
        if(t == NF)
            %[distance(si,sj)]=distan(G);
            [distance(si,sj)]=distan3(G);
        else
        end
    end
    disp(i +" out of "+ num2str(M));
end
ma = max(distance(:));
ma
[b,a,~]= find(ma==distance);
G = mod(I.*a(1) + J.*b(1),NF)+1;
A = G;
p = ceil(N/NF);
B = ones(p,p);
G1 = kron(B,A);
G1 = G1(1:N,1:N);
%save("results/dist_best"+num2str(N),'distance','a','b')
end