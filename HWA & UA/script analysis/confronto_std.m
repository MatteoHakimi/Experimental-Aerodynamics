clear; close all;

fig1 = figure; hold on; grid on;
load('..\..\1 Hot Wire Anemometer\2 1D\1D.mat');
plot(u_std ./ u_mean * 100, y / 10, 'x');

load('..\..\4 Ultrasound Anemometer\3 Cilindro 1D\1D.mat');
plot(V_std ./ (V_mean * 0.912) * 100, y/10, 'x');

ylabel('y/D');
xlabel('I_{\sigma}');
legend('HWA', 'UA', 'location', 'northwest');
saveTightFigure(gcf, 'confronto_std_1D.pdf');

clear;

fig2 = figure; hold on; grid on;
load('..\..\1 Hot Wire Anemometer\3 3D\3D.mat');
plot(u_std ./ u_mean * 100, y / 10, 'x');

load('..\..\4 Ultrasound Anemometer\4 Cilindro 3D\3D.mat');
plot(V_std ./ (V_mean * 0.912) * 100, y/10, 'x');

ylabel('y/D');
xlabel('I_{\sigma}');
legend('HWA', 'UA', 'location', 'northwest');
saveTightFigure(gcf, 'confronto_std_3D.pdf');