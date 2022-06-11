alldataset = {'balloons_ms','beads_ms','cd_ms','chart','clay_ms','cloth_ms','egyptian_statue_ms','feathers_ms','flowers_ms','glass_tiles_ms','pompoms_ms','sponges_ms','stuffed_toys_ms','superballs_ms','thread_spools_ms','fake_and_real_beers_ms','face_ms','real_and_fake_peppers_ms','real_and_fake_apples_ms','photo_and_face_ms','paints_ms','oil_painting_ms','jelly_beans_ms','hairs_ms','fake_and_real_tomatoes_ms','fake_and_real_sushi_ms','fake_and_real_strawberries_ms','fake_and_real_peppers_ms','fake_and_real_lemons_ms','fake_and_real_lemon_slices_ms','fake_and_real_food_ms','watercolors_ms'};
d = length(alldataset); % numbers of datasets
%% 
L=16; % Number of bands
GT={};
NetOSP={};
NetBTES={};
%%
for i=1:d
    alldataset = {'balloons_ms','beads_ms','cd_ms','chart','clay_ms','cloth_ms','egyptian_statue_ms','feathers_ms','flowers_ms','glass_tiles_ms','pompoms_ms','sponges_ms','stuffed_toys_ms','superballs_ms','thread_spools_ms','fake_and_real_beers_ms','face_ms','real_and_fake_peppers_ms','real_and_fake_apples_ms','photo_and_face_ms','paints_ms','oil_painting_ms','jelly_beans_ms','hairs_ms','fake_and_real_tomatoes_ms','fake_and_real_sushi_ms','fake_and_real_strawberries_ms','fake_and_real_peppers_ms','fake_and_real_lemons_ms','fake_and_real_lemon_slices_ms','fake_and_real_food_ms','watercolors_ms'};
    dataset = alldataset{k};
    load(dataset+".mat");
    id= round(linspace(1,31,L));
    hyperimg = hyperimg(:,:,id);
    X=uint8(255*mat2gray(imresize(hyperimg,[256,256])));
    GT{i}=X;
    alldataset = {'balloons_ms1','beads_ms1','cd_ms1','chart1','clay_ms1','cloth_ms1','egyptian_statue_ms1','feathers_ms1','flowers_ms1','glass_tiles_ms1','pompoms_ms1','sponges_ms1','stuffed_toys_ms1','superballs_ms1','thread_spools_ms1','fake_and_real_beers_ms1','face_ms1','real_and_fake_peppers_ms1','real_and_fake_apples_ms1','photo_and_face_ms1','paints_ms1','oil_painting_ms1','jelly_beans_ms1','hairs_ms1','fake_and_real_tomatoes_ms1','fake_and_real_sushi_ms1','fake_and_real_strawberries_ms1','fake_and_real_peppers_ms1','fake_and_real_lemons_ms1','fake_and_real_lemon_slices_ms1','fake_and_real_food_ms1','watercolors_ms1'};
    dataset = alldataset{k};
    load(dataset+".mat");
    XOSP=uint8(pic);
    NetOSP{i}=XOSP;
    %dataset=strcat(BTESdir,'/',alldataset{i});
    alldataset = {'balloons_ms2','beads_ms2','cd_ms2','chart2','clay_ms2','cloth_ms2','egyptian_statue_ms2','feathers_ms2','flowers_ms2','glass_tiles_ms2','pompoms_ms2','sponges_ms2','stuffed_toys_ms2','superballs_ms2','thread_spools_ms2','fake_and_real_beers_ms2','face_ms2','real_and_fake_peppers_ms2','real_and_fake_apples_ms2','photo_and_face_ms2','paints_ms2','oil_painting_ms2','jelly_beans_ms2','hairs_ms2','fake_and_real_tomatoes_ms2','fake_and_real_sushi_ms2','fake_and_real_strawberries_ms2','fake_and_real_peppers_ms2','fake_and_real_lemons_ms2','fake_and_real_lemon_slices_ms2','fake_and_real_food_ms2','watercolors_ms2'};
    dataset = alldataset{k};
    load(dataset+".mat");
    XBTES=uint8(pic);
    NetBTES{i}=XBTES;
end
%%
 j=find(contains(alldataset,'chart'));% set specific dataset
% Reference points in chart_ms
a=160;
b=100;
%a=145;
%b=100;
%a=160;
%b=160;

t=spectralfigure(GT{j},NetBTES{j},NetOSP{j},a,b);
%% For Save Figure
%exportgraphics(t,'plot_1.png')