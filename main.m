% Created by: Ph.D Nelson Eduardo Diaz Diaz
% Post-doctorado Pontícia Universidad Católica de Valparaíso (PUCV)
% Date 2 February 2022

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

%% Parameters
N = 256; % Spatial resolution
NF = 16; % Number of bands put 8 or 16
JC = 0; % 1 to use spectral correlation, 0 to avoid spectral correlation
d = 15;
table =zeros(d,4); %  PSNR, SSIM, RMSE, SAM of Sphere Packing based Coded Aperture
table2 =zeros(d,4); % PSNR, SSIM, RMSE, SAM of MSFA(5-16) or Random methods
comparisonRGB = 1; % Show Groundtruth and Reconstructions

if (NF <= 31)
    d = 15; % Select the dataset (Numbers between 1 and 15)
elseif(NF ==144)
    d = 1;
end

%% MSFA(5-16)
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

if(NF<=16)
    B = ones(N/4,N/4);
    G = kron(B,A);
elseif(NF > 16)
    %% Load SOTA Coded Aperture
    %text = "codes/design-mask_random_"+num2str(N)+"x"+num2str(N)+"NF="+num2str(NF);
    text = "Pattern/design-mask_random_"+num2str(N)+"x"+num2str(N)+"NF="+num2str(NF)+".mat";
    load(text)
end

%% Load Designed Coded Apertue
ti = "Pattern/optimalPattern_"+num2str(N)+"x"+num2str(N)+"_filter="+num2str(NF)+".mat";
load(ti);

for k=1:d % iterave over the datasets
    if(NF <= 31)
        alldataset = {'balloons_ms','beads_ms','cd_ms','chart','clay_ms','cloth_ms','egyptian_statue_ms','feathers_ms','flowers_ms','glass_tiles_ms','pompoms_ms','sponges_ms','stuffed_toys_ms','superballs_ms','thread_spools_ms'};
        dataset = alldataset{k};
    elseif(NF ==144)
        dataset = '2013_IEEE_GRSS_DF_Contest_CASI.tif';
    end
    
    %% Reconstruction using State-of-art-MSFA(5-16) (NF<=16), and random (NF > 16)
    [XrecMSFA,~]= Reconstruction(dataset,G,NF,JC);
    %% Reconstruction using Sphere Packing based Coded Aperture
    [Xrec,X]= Reconstruction(dataset,mask,NF,JC);
    
    disp("Interpolation of Spectral Compressive Measurements Captured using Designed Coded Apertures, Dataset "+ dataset);
    Xrec(Xrec(:)<0) = 0;
    %% Compute metrics
    X = mat2gray(X);
    Xrec = mat2gray(Xrec);
    [p,s,r,sam] = metrics(X,Xrec);
    %% Table of metrics proposed method for each dataset
    table(k,:) =[p,s,r,sam];
    
    XrecMSFA(XrecMSFA(:)<0) = 0;
    disp("Interpolation of Spectral Compressive Measurements Captured using MSFA Coded Pattern, Dataset "+ dataset);
    %% Compute metrics
    %XrecMSFA = XrecMSFA./max(XrecMSFA(:));
    XrecMSFA = mat2gray(XrecMSFA);
    [p1,s1,r1,sam1] = metrics(X,XrecMSFA);
    %% Generate RGB
    %[RGBrMSFA] = Convert2RGB(XrecMSFA,NF);
    [RGBrMSFA] = RGB_test(XrecMSFA);
    %% Table of metrics SOTA for each dataset
    table2(k,:) = [p1,s1,r1,sam1];
    
    %% Generate RGB image from datacube
    [RGB] = RGB_test(X);
    [RGBr] = RGB_test(Xrec);
    %[RGB] = Convert2RGB(X,NF);
    %[RGBr] = Convert2RGB(Xrec,NF);
    
    %% Groundtruth, Proposed method, and SOTA
    if(comparisonRGB ==1)
        figure(1)
        subplot(1,3,1),imagesc(RGB),title("Groundtruth ")
        pbaspect([1 1 1])
        subplot(1,3,2),imagesc(RGBr),title("Optimal Distance, PSNR=  " + num2str(p)+" dB")
        pbaspect([1 1 1])
        if(NF==25 || NF==31 || NF==144)
            subplot(1,3,3),imagesc(RGBrMSFA),title("Random"+num2str(NF)+", PSNR= " + num2str(p1)+" dB")
            pbaspect([1 1 1])
        elseif(NF<=16)
            subplot(1,3,3),imagesc(RGBrMSFA),title("MSFA"+num2str(NF)+", PSNR= " + num2str(p1)+" dB")
            pbaspect([1 1 1])
        end
    end
end
texto = "results_NF=" + num2str(NF)+"N="+num2str(N)+".mat";
save(texto,'table','table2')