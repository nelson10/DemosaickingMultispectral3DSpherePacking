function [dataset] = textScene(kdataset,k,NF)
if(kdataset==1)
    if(NF <= 31)
        alldataset = {'balloons_ms','beads_ms','cd_ms','chart','clay_ms','cloth_ms','egyptian_statue_ms','feathers_ms','flowers_ms','glass_tiles_ms','pompoms_ms','sponges_ms','stuffed_toys_ms','superballs_ms','thread_spools_ms','fake_and_real_beers_ms','face_ms','real_and_fake_peppers_ms','real_and_fake_apples_ms','photo_and_face_ms','paints_ms','oil_painting_ms','jelly_beans_ms','hairs_ms','fake_and_real_tomatoes_ms','fake_and_real_sushi_ms','fake_and_real_strawberries_ms','fake_and_real_peppers_ms','fake_and_real_lemons_ms','fake_and_real_lemon_slices_ms','fake_and_real_food_ms','watercolors_ms'};
        dataset = alldataset{k};
    elseif(NF ==144)
        dataset = '2013_IEEE_GRSS_DF_Contest_CASI.tif';
    end
elseif(kdataset==2)
    alldataset = {'Butterfly','Butterfly2','Butterfly3','Butterfly4','Butterfly5','Butterfly6','CD','Character','Cloth','Cloth2','Color','Colorchart','Fan','Party','Tshirts','Butterfly7','Butterfly8','Cloth3','Cloth4','Cloth5','Cloth6','Doll','Fan2','Fan3','Flower','Flower2','Flower3','Tape','Tape2','Tshirts2'};
    dataset = alldataset{k};
end
end