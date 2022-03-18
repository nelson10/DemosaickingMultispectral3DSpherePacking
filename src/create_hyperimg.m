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
%kind = {'fake_and_real_beers_ms'};
%   kind = {'face_ms'};
kind = {'watercolors_ms'};
%kind = {'thread_spools_ms'};
%kind = {'real_and_fake_peppers_ms'};
%kind = {'real_and_fake_apples_ms'};
%kind = {'photo_and_face_ms'};
%kind = {'paints_ms'};
%kind = {'oil_painting_ms'};
%kind = {'jelly_beans_ms'};
%kind = {'hairs_ms'};
%kind = {'fake_and_real_tomatoes_ms'};
%kind = {'fake_and_real_sushi_ms'};
%kind = {'fake_and_real_strawberries_ms'};
%kind = {'fake_and_real_peppers_ms'}; 
%kind = {'watercolors_ms'};
%kind = {'fake_and_real_food_ms'};
%kind = {'fake_and_real_lemon_slices_ms'};
%kind = {'fake_and_real_lemons_ms'};


for i =1:31
    if(i <= 9)
        texto =[kind{1}+"_0"+num2str(i)+".png"];
        temp = imread(texto);
        hyperimg(:,:,i) = rgb2gray(temp);
        i
    else
        texto = [kind{1}+"_"+num2str(i)+".png"];
        temp = imread(texto);
        hyperimg(:,:,i) = rgb2gray(temp);
    end
    
end


save([kind{1}+".mat"],'hyperimg');