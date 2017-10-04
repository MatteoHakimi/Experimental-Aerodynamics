clear; clc
load('..\..\1 Hot Wire Anemometer\3 3D\3D.mat');

matlab_red = [0.8500, 0.3250, 0.0980];

fig1 = figure; hold on; grid on;
herrorbar(u_mean / 10, y / 10, u_std / 10, 'x');
xlabel('V / u_{\infty}'); xlim([0, 1.1]);
ylabel('y / D');
saveTightFigure(fig1, 'hwa_campo_medio_3D.pdf');

fig2 = figure; hold on; grid on;
plot(u_std ./ u_mean * 100, y / 10, 'x', 'Color', matlab_red);
xlabel('I_{\sigma} [%]');
ylabel('y / D');
saveTightFigure(fig2, 'hwa_indice_turbolenza_3D.pdf');

fig3 = figure; hold on; grid on;
plot(u_skew, y / 10, 'x', 'Color', matlab_red);
xlabel('s');
ylabel('y / D');
saveTightFigure(fig3, 'hwa_skewness_3D.pdf');

fig4 = figure; hold on; grid on;
plot(u_kurt, y / 10, 'x', 'Color', matlab_red);
xlabel('k');
ylabel('y / D');
saveTightFigure(fig4, 'hwa_kurtosis_3D.pdf');