function [hyperimg] = radiance(hyperimg)
[M,N,L]= size(hyperimg);
l=round(linspace(1,33,L));
load illum_6500.mat; % daylight with CCT 6500 K
load xyzbar.mat; % CIE 1931 colour-matching functions
reflectances = hyperimg;
radiances_6500 = zeros(size(reflectances));  % initialize array
for j=1:L
    temp = reflectances(:,:,j);
    reflectances(:,:,j) = reflectances(:,:,j)/max(temp(:));
    radiances_6500(:,:,j) = reflectances(:,:,j)*illum_6500(l(j)); % daylight with CCT 6500 K
    temp = radiances_6500(:,:,j);
    hyperimg(:,:,j) = mat2gray(radiances_6500(:,:,j));
end
end