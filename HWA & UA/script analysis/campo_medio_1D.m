clear; clc
load('..\..\1 Hot Wire Anemometer\2 1D\1D.mat');

fig1 = figure; hold on; grid on;
plot(u_mean / 10, y / 10, '*');
xlabel('U/U_{\infty}'); xlim([0, 1.2]);
ylabel('y/D');

load('..\..\4 Ultrasound Anemometer\3 Cilindro 1D\1D_filt.mat');
plot(V_mean_filt * 0.912 / 10, y/10, 'x');
legend('HWA', 'UA', 'location', 'northwest');

saveTightFigure(fig1, 'campo_medio_1D.pdf');