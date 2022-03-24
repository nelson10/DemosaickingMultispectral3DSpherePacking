function [Xrec]= normalizeCube(Xrec,NF)
Xrec(Xrec(:)<0) = 0;
for i=1:NF
    temp = Xrec(:,:,i);
    Xrec(:,:,i) = Xrec(:,:,i)./max(temp(:));
end
Xrec = mat2gray(Xrec);
end