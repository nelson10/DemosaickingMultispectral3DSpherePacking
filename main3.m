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
N = 256; % Spatial resolution
NF = 16; % Number of bands put 8 or 16
JC = 0; % 1 to use spectral correlation, 0 to avoid spectral correlation
realdata = 0;
kdataset = 1; %Cave dataset
m = [6,2,8,7,3,5,4];
cc = [5,1,2,3,4,6,7,8];
nc = length(cc);
nm = length(m);
comparisonRGB = 0; % 1 Show Groundtruth and Reconstructions, 0 it shows nothing

if(kdataset==1)
    if (NF <= 31)
        d = 32; % Select the dataset (Numbers between 1 and 32)
    elseif(NF ==144)
        d = 1;
    end
elseif(kdataset==2)
    d = 30;
end

table =zeros(d,4,nc,nm); %  PSNR, SSIM, RMSE, SAM of Sphere Packing based Coded Aperture

if(comparisonRGB ==1)
    figure('Renderer', 'painters', 'Position', [10 10 900 600])
end


for i=1:nm
    method = m(i);
    [textmethod] = checkMethod2(method);
    for c=1:nc
        code = cc(c)-1; % 0 Random, 1 Binary Tree-based edge-sensing (BTES), 2 (Brauers and Aach, 2006), 3 Sequential, 4 Uniform, 5 IMEC
        [G] = codedPatterns(N,NF,code);
        [textcode] =checkCode2(code);
        for k=1:d % iterave over the datasets
            disp("Dataset="+num2str(k));
            disp("---------------------------------------------------------------------------------------------------------")
            if(NF <= 31)
                alldataset = {'balloons_ms','beads_ms','cd_ms','chart','clay_ms','cloth_ms','egyptian_statue_ms','feathers_ms','flowers_ms','glass_tiles_ms','pompoms_ms','sponges_ms','stuffed_toys_ms','superballs_ms','thread_spools_ms','fake_and_real_beers_ms','face_ms','real_and_fake_peppers_ms','real_and_fake_apples_ms','photo_and_face_ms','paints_ms','oil_painting_ms','jelly_beans_ms','hairs_ms','fake_and_real_tomatoes_ms','fake_and_real_sushi_ms','fake_and_real_strawberries_ms','fake_and_real_peppers_ms','fake_and_real_lemons_ms','fake_and_real_lemon_slices_ms','fake_and_real_food_ms','watercolors_ms'};
                dataset = alldataset{k};
            elseif(NF ==144)
                dataset = '2013_IEEE_GRSS_DF_Contest_CASI.tif';
            end
            
            %% Reconstruction using Sphere Packing based Coded Aperture
            %[Xrec,X]= Reconstruction(dataset,G,NF,JC,method);
            [Xrec,X] = sampling(dataset,G,NF,JC,method,kdataset,k,code,realdata);
            disp("Multispectral Demosaicking using "+textmethod+", CA="+textcode+", Dataset= "+ dataset);
            
            %% Compute metrics
            [p,s,r,sam] = metrics(X,Xrec,kdataset);
            table(k,:,cc(c),m(i)-1) =[p,s,r,sam];
            
            %% Groundtruth, Proposed method, and SOTA
            if(comparisonRGB ==1)
                %% Generate RGB image from datacube
                [RGB] = RGB_test(X);
                [RGBr] = RGB_test(Xrec);
                subplot(1,3,1),imagesc(RGB),title("Groundtruth ");
                pbaspect([1 1 1])
                subplot(1,3,2),imagesc(RGBr),title("Optimal Distance, PSNR=  " + num2str(p)+" dB, SAM= "+num2str(sam));
                pbaspect([1 1 1])
                subplot(1,3,3),imagesc(RGBr0),title(textmethod +"+ "+ textcode + num2str(NF)+", PSNR= " + num2str(p1)+" dB, SAM= "+num2str(sam1));
                pbaspect([1 1 1])
            end
        end
    end
end
texto = "Results/results_NF="+num2str(NF)+"_N="+num2str(N)+"_Coded_Aperture="+textcode+"_Method="+textmethod+"_datasetsize="+d+".mat";
save(texto,'table')
    for i=1:nm
        [textmethod] =checkMethod(m(i));
        disp(textmethod);
        for c=1:nc
            [textcode] =checkCode2(cc(c)-1);
            disp(textcode);
            res = std((table(:,:,cc(c),m(i)-1)));
            disp(round(res,2));
        end
    end
%ComputeFigures();