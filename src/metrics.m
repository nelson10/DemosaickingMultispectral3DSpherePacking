function [p,s,r,sam] = metrics(data,Xrec)
[M,N,L] = size(Xrec);
for i=1:L
    frame = Xrec(:,:,i);
    Xrec(:,:,i) = frame./max(frame(:));
end
p = zeros(L,1);
s = zeros(L,1);
rm = zeros(L,1);
for i=1:L
    p(i) = psnr(Xrec(:,:,i),data(:,:,i));
    s(i) = ssim(Xrec(:,:,i),data(:,:,i));
    v1= Xrec(:,:,i);
    v2= data(:,:,i);
    rm(i) = sqrt(mean(v1(:)-v2(:)).^2);
end

sa = zeros(M,N);
for n=1:N
    for m=1:M
    v1 = Xrec(m,n,:);
    v2 = data(m,n,:);
    v1 = v1(:);
    v2 = v2(:);
    sa(m,n) = SpectralAngleMapper(v1,v2+eps);
    end
end

p = mean(p); % psnr
s= mean(s); % ssim
r = mean(rm); % rmse
sam = mean(sa(:)); % sam Measure spectral similarity using spectral angle mapper
disp("PSNR "+ num2str(p)+ " SSIM "+num2str(s)+" RMSE "+num2str(r)+" SAM "+num2str(sam));
end