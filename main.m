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
%% Add path to the dataset
addpath(genpath('./Dataset'));
addpath(genpath('./codes'));
addpath(genpath('./RGB'));
addpath(genpath('./src'));
addpath(genpath('./Fig'));
addpath(genpath('./Pattern'));
addpath(genpath('./Results'));

%% Parameters
N = 512; % Spatial resolution
NF = 16; % Number of bands put 8 or 16
JC = 0; % 1 to use spectral correlation, 0 to avoid spectral correlation
d = 32;
table =zeros(d,4); %  PSNR, SSIM, RMSE, SAM of Sphere Packing based Coded Aperture
table2 =zeros(d,4); % PSNR, SSIM, RMSE, SAM of BTES(5-16) or Random methods
comparisonRGB = 0; % 1 Show Groundtruth and Reconstructions, 0 it shows nothing


if (NF <= 31)
    d = 32; % Select the dataset (Numbers between 1 and 15)
elseif(NF ==144)
    d = 1;
end

method = 2; % 1 Convolution Filter (CF), 2 Iterative Intensity Difference (IID), 3 Intensity Difference (ID), 4 Weighted Billinear Method, 5  Scattered data interpolation methods
code = 2; % 0 Random, 1 Binary Tree-based edge-sensing (BTES), 2 (Brauers and Aach, 2006)
if(code==0)
    textcode ="Random";
    [G] = codedPatterns(N,NF,code);
elseif(code == 1)
    textcode ="BTES";  %Binary Tree-based edge-sensing (BTES)
    [G] = codedPatterns(N,NF,code);
elseif(code ==2)
    textcode ="Brauers"; % (Brauers and Aach, 2006)
    %Brauers, Johannes, and Til Aach. "A color filter array based multispectral camera." 12. Workshop Farbbildverarbeitung. Ilmenau, 2006.
    [G] = codedPatterns(N,NF,code);
elseif(code ==3)
    textcode ="Sequential";
    [G] = codedPatterns(N,NF,code);
elseif(code ==4)
    textcode ="Uniform";
    [G] = codedPatterns(N,NF,code);
end

if(method==1)
    textmethod ="Convolution_Filter"; % Convolution Filter (CF)
elseif(method == 2)
    textmethod="Iterative_Intensity_Difference";  %Iterative Intensity Difference (IID)
elseif(method ==3)
    textmethod ="Intensity_Difference"; % Intensity Difference (ID)
elseif(method ==4)
    textmethod ="Weighted_Billinear_Method"; % Weighted Billinear Method (WB)
elseif(method ==5)
    textmethod ="Scattered_data_interpolation_methods"; % Scattered data interpolation methods
end


%% Load Designed Coded Apertue
ti = "optimalPattern_"+num2str(N)+"x"+num2str(N)+"_filter="+num2str(NF)+".mat";
load(ti);
if(comparisonRGB ==1)
    figure('Renderer', 'painters', 'Position', [10 10 900 600])
end

for k=1:d % iterave over the datasets
    disp("Dataset="+num2str(k));
    disp("---------------------------------------------------------------------------------------------------------")
    if(NF <= 31)
        alldataset = {'balloons_ms','beads_ms','cd_ms','chart','clay_ms','cloth_ms','egyptian_statue_ms','feathers_ms','flowers_ms','glass_tiles_ms','pompoms_ms','sponges_ms','stuffed_toys_ms','superballs_ms','thread_spools_ms','fake_and_real_beers_ms','face_ms','real_and_fake_peppers_ms','real_and_fake_apples_ms','photo_and_face_ms','paints_ms','oil_painting_ms','jelly_beans_ms','hairs_ms','fake_and_real_tomatoes_ms','fake_and_real_sushi_ms','fake_and_real_strawberries_ms','fake_and_real_peppers_ms','fake_and_real_lemons_ms','fake_and_real_lemon_slices_ms','fake_and_real_food_ms','watercolors_ms'};
        dataset = alldataset{k};
    elseif(NF ==144)
        dataset = '2013_IEEE_GRSS_DF_Contest_CASI.tif';
    end
    
    %% Reconstruction using State-of-art-BTES(5-16) (NF<=16), and random (NF > 16)
    [XrecBTES,~]= Reconstruction(dataset,G,NF,JC,method);
    %% Reconstruction using Sphere Packing based Coded Aperture
    [Xrec,X]= Reconstruction(dataset,Go,NF,JC,method);
    
    disp("Multispectral Demosaicking using "+textmethod+", CA= Designed pattern, Dataset= "+ dataset);
    Xrec(Xrec(:)<0) = 0;
    %% Compute metrics
    X = mat2gray(X);
    for i=1:NF
        temp = Xrec(:,:,i);
        Xrec(:,:,i) = Xrec(:,:,i)./max(temp(:));
    end
    Xrec = mat2gray(Xrec);
    [p,s,r,sam] = metrics(X,Xrec);
    %% Table of metrics proposed method for each dataset
    table(k,:) =[p,s,r,sam];
    XrecBTES(XrecBTES(:)<0) = 0;
    disp("Multispectral Demosaicking using "+ textmethod + ", CA= "+textcode+", Dataset= " + dataset);
    %% Compute metrics
    for i=1:NF
        temp = XrecBTES(:,:,i);
        XrecBTES(:,:,i) = XrecBTES(:,:,i)./max(temp(:));
    end
    XrecBTES = mat2gray(XrecBTES);
    [p1,s1,r1,sam1] = metrics(X,XrecBTES);
    %% Generate RGB
    %[RGBrBTES] = Convert2RGB(XrecBTES,NF);
    [RGBrBTES] = RGB_test(XrecBTES);
    %% Table of metrics SOTA for each dataset
    table2(k,:) = [p1,s1,r1,sam1];
    
    %% Generate RGB image from datacube
    [RGB] = RGB_test(X);
    [RGBr] = RGB_test(Xrec);
    %[RGB] = Convert2RGB(X,NF);
    %[RGBr] = Convert2RGB(Xrec,NF);
    
    %% Groundtruth, Proposed method, and SOTA
    if(comparisonRGB ==1)
        subplot(1,3,1),imagesc(RGB),title("Groundtruth ");
        pbaspect([1 1 1])
        subplot(1,3,2),imagesc(RGBr),title("Optimal Distance, PSNR=  " + num2str(p)+" dB, SAM= "+num2str(sam));
        pbaspect([1 1 1])
        subplot(1,3,3),imagesc(RGBrBTES),title(textmethod +"+ "+ textcode + num2str(NF)+", PSNR= " + num2str(p1)+" dB, SAM= "+num2str(sam1));
        pbaspect([1 1 1])
    end
end
texto = "Results/results_NF="+num2str(NF)+"_N="+num2str(N)+"_Coded_Aperture="+textcode+"_Method="+textmethod+"_datasetsize="+d+".mat";
save(texto,'table','table2')
mean(table)
mean(table2)