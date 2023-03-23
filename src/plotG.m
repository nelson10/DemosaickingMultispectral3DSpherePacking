function [] = plotG(G)
B=max(G(:));
G=G(1:B,1:B);
dq=zeros(B,B)-1;
plot(dq)
xlim([0.49,B+1-0.49])
ylim([0.49,B+1-0.49])
Gt=G';
for i= 1:B
    for j=1:B
       t = text(i,1+B-j,num2str(Gt(i,j)),'HorizontalAlignment', 'center','FontSize',13);
    end
end
for i = 1:17
    xline(i-1+0.5)
    yline(i-1+0.5)
end
axis off
end