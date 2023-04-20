function [Xrec] = GuidedFilter(J)
% Guided filter for hyperspectral images
    [Xrec] = WeightedBillinearMethod(J);  % Iterative Intensity Difference
    %[Xrec] = IterativeSpectralDifference(J,mask);
    [demsRGB1]= RGB_test(Xrec);
    %subplot(1,2,1),imagesc(demsRGB1);
    L = size(J,3);
    for i=1:L
        Xrec(:,:,i) = imguidedfilter(J(:,:,i),demsRGB1(:,:,2));
    end
    Xrec(Xrec<0) = 0;
    [demsRGB1]= RGB_test(Xrec);
    %subplot(1,2,2),imagesc(demsRGB1);
    Xrec = mat2gray(Xrec)*255;
end