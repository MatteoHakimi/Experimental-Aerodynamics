clear; clc
load('..\..\1 Hot Wire Anemometer\2 1D\1D.mat');

fig1 = figure; hold on; grid on;
herrorbar(u_mean / 10, y / 10, u_std / 10, 'x');
xlabel('V / u_{\infty}'); xlim([0, 1.2]);
ylabel('y / D');
saveTightFigure(fig1, 'hwa_campo_medio_1D.pdf');

fig2 = figure; hold on; grid on;
plot(u_std ./ u_mean * 100, y / 10, 'x');
xlabel('I_{\sigma} [%]');
ylabel('y / D');
saveTightFigure(fig2, 'hwa_indice_turbolenza_1D.pdf');

fig3 = figure; hold on; grid on;
plot(u_skew, y / 10, 'x');
xlabel('s');
ylabel('y / D');
saveTightFigure(fig3, 'hwa_skewness_1D.pdf');

fig4 = figure; hold on; grid on;
plot(u_kurt, y / 10, 'x');
xlabel('k');
ylabel('y / D');
saveTightFigure(fig4, 'hwa_kurtosis_1D.pdf');