function [textcode] =checkCode(code)
if(code==0)
    textcode ="Random";
elseif(code ==1)
    textcode ="BlueNoise";
elseif(code ==2)
    textcode ="Brauers"; % (Brauers and Aach, 2006)
    %Brauers, Johannes, and Til Aach. "A color filter array based multispectral camera." 12. Workshop Farbbildverarbeitung. Ilmenau, 2006.
elseif(code ==3)
    textcode ="Sequential";
elseif(code ==4)
    textcode ="Uniform";
elseif(code ==5)
    textcode ="IMEC";
elseif(code == 6)
    textcode ="BTES";  %Binary Tree-based edge-sensing (BTES)
elseif(code ==7)
    textcode ="SpherePacking";
end
end