function [t] = spectralfigure(orig,btes,ours,da,db)
%%
samour=zeros(256,256);
for i=1:256
    for j=1:256
        a=double(reshape(ours(i,j,:),[16,1]));
        b=double(reshape(orig(i,j,:),[16,1]));
        samour(i,j)=SpectralAngleMapper(a(:),b(:));
    end
end
samour=round(abs(samour),4);
%%
sambtes=zeros(256,256);
for i=1:256
    for j=1:256
        a=double(reshape(btes(i,j,:),[16,1]));
        b=double(reshape(orig(i,j,:),[16,1]));
        sambtes(i,j)=SpectralAngleMapper(a(:),b(:));
    end
end
sambtes=round(abs(sambtes),4);
%%
figure(1)
imagesc(sambtes)
axis image
axis off
colorbar
title("SAM BTES")
figure(2)
imagesc(samour)
axis image
axis off
colorbar
title("SAM OURS")
%%
r=2;% desplazamiento para sumar
nour=uint8(zeros(1,1,16));
nbtes=uint8(zeros(1,1,16));
norig=uint8(zeros(1,1,16));
for i=1:16
    nour(:,:,i)=mean(mean(ours(da-r:da+r,db-r:db+r,i)));
    nbtes(:,:,i)=mean(mean(btes(da-r:da+r,db-r:db+r,i)));
    norig(:,:,i)=mean(mean(orig(da-r:da+r,db-r:db+r,i)));
end
%%
figure(3)
t = tiledlayout(1,2,'TileSpacing','Compact','Padding','Compact');
title(t,'Spectral Comparison with TRevSCI-net')
% Left plot
nexttile
plot(reshape(nour,[16,1]),'b','Marker','*','Color','b')%,'filled')
axis square
hold on
plot(reshape(nbtes,[16,1]),'--r','Marker','*','Color','r')%,'filled')
plot(reshape(norig,[16,1]),'k','Marker','*','Color','k')%,'filled')
axis square
lh=legend('MSFA-OSP','MSFA-BTES','Groundtruth'); 
lh.Position(1) = 0.25 - lh.Position(3)/2; 
lh.Position(2) = 0.75 - lh.Position(4)/2;
xlim([0,17])
ylabel('Intensity')
xlabel('Number Bands')
hold off

% Right plot
nexttile
RGB=RGB_test(orig);
imshow(RGB)
hold on
plot(da,db, 'rs', 'MarkerSize', 5, 'LineWidth', 0.5);
hold off 
end