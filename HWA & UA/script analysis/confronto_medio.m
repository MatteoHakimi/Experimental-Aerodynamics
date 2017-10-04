clear; close all;

fig1 = figure; hold on; grid on;
load('..\..\1 Hot Wire Anemometer\2 1D\1D.mat');
plot(u_mean / 10, y / 10, 'x');

load('..\..\4 Ultrasound Anemometer\3 Cilindro 1D\1D_filt.mat');
plot(V_mean_filt * 0.912 / 10, y/10, 'x');
% title({'Campo medio di velocità in \ity\rm\bf', 'u_{\infty} = 10 m/s, x/D = 1'});
ylabel('y/D');
xlabel('u/U_0');
legend('HWA', 'UA', 'location', 'northwest');
saveTightFigure(gcf, 'campo_medio_1D.pdf');

clear;

fig2 = figure; hold on; grid on;
load('..\..\1 Hot Wire Anemometer\3 3D\3D.mat');
plot(u_mean / 10, y / 10, 'x');

load('..\..\4 Ultrasound Anemometer\4 Cilindro 3D\3D_filt.mat');
plot(V_mean_filt * 0.912 / 10, y/10, 'x');
% title({'Campo medio di velocità in \ity\rm\bf', 'u_{\infty} = 10 m/s, x/D = 1'});
ylabel('y/D');
xlabel('u/U_0');
legend('HWA', 'UA', 'location', 'northwest');
saveTightFigure(gcf, 'campo_medio_3D.pdf');