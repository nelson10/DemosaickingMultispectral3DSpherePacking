function [X]= checkDataset(dataset,kdataset,L,M)
if(kdataset==1)
    if(L <= 31)
        load(dataset+".mat");
        id= round(linspace(1,31,L));
        hyperimg = hyperimg(:,:,id);
        %M = size(mask,2);
        N = size(hyperimg,2);
        if(M ~= N)
            for i=1:L
                I(:,:,i) = imresize(hyperimg(:,:,i),M/N);
            end
            hyperimg = I;
        end
    elseif(L ==144)
        hyperimg = imread(dataset);
        id = round(linspace(1,144,L));
        hyperimg = hyperimg(1:M1,1:M1,id);
    end
      X = double(hyperimg);
      X = uint8(X/250);
elseif(kdataset==2)
    load(dataset+".mat");
    id= round(linspace(1,31,L));
    img = img(:,:,id);
    N = size(img,2);
    for l=1:L
        hyperimg(:,:,l) = imresize(img(:,:,l),M/N);
    end
    X = uint8(hyperimg*(2^8-1));
end
% for i= 1:L
%     tp = hyperimg(:,:,i);
%     X(:,:,i) = uint8(hyperimg(:,:,i)/max(tp(:)));
% end

end