% Created by: Ph.D Nelson Eduardo Diaz Diaz
% Post-doctorado Pontícia Universidad Católica de Valparaíso (PUCV)
% Date 2 February 2022

% Implements the methods of the paper: Demosaicking Multispectral Images Based on Sphere Packing Filter Design

% Comparison of minimum distance
% Solution using the Discrete Sphere Packing based on 3D N^2 Queens
% Approach

clear all;
clc;
close all;
%% Add path to the scene
addpath(genpath('./scene'));
addpath(genpath('./scene2'));
addpath(genpath('./codes'));
addpath(genpath('./RGB'));
addpath(genpath('./src'));
addpath(genpath('./Fig'));
addpath(genpath('./Pattern'));
addpath(genpath('./Results'));
addpath(genpath('./Real-data'));
addpath(genpath('./RSSP'));
addpath(genpath('./Test1'));
addpath(genpath('./Test'));

%% Parameters
N = 512; % Spatial resolution
NF = 25; % Number of bands put 8 or 16
JC = 0; % 1 to use spectral correlation, 0 to avoid spectral correlation
nm = 8;
dataset = 1; %1 Cave multispectral, 2 Tokyo Tech
realdata = 1; % 0 perfect spectral response, 1 IMEC spectral response
comparisonRGB = 0; % 1 Show Groundtruth and Reconstructions, 0 it shows nothing

%% Load Designed Coded Apertue
code1 = 7; % 0 Random, BN, 2, Brauers Binary Tree-based edge-sensing (BTES), 2 (Brauers and Aach, 2006),3 Sequencial, 4 Uniform, 5 IMEC, 6 BTES, 7 Sphere packing
nc = 2;

if(dataset==1)
    if (NF <= 31)
        d = 32; % Select the scene (Numbers between 1 and 32)
    elseif(NF ==144)
        d = 1;
    end
elseif(dataset==2)
    d = 30;
end

table =zeros(d,4,nc); %  PSNR, SSIM, RMSE, SAM of Sphere Packing based Coded Aperture
method = 6; % 1 Convolution Filter (CF), 2 Iterative Intensity Difference (IID), 3 Intensity Difference (ID), 4 Weighted Billinear Method, 5  Scattered data interpolation methods, 6 Iterative Nearby Channel Difference(ItNCD), 7 Spectral Difference(SD), 8 Iterative Spectral Difference(SD)
[Go] = codedPatterns(N,NF,code1);
[textcode1] =checkCode(code1);
[textmethod] = checkMethod2(method);
%% Load Designed Coded Apertue
code = 5; % 0 Random, BN, 2, Brauers Binary Tree-based edge-sensing (BTES), 2 (Brauers and Aach, 2006),3 Sequencial, 4 Uniform, 5 IMEC, 6 BTES, 7 Sphere packing
[G] = codedPatterns(N,NF,code);
[textcode] =checkCode(code);
method1 = 6; % 1 Convolution Filter (CF), 2 Iterative Intensity Difference (IID), 3 Intensity Difference (ID), 4 Weighted Billinear Method, 5  Scattered data interpolation methods, 6 Iterative Nearby Channel Difference(ItNCD), 7 Spectral Difference(SD), 8 Iterative Spectral Difference(SD)
[textmethod1] = checkMethod2(method1);
if(comparisonRGB ==1)
    figure('Renderer', 'painters', 'Position', [10 10 1500 1200])
end

for k=4:d % iterave over the scenes
    disp("scene="+num2str(k));
    disp("---------------------------------------------------------------------------------------------------------")
    [scene] = textScene(dataset,k,NF);
    %% Reconstruction using State-of-the-art
    [XrecMSFA,~]= sampling(scene,G,NF,JC,method,dataset,k,code,realdata);
    %% Reconstruction using Sphere Packing based Coded Aperture
    [Xrec,X]= sampling(scene,Go,NF,JC,method1,dataset,k,code1,realdata);  
    disp("Multispectral Demosaicking using "+textmethod1+", CA="+textcode1+", scene= "+ scene);
    %% Compute metrics
    [p,s,r,sam] = metrics(X,Xrec,dataset);
    %% Table of metrics proposed method for each scene
    table(k,:,1) =[p,s,r,sam];
    disp("Multispectral Demosaicking using "+ textmethod + ", CA= "+textcode+", scene= " + scene);
    %% Compute metrics
    [p1,s1,r1,sam1] = metrics(X,XrecMSFA,dataset);
    %% Generate RGB
    [RGBrBTES] = RGB_test(XrecMSFA);
    %% Table of metrics SOTA for each scene
    table(k,:,2) = [p1,s1,r1,sam1];
    %% Generate RGB image from datacube
    [RGB] = RGB_test(X);
    [RGBr] = RGB_test(Xrec);
    %% Groundtruth, Proposed method, and SOTA
    if(comparisonRGB ==1)
        subplot(1,3,1),imagesc(RGB),title("Groundtruth ");
        pbaspect([1 1 1])
        subplot(1,3,2),imagesc(RGBr),title(textmethod +","+ textcode1 + num2str(NF)+", PSNR=  " + num2str(p)+" dB, SAM= "+num2str(sam));
        pbaspect([1 1 1])
        subplot(1,3,3),imagesc(RGBrBTES),title(textmethod1 +"+ "+ textcode + num2str(NF)+", PSNR= " + num2str(p1)+" dB, SAM= "+num2str(sam1));
        pbaspect([1 1 1])
    end
    pause(0.1)
end
texto = "Results/results_NF="+num2str(NF)+"_N="+num2str(N)+"_Coded_Aperture="+textcode+"_Method="+textmethod+"_scenesize="+d+".mat";
save(texto,'table')
disp("OSP");
round(mean(table(:,:,1)),2)
disp("SOTA");
round(mean(table(:,:,2)),2)
cd = [code1,code];
md = [method1 method];
table(:,3,1)= table(:,3,1)./max(table(:,3,1));
table(:,3,2)= table(:,3,2)./max(table(:,3,2));
for c=1:nc
    [textcode] =checkCode(cd(c));
    disp(textcode);
    [textcode] =checkMethod2(md(c));
    disp(textcode);
    disp(mean(table(:,:,c)));
end
%ComputeFigures();