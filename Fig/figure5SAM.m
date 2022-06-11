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
addpath(genpath('./Test1'));
addpath(genpath('./Test'));

%% Parameters
N = 256; % Spatial resolution
NF = 16; % Number of bands put 8 or 16
JC = 0; % 1 to use spectral correlation, 0 to avoid spectral correlation
d = 32;
kdataset = 1; % 1 Cave
realdata = 0;
Fontsize = 16;

code = 6; % 0 Random, 1 blue noise, 2 (Brauers and Aach, 2006), 3 Sequential, 4 Uniform, 5 IMEC,  6 Binary Tree-based edge-sensing (BTES), 7 Sphere packing
comparisonRGB = 1; % 1 Show Groundtruth and Reconstructions, 0 it shows nothing
method = 6; % 1 Convolution Filter (CF), 2 Iterative Intensity Difference (IID), 3 Intensity Difference (ID), 4 Weighted Billinear Method, 5  Scattered data interpolation methods, 6 Iterative Nearby Channel Difference(ItNCD), 7 Spectral Difference(SD), 8 Iterative Spectral Difference(SD)
nc = 2;
table =zeros(d,4,nc); %  PSNR, SSIM, RMSE, SAM of Sphere Packing based Coded Aperture

if (NF <= 31)
    d = 32; % Select the dataset (Numbers between 1 and 15)
elseif(NF ==144)
    d = 1;
end

%% Load Designed Coded Apertue
%[Go] = codedPatterns(N,NF,code);
if(comparisonRGB ==1)
    fig=figure('Renderer', 'painters', 'Position', [10 10 1500 1200]);
    set(gca,'FontSize',Fontsize)
end

%kk = [7,7,4,4,31,31]+1;
%kk = [2,2,5,5,32,32];
kk = [15,15,10,10,21,21];
%jj = [8 7 5 4 3 2 6];
jj = [4 2 6 10];
nd = 6;
J = 4;
J7 = J+1;
t = tiledlayout(nd,J7,'TileSpacing','Compact','Padding','Compact');
for l=1:nd % iterave over the datasets
    if(mod(l,2)==0)
        code = 6;
    else
        code = 7;
    end
    [G] = codedPatterns(N,NF,code);
    k = kk(l);
    disp("Dataset="+num2str(k));
    disp("---------------------------------------------------------------------------------------------------------");
    if(NF <= 31)
        alldataset = {'balloons_ms','beads_ms','cd_ms','chart','clay_ms','cloth_ms','egyptian_statue_ms','feathers_ms','flowers_ms','glass_tiles_ms','pompoms_ms','sponges_ms','stuffed_toys_ms','superballs_ms','thread_spools_ms','fake_and_real_beers_ms','face_ms','real_and_fake_peppers_ms','real_and_fake_apples_ms','photo_and_face_ms','paints_ms','oil_painting_ms','jelly_beans_ms','hairs_ms','fake_and_real_tomatoes_ms','fake_and_real_sushi_ms','fake_and_real_strawberries_ms','fake_and_real_peppers_ms','fake_and_real_lemons_ms','fake_and_real_lemon_slices_ms','fake_and_real_food_ms','watercolors_ms'};
        dataset = alldataset{k};
    elseif(NF ==144)
        dataset = '2013_IEEE_GRSS_DF_Contest_CASI.tif';
    end
    
    %% Reconstruction using State-of-the-art
    for j=1:J
        method = jj(j);
        [textcode] =checkCode(code);
        [XrecMSFA,X]= sampling(dataset,G,NF,JC,method,kdataset,k,code,realdata);
        
        if(j == 1)
            %% Generate RGB image from datacube
            [RGB] = RGB_test(X);
            nexttile
            imagesc(RGB),title("Groundtruth ",'fontsize',Fontsize),axis off,pbaspect([1 1 1]);
        end
        [textmethod] = checkMethod2(method);
        %% Table of metrics proposed method for each dataset
        %table(k,:,1) =[p,s,r,sam];
        disp("Multispectral Demosaicking using "+ textmethod + ", CA= "+textcode+", Dataset= " + dataset);
        %% Compute metrics
        [p1,s1,r1,sam1,sa(:,:,j,l)] = metrics2(X,XrecMSFA);
        %% Table of metrics SOTA for each dataset
        table(k,:,2) = [p1,s1,r1,sam1];
        %% Groundtruth, Proposed method, and SOTA
        nexttile
        imagesc(sa((1+6):(N-6),(1+6):(N-6),j,l)),axis off,pbaspect([1 1 1]), title(textmethod +", SAM= " + num2str(sam1),'fontsize',Fontsize); %SAM= "+num2str(sam1)
    end
end

h = axes(fig,'visible','off');
h.Title.Visible = 'on';
h.XLabel.Visible = 'on';
h.YLabel.Visible = 'on';
%ylabel(h,'yaxis','FontWeight','bold');
%xlabel(h,'xaxis','FontWeight','bold');
%title(h,'title');
minColorLimit = min(min(min(sa(:))));                   % determine colorbar limits from data
maxColorLimit = max(max(max(sa(:))));
c = colorbar(h,'Position',[0.95 0.168 0.022 0.7]);  % attach colorbar to h
colormap(c,'jet')
caxis(h,[minColorLimit,maxColorLimit]);             % set colorbar limits
texto = "Results/results_NF="+num2str(NF)+"_N="+num2str(N)+"_Coded_Aperture="+textcode+"_Method="+textmethod+"_datasetsize="+d+".mat";
%save(texto,'table','table2')
disp("Designed");
mean(table(:,1,1))
disp("SOTA");
mean(table(:,1,2))
%ComputeFigures();