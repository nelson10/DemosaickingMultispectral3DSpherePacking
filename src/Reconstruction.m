function [Xrec,X] = Reconstruction(dataset,mask,L,JC)
length(unique(mask(:)))

[M1,~,] = size(mask);
if(L <= 31)
    load(dataset+".mat");
    id= round(linspace(1,31,L));
    hyperimg = hyperimg(:,:,id);
    M = size(mask,2);
    N = size(hyperimg,2);
    if(M ~= N)
        for l=1:L
            I(:,:,l) = imresize(hyperimg(:,:,l),M/N);
        end
        hyperimg = I;
    end
elseif(L ==144)
    hyperimg = imread(dataset);
    id = round(linspace(1,144,L));
    hyperimg = hyperimg(1:M1,1:M1,id);
end

[M2,~,~] = size(hyperimg);

for i=1:L
    data(:,:,i) = imresize(hyperimg(:,:,i),M1/M2);
end

X= mat2gray(double(data));

for i=1:L
    J(:,:,i) = X(:,:,i).*(mask==i).*255;
    T(:,:,i) = (mask==i);
end
Y = sum(J,3);
save('measure','Y')
%imagesc(Y)
%% Activate JointCodedApertures to assume spectral correlation
if(JC == 1)
    [J] = JointCodedApertures(Y,T);
    [Xrec] = interpolation(J);
else
    [Xrec] = interpolation(J);
    %[Xrec] = interpolation2(J,mask);
end


end