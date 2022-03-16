% Created by: Ph.D Nelson Eduardo Diaz Diaz
% Post-doctorado Pontícia Universidad Católica de Valparaíso (PUCV)
% Date 2 February 2022

clear all;
clc;
close all;

addpath(genpath('./Dataset'));
%kind = {'beads_ms'};
%kind = {'glass_tiles_ms'};
%kind = {'superballs_ms'};
%kind = {'balloons_ms'};
%kind = {'egyptian_statue_ms'};
%kind = {'flowers_ms'};
%kind = {'sponges_ms'};
%kind = {'clay_ms'};
%kind = {'cd_ms'};

% kind = {'cloth_ms'};
% kind = {'pompoms_ms'};
% kind = {'stuffed_toys_ms'};
% kind = {'thread_spools_ms'};


for i =1:31
    if(i <= 9)
        hyperimg(:,:,i) = imread([kind{1}+"_0"+num2str(i)+".png"]);
    else
        hyperimg(:,:,i) = imread([kind{1}+"_"+num2str(i)+".png"]);
    end
    
end
save([kind{1}+".mat"],'hyperimg');