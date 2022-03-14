% Created by: Ph.D Nelson Eduardo Diaz Diaz
% Post-doctorado Pontícia Universidad Católica de Valparaíso (PUCV)
% Date 2 February 2022

close all
fontsize = 16;
x = [2:11 16 25].^2;
x = [x 1372 2048 4000 6912 10976 14896 21438 29660 39754 51912 66326 83188 108000 131072 1024192 4100625];
N =[2:11 16 25 36 49 64 81 100 121 144 169 196 225 256 289 324 361 400 441 484 529 576 625 676 729 784 841 900 961 1024 1296 2025]; % Sensor Size
nt = length(N);
rt = [0.2928 0.2320 0.1887 0.1678  0.1493 0.1364 0.1267 0.1170 0.1113 0.1047 0.084 0.0619 0.0490 0.0443 0.0346 0.0289 0.0248 0.0225 0.0199 0.0179 0.0162 0.0149 0.0137 0.0127 0.0117 0.0109 0.0055];
dent =[0.4209 0.4710 0.4510 0.4948 0.5026 0.5211 0.5458 0.5447 0.5788 0.5832 0.6364 0.6224 0.6784 0.6858 0.6963 0.7034 0.7085 0.7115 0.7148 0.7173 0.7194 0.7212 0.7227 0.7240 0.7253 0.7262 0.7332];
r = [1.4142 1.4142 1.4142 1.4142 1.7321 1.7321 2 2.2361 2.2361 2.2361 2.4495 3 3.3166 3.7417 4.2426 4.5826 5.0 5.3852 5.4772 5.8310 6.1644 6.4807 6.9282 7.0711 7.3485 7.6811 8.0623 8.1240 8.6023 8.6603 9.1104 9.4323 9.5394 9.8995 10.0499 10.0499 10.4881 10.7328 11.0454 11.9164 13.7477]./(2);
%r = [1.4142 1.4142 1.4142 1.4142 1.4142 1.7321 1.4142 2.2361 1.4142 2.2361 2.4495 3 2.8284 3.7417 3.7417 4.2426 4.6904 5.3852 5.4772 5.8310 6.1644 6.4031 6.4807 7.0711 7.3485 7.6811 7.8740 8.0623 8.3666 8.6603 8.6023 8.8995 11.0454 13.7477]./(2);
cube = (N+1).^3;%(N.^2).*4.*r.*(sqrt(2)+r);
%d = [2.23 2.44 3.0 3.31 3.74 4.24 4.58 5 5.38 5.47]./(2*(N+1));
%rt =[0.117097 0.084037 0.061]
%% Orange line -> theoretical
nb =N.^2;
dis = 2*(((N+1).^3)./(4*nb*sqrt(2))).^(1/3);
dis = dis./2;
sphere = (N.^2).*(4/3).*pi.*(dis.^3);
density = (sphere./cube);
loglog(nb(1:nt),density(1:nt),'-b','MarkerFaceColor','b','MarkerSize',18,'LineWidth',3)
hold on

sphere = (N.^2).*(4/3).*pi.*(r.^3);
density = (sphere./cube);

loglog(nb(1:nt),density(1:nt),'-g','MarkerFaceColor','g','MarkerSize',18,'LineWidth',3)
grid on
set(gca,'FontSize',fontsize)
nf = length(dent);
loglog(x(1:nf),dent(1:nf),'-r','MarkerFaceColor','r','MarkerSize',18,'LineWidth',3)
axis([10 10^6 0 0.77])
title('Density of Spheres in a (N_x+1)^3 Cube ', 'FontSize', fontsize)
xlabel('Number of Spheres ', 'FontSize', fontsize)
ylabel('Density ', 'FontSize', fontsize)
legend('Upper bound (theoretical)','Optimized (Discrete)','Best sphere packing (Continuous)','LineWidth',2,'location','southeast','FontSize', 16)
%saveas(gcf,'figure4','epsc')
set(gcf, 'PaperPosition', [0 0 9 7]); %Position plot at left hand corner with width 5 and height 5.
set(gcf, 'PaperSize', [9 7]); %Set the paper to have width 5 and height 5.
pbaspect([1 1 1])
saveas(gcf,'figure4','pdf')
