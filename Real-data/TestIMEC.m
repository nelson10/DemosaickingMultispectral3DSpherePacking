L =25;
plotshow = 1;

if L == 25
    load('spectral_responses_5x5.mat');
elseif L == 16
    load('spectral_responses_4x4.mat');
    CentralWavelengths = CentralWavelength;
else
    disp('Error');
end

[L,n]= size(SpectralProfiles);

l = round(squeeze(CentralWavelengths))';
[v,~] = sort(l);
tp = num2str(v);

Fontsize = 16;
vmax = max(v);
vmin = min(v);
x = linspace(vmin,vmax,n);
fig=figure(1);

for i = 1:L
    SpectralProfiles(i,:) = SpectralProfiles(i,:)./sum(SpectralProfiles(i,:));
    %sp = zeros(1,L);
    %sp(1,i) = 1;
    %SpectralProfiles(i,:) = sp(1,:)./sum(sp(1,:));
    if(plotshow == 1)
        y = SpectralProfiles(i,:);
        plot(x,y,'-','linewidth',1.5)
        xlim([vmin,vmax])
        hold on;
    end
end

set(gca,'FontSize',Fontsize)
title("IMEC Wavelength "+num2str(L)+"x"+num2str(L),'fontsize',Fontsize)
xlabel("Wavelength (\lambda)",'fontsize',Fontsize)
ylabel("Transmittance T_{IMEC}(\lambda)",'fontsize',Fontsize)
if(L==16)
    legend(tp(1,:),tp(2,:),tp(3,:),tp(4,:),tp(5,:),tp(6,:),tp(7,:),tp(8,:),tp(9,:),tp(10,:),tp(11,:),tp(12,:),tp(13,:),tp(14,:),tp(15,:),tp(16,:),'Location','northeastoutside');
elseif(L==25)
    legend(tp(1,:),tp(2,:),tp(3,:),tp(4,:),tp(5,:),tp(6,:),tp(7,:),tp(8,:),tp(9,:),tp(10,:),tp(11,:),tp(12,:),tp(13,:),tp(14,:),tp(15,:),tp(16,:),tp(17,:),tp(18,:),tp(19,:),tp(20,:),tp(21,:),tp(22,:),tp(23,:),tp(24,:),tp(25,:),'Location','northeastoutside');
end
orient(fig,'landscape')
print(fig,"ImecSR"+num2str(L)+".png",'-dpng','-r200')