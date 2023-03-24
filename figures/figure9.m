% Created by: Ph.D Nelson Eduardo Diaz Diaz
% Post-doctorado Pontícia Universidad Católica de Valparaíso (PUCV)
% Date 2 February 2022

% Implements the methods of the paper: Demosaicking Multispectral Images Based on Sphere Packing Filter Design

% Comparison of minimum distance
% Solution using the Discrete Sphere Packing based on 3D N^2 Queens
% Approach

clear all;
clc;
%close all;
%% Add path to the dataset
addpath(genpath('./Dataset'));
addpath(genpath('./codes'));
addpath(genpath('./RGB'));
addpath(genpath('./src'));
addpath(genpath('./Fig'));
addpath(genpath('./Pattern'));
addpath(genpath('./Real-data'));
addpath(genpath('./Results'));
addpath(genpath('./Test1'));
addpath(genpath('./Test'));

%% Parameters
N = 256; % Spatial resolution
NF = 16; % Number of bands put 8 or 16
JC = 0; % 1 to use spectral correlation, 0 to avoid spectral correlation,%
d = 32;
Fontsize = 10;

code = [6,7]; % 0 Random, 1 blue noise, 2 (Brauers and Aach, 2006), 3 Sequential, 4 Uniform, 5 IMEC,  6 Binary Tree-based edge-sensing (BTES), 7 Sphere packing
comparisonRGB = 1; % 1 Show Groundtruth and Reconstructions, 0 it shows nothing
method = 6; % 1 Convolution Filter (CF), 2 Iterative Intensity Difference (IID), 3 Intensity Difference (ID), 4 Weighted Billinear Method, 5  Scattered data interpolation methods, 6 Iterative Nearby Channel Difference(ItNCD), 7 Spectral Difference(SD), 8 Iterative Spectral Difference(SD)
nc = 2;
table =zeros(d,4,nc); %  PSNR, SSIM, RMSE, SAM of Sphere Packing based Coded Aperture
kdataset = 1; % 1 Cave
realdata = 0;
voc={'(a)','(b)','(c)','(d)','(e)'};


if (NF <= 31)
    d = 32; % Select the dataset (Numbers between 1 and 15)
elseif(NF ==144)
    d = 1;
end

[G] = codedPatterns(N,NF,code(1));
[textcode] =checkCode(code(1));
[G1] = codedPatterns(N,NF,code(1));
[textcode1] =checkCode(code(1));
[G2] = codedPatterns(N,NF,code(2));
[textcode2] =checkCode(code(2));
%% Load Designed Coded Apertue
%[Go] = codedPatterns(N,NF,code);
if(comparisonRGB ==1)
    fig=figure(9);
    set(gcf,'Renderer', 'painters', 'Position', [2.8046 4.2598 10.1865 20.9815]);
    %figure('Renderer', 'painters', 'Position', [10 10 350 680]);
    set(gca,'FontSize',Fontsize)    
end

%kk = [7,4,31];
kk = [15,15,10,10,21,21]; % dataset
%jj = [8 7 5 4 3 2 6];
jj = [10 10]; % reconstruction method
nd = 3;
J = 2;
J7 = J+1;
t = tiledlayout(2*nd,J7,'TileSpacing','none','Padding','none');
cmap=colormap(parula(256));
count=1;
for l=1:2*nd % iterave over the datasets
    k = kk(l);
    disp("Dataset="+num2str(k));
    disp("---------------------------------------------------------------------------------------------------------")
    if(NF <= 31)
        alldataset = {'balloons_ms','beads_ms','cd_ms','chart','clay_ms','cloth_ms','egyptian_statue_ms','feathers_ms','flowers_ms','glass_tiles_ms','pompoms_ms','sponges_ms','stuffed_toys_ms','superballs_ms','thread_spools_ms','fake_and_real_beers_ms','face_ms','real_and_fake_peppers_ms','real_and_fake_apples_ms','photo_and_face_ms','paints_ms','oil_painting_ms','jelly_beans_ms','hairs_ms','fake_and_real_tomatoes_ms','fake_and_real_sushi_ms','fake_and_real_strawberries_ms','fake_and_real_peppers_ms','fake_and_real_lemons_ms','fake_and_real_lemon_slices_ms','fake_and_real_food_ms','watercolors_ms'};
        dataset = alldataset{k};
    elseif(NF ==144)
        dataset = '2013_IEEE_GRSS_DF_Contest_CASI.tif';
    end
    if (mod(l,2)==0)
        G=G2;
        textcode=textcode2;
        c=2;
    else
        G=G1;
        textcode=textcode1;
        c=1;
    end
    %% Reconstruction using State-of-the-art
    if count>4
        count=1;
    else
        count=count;
    end
    for j=1:J
        method = jj(j);

        [XrecMSFA,X]= sampling(dataset,G,NF,JC,method,kdataset,k,code(c),realdata);
    %%

        alldataset = {'balloons_ms','beads_ms','cd_ms','chart','clay_ms','cloth_ms','egyptian_statue_ms','feathers_ms','flowers_ms','glass_tiles_ms','pompoms_ms','sponges_ms','stuffed_toys_ms','superballs_ms','thread_spools_ms','fake_and_real_beers_ms','face_ms','real_and_fake_peppers_ms','real_and_fake_apples_ms','photo_and_face_ms','paints_ms','oil_painting_ms','jelly_beans_ms','hairs_ms','fake_and_real_tomatoes_ms','fake_and_real_sushi_ms','fake_and_real_strawberries_ms','fake_and_real_peppers_ms','fake_and_real_lemons_ms','fake_and_real_lemon_slices_ms','fake_and_real_food_ms','watercolors_ms'};
        dataset = alldataset{k};
        
        if(j == 1)
            if contains(textcode,'IMEC')
                tc='MSFA-IMEC';
            else
                tc='MSFA-OSP';
            end
            %% Generate RGB image from datacube
            [RGB] = RGB_test(X);
            nexttile
            RGB2=padarray(RGB,[3 3],1,'both');
            if l==1 
                imshow(RGB2),title("Groundtruth ",'fontsize',Fontsize);
                %text(50,-20,"Groundtruth" ,'Color','Black','FontSize',Fontsize,'FontWeight','bold');
                ylh=ylabel(tc,'FontWeight','bold')
                dy=1*ylh.Position(1);
                ylh.Position(1)=ylh.Position(1)-dy;
            elseif l==2*nd
                imshow(RGB2);
                ylh=ylabel(tc,'FontWeight','bold')
                dy=1*ylh.Position(1);
                ylh.Position(1)=ylh.Position(1)-dy;
                text(125,280,voc{j} ,'Color','Black','FontSize',Fontsize,'Fontname','Times','FontWeight','bold');
            else
                imshow(RGB2);
                ylh=ylabel(tc,'FontWeight','bold')
                dy=1*ylh.Position(1);
                ylh.Position(1)=ylh.Position(1)-dy;
            end
        end
        [textmethod] = checkMethod2(method);
        %% Table of metrics proposed method for each dataset
        %table(k,:,1) =[p,s,r,sam];
        disp("Multispectral Demosaicking using "+ textmethod + ", CA= "+textcode+", Dataset= " + dataset);
        %% Compute metrics
        [p1,s1,r1,sam1,sa] = metrics2(X,XrecMSFA);
        %% Generate RGB
        [RGBrBTES] = RGB_test(XrecMSFA);
        %% Table of metrics SOTA for each dataset
        table(k,:,2) = [p1,s1,r1,sam1];
        
        %[RGBr] = RGB_test(Xrec);
        %% Groundtruth, Proposed method, and SOTA
        %if(comparisonRGB ==1)
        %subplot(nd,J+1,((l-1)*(J+1))+j+1),
       nexttile
        position=[1 1];
        RGBrBTES2=padarray(RGBrBTES,[3 3],1,'both');
        if l==1
            minv = min(sa(:));
            maxv = max(sa(:));
            ncol = size(cmap,1);
            s = round(1+(ncol-1)*(sa-minv)/(maxv-minv));
            sa2 = ind2rgb(s,cmap); 
            sa3=padarray(sa2,[3 3],255,'both');
            imagesc(sa),axis image,pbaspect([1 1 1]), title(strcat(num2str(NF),' Filters'),'fontsize',Fontsize )
            %imshow(sa3)
            set(gca,'xtick',[])
            set(gca,'ytick',[])
            set(gca,  'XColor','w', 'YColor','w')
            %set(gca,'visible','off')
            %text(50,-20,textmethod ,'Color','Black','FontSize',Fontsize,'FontWeight','bold');
            text(4,15,"SAM=" + num2str(round(sam1,2)),'Color','white','FontSize',Fontsize,'Fontname','Times');
        elseif l==2*nd
            minv = min(sa(:));
            maxv = max(sa(:));
            ncol = size(cmap,1);
            s = round(1+(ncol-1)*(sa-minv)/(maxv-minv));
            sa2 = ind2rgb(s,cmap);
            sa3=padarray(sa2,[3 3],255,'both');
            imagesc(sa),axis image,pbaspect([1 1 1]);
            %imshow(sa3,cmap)
            set(gca,'xtick',[])
            set(gca,'ytick',[])
            %set(gca,'visible','off')
            set(gca,  'XColor','w', 'YColor','w')
            %imshow(sa3); 
            text(4,15,"SAM=" + num2str(round(sam1,2)) ,'Color','white','FontSize',Fontsize,'Fontname','Times');
            %xlh=xlabel(voc{j+1},'FontWeight','bold')
            %dx=0.05*xlh.Position(2);
            %xlh.Position(2)=260;
            text(125,275,voc{j+1} ,'Color','Black','FontSize',Fontsize,'Fontname','Times','FontWeight','bold');
        else
            minv = min(sa(:));
            maxv = max(sa(:));
            ncol = size(cmap,1);
            s = round(1+(ncol-1)*(sa-minv)/(maxv-minv));
            sa2 = ind2rgb(s,cmap); 
            sa2 = ind2rgb(s,cmap); 
            sa3=padarray(sa2,[3 3],255,'both');
            imagesc(sa),axis image,pbaspect([1 1 1]);
            %imshow(sa3)
            set(gca,'xtick',[])
            set(gca,'ytick',[])
            set(gca,  'XColor','w', 'YColor','w')
            %set(gca,'visible','off')

            text(4,15,"SAM=" + num2str(round(sam1,2)) ,'Color','white','FontSize',Fontsize,'Fontname','Times');
        end
        count=count+1;
    end
    %subplot(nd,J+1,((l-1)*(J+1))+1),
    
end
    cb = colorbar;
    cb.Layout.Tile = 'north';
    set(gca,'Position', [10 10 365 750])
texto = "Results/results_NF="+num2str(NF)+"_N="+num2str(N)+"_Coded_Aperture="+textcode+"_Method="+textmethod+"_datasetsize="+d+".mat";
%save(texto,'table','table2')
disp("Designed");
mean(table(:,1,1))
disp("SOTA");
mean(table(:,1,2))
print(fig,'figure9.eps','-depsc','-r400')
%ComputeFigures();