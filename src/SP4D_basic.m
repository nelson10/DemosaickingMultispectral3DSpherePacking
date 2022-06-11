clear all;
N = 128;
NF = 16;
a = 2;
b = 3;
c = 5;

for i=1:N
    for j=1:N
        for k=1:N
            G(i,j,k) = (a*i +  b*j + c*k)+1;
        end
    end 
end
implay(G./max(G(:)))