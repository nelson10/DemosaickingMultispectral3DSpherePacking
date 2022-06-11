load('illum_6500.mat')
plot(mat2gray(illum_6500(:)).*255)
ylabel('E(\lambda)')

load('spectral_responses_5x5.mat')
[nf,lg] = size(SpectralProfiles);
[d,id]= sort(CentralWavelengths(:));
for i=1:nf
    hold on;
    plot(SpectralProfiles(id(i),:))
end
xlabel('Wavelength \lambda (nm)')
[d,id]= sort(CentralWavelengths(:));
legend(num2str(d))

load('spectral_responses_4x4.mat')
[nf,lg] = size(SpectralProfiles);
[d,id]= sort(CentralWavelength(:));
x = linspace(470,630,601);
for i=1:nf
    hold on;
    plot(x,SpectralProfiles(id(i),:))
end
legend(num2str(d))

