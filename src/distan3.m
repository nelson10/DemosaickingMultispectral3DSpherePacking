% Created by: Ph.D Nelson Eduardo Diaz Diaz
% Post-doctorado Pontícia Universidad Católica de Valparaíso (PUCV)
% Date 2 February 2022

% Comparison of minimum distance
% Solution using the Discrete Sphere Packing based on 3D N^2 Queens
% Approach

function [res]=distan3(G,NF)
%% 3D statistics
[~,N]= size(G);
L = N;
%L = round(sqrt(N));
G = G(1:L,1:L);
[r,c,z] = find(G);
B = [r c z];
T = zeros(L,L);
D = pdist(B);
dist =squareform(D);
for i=1:L^2
    [~,~,values] = find(dist(i,:));
    T(i) = min(values);
    %temp = dist(i,:);
    %T(r(i),c(i)) = min(temp(temp>0));
end
% if(NF~=16)
%     bmin = min(T(:)); % reach d=3 and density=0.5 although allowing non-uniform
%     res = bmin;
% elseif(NF==16)
%     bmin = min(T(:)); % reach d=2.45 and density=0.4 promotes uniformity an avoids non-uniform solution
%     bmax = max(T(:));
%     if(bmax==bmin)
%         res = bmin;
%     else
%         res = 0;
%     end
% end
    bmin = min(T(:)); % reach d=3 and density=0.5 although allowing non-uniform
    res = bmin;
end
