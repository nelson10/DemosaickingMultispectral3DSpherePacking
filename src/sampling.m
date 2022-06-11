function [Xrec,X] = sampling(dataset,mask,L,JC,method,kdataset,k,code,realdata)
[M1,~,] = size(mask);
[X] = checkDataset(dataset,kdataset,L,M1);

[M2,~,~] = size(X);

plotshow = 0;
[SpectralProfiles] = SRIMEC(L,plotshow);

T = zeros(M1,M1,L);

for i=1:M1
    for j=1:M1
        tp = mask(i,j);
        T(i,j,:) = SpectralProfiles(tp,:);
    end
end
load('illum_6500.mat');
l=round(linspace(1,33,L));
for i=1:L
    if(realdata ==0)
        J(:,:,i) = double(X(:,:,i)).*(mask==i);
        T(:,:,i) = (mask==i);
    else
        J(:,:,i) = double(X(:,:,i)).*T(:,:,i)*0.1*illum_6500(l(i));
    end
end

Y = sum(J,3);
%save('measure','Y')
%imagesc(Y)

% for i=1:L
%     C= T(:,:,i)+eps;
%     fh(:,:,i) = inv(C'*C)*C'*Y;
% end
%% Activate JointCodedApertures to assume spectral correlation
if(JC == 1)
    [J] = JointCodedApertures(Y,T);
    [Xrec] = interpolation(J);
elseif(JC ==0 & method ~= 10)
    [Xrec] = reconstruction(J,mask,method);
    %Xrec(Xrec(:)<0) = 0;
    Xrec = uint8(Xrec);
end

if(method==10 & code==7)
    [dataset] = textDataset(kdataset,k,L);
    n = 1;
    dataset = strcat(dataset,num2str(n));
    load(dataset);
    pic(pic(:)<0) = 0;
    Xrec = uint8(pic);
elseif(method==10 & code==6)
    [dataset] = textDataset(kdataset,k,L);
    n = 2;
    dataset = strcat(dataset,num2str(n));
    load(dataset);
    load(dataset);
    pic(pic(:)<0) = 0;
    Xrec = uint8(pic);
end

end