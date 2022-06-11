function [textmethod] = checkMethod2(method)
if(method==1)
    textmethod ="CF"; % Convolution Filter (CF)
elseif(method == 2)
    textmethod="ItID";  %Iterative Intensity Difference (IID)
elseif(method ==3)
    textmethod ="ID "; % Intensity Difference (ID)
elseif(method ==4)
    textmethod ="WB"; % Weighted Billinear Method (WB)
elseif(method ==5)
    textmethod ="Interpolation"; % Scattered data interpolation methods
elseif(method ==6)
    textmethod="ItNCD";  %Iterative Nearby Channel Difference(ItNCD)
elseif(method ==7)
    textmethod="SD";  % Spectral Difference(SD)
elseif(method ==8)
    textmethod="ItSD";  % Iterative Spectral Difference(ItSD)
elseif(method ==9)
    textmethod="PseudoPanchromaticImageDifference";  % Pseudo Panchromatic Image Difference
elseif(method ==10)
    textmethod="TRevSCI";  % Residual Compressive spectral Imaging
end
end