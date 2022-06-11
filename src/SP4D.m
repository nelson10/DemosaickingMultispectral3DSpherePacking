clear all;
N = 128;
NF = 16;
a = 2;
b = 3;
c = 5;
x = ones(1,NF)';
y = (1:NF)';
I = kron(x',y);
J = kron(x,y');
K = kron(x',y);
G = zeros(NF,NF,NF);
for k=1:NF
    %for j=1:N
      %  for i=1:N
            G(:,:,k) = mod(a*I +  b*J + c*k,NF)+1;
     %   end
    %end 
end
%implay((G./NF)==1)
for i=1:NF
    imagesc(sum(G==i,3))
    pause(0.5)
end
