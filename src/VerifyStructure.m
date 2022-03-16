% Created by: Ph.D Nelson Eduardo Diaz Diaz
% Post-doctorado Pontícia Universidad Católica de Valparaíso (PUCV)
% Date 2 February 2022

function [flag] = VerifyStructure(G,N,NF)
if(NF<=16 & NF >= 5)
    M = 4;
else
    M = ceil(sqrt(NF));
end
P = G(1:M,1:M);
L = length(unique(P));
if(NF==L)
    flag = 1;
else
    flag = 0;
end
end