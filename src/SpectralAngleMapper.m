%% Measure spectral similarity using spectral angle mapper

function [ang] = SpectralAngleMapper(v1,v2)
    den = sqrt(sum(v1.^2)) * sqrt(sum(v2.^2));
    num = dot(v1,v2);
    ang = acos(num/(den+eps));
    %ang = ang/pi;
end