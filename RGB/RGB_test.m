function [RGB]= RGB_test(dataset)

%addpath(genpath('./Real-measurements-penguin'));
%addpath(genpath('./RGB'));
%load('Nelson_FullSpectral.mat');

load illum_4000.mat;
load illum_6500.mat;
load('illum_25000.mat')
load xyzbar.mat;


%cube = T1;
cube = dataset;
L2 = size(cube,3);

idx = round(linspace(1,L2,L2));
Io = mat2gray(cube(:,:,idx));
MS = Io;
%load(database); % Data
%hyperimg = reflectances(1:512,1:512,:); %Ori %bestRes
hyperimg = double(MS);
[N1,N2,L]=size(hyperimg);
reflectances=hyperimg;
l=round(linspace(1,33,L));

radiances = zeros(size(reflectances));  % initialize array
for j=1:L
    CC = reflectances(:,:,j);
    reflectances(:,:,j) = reflectances(:,:,j)/max(CC(:));
    radiances(:,:,j) = reflectances(:,:,j)*illum_6500(l(j));
end
[r, c, w] = size(radiances);
radiances = reshape(radiances, r*c, w);

XYZ = (xyzbar(l(:),:)'*radiances')';
XYZ = reshape(XYZ, r, c, 3);
XYZ = max(XYZ, 0);
XYZ = XYZ/max(XYZ(:));

RGB = XYZ2sRGB_exgamma(XYZ);
RGB = max(RGB, 0);
RGB =RGB ./max(RGB(:));
RGB = min(RGB, 1);
gamma = 0.5;
pos   = [196 225;75 282;231 332];%;7 102;79 116]; % position bear
%pos   = [105 53]%; 9 15; 22 120];
color = {'red'};
%RGB = insertMarker(RGB,pos,'o','color',color,'size',5);
%figure(2); imshow((RGB).^gamma, 'Border','tight');
%imwrite(RGB.^gamma, "RGB"+num2str(k)+".png");
RGB = RGB.^gamma;
end