function [density]= ComputeDensity(dist,NF)
cube = (NF+1).^3;
dist = dist./2;
sphere = (NF.^2).*(4/3).*pi.*(dist.^3);
density = (sphere./cube);
disp("Sphere Packing Density "+ density)

% nb =NF.^2;
% dis = 2*(((NF+1).^3)./(4*nb*sqrt(2))).^(1/3);
% dis = dis./2;
% sphere = (NF.^2).*(4/3).*pi.*(dis.^3);
% density1 = (sphere./cube);
% disp("Optimal Sphere Packing Density "+ density1)
end