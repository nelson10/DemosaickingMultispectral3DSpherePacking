function [textmethod] = checkMethod(method)
if(method==1)
    textmethod ="ConvolutionFilter"; % Convolution Filter (CF)
elseif(method == 2)
    textmethod="IterativeIntensityDifference";  %Iterative Intensity Difference (IID)
elseif(method ==3)
    textmethod ="IntensityDifference "; % Intensity Difference (ID)
elseif(method ==4)
    textmethod ="WeightedBillinearMethod"; % Weighted Billinear Method (WB)
elseif(method ==5)
    textmethod ="ScatteredDataInterpolationMethods"; % Scattered data interpolation methods
elseif(method ==6)
    textmethod="IterativeNearbyChannelDifference(ItNCD)";  %Iterative Nearby Channel Difference(ItNCD)
elseif(method ==7)
    textmethod="SpectralDifference(SD)";  % Spectral Difference(SD)
elseif(method ==8)
    textmethod="IterativeSpectralDifference(ItSD)";  % Iterative Spectral Difference(SD)
end
end