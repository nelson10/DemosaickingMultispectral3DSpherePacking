function [J] = unfold(Y,M,N,L,shots,gdmd)
J =zeros(M,N,L);
su =zeros(M,N);
temp = zeros(M,N);
t =zeros(M,N);

for j=0:L-1 % spectral band
    for i=1:shots
        T = gdmd(1:M,1:N,j+1,i);
        if (i==1)
            temp = T;
        else
            t = temp & T;
        end
        J(:,:,j+1) = J(:,:,j+1) + Y(1:M,1+j:N+j).*(T-t);
        temp = T | temp;
        su = su + T;
    end
    %imagesc(su)
end
end