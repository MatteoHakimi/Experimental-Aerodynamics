clear; clc;
load('..\..\1 Hot Wire Anemometer\4 Mezzeria\mezzeria.mat');

fig1 = figure; hold on; grid on;
plot(x / 10, u_mean / 10, 'kx');
ylabel('V / u_{\infty}');
xlabel('x / D');
ylim([-0.3, 0.7]);
saveTightFigure(fig1, 'hwa_campo_medio_mediana.pdf');

fig2 = figure; hold on; grid on;
plot(x / 10, u_std ./ u_mean, 'kx');
ylabel('I_{\sigma} [%]');
xlabel('x / D');
saveTightFigure(fig2, 'hwa_indice_turbolenza_mediana.pdf');

fig3 = figure; hold on; grid on;
plot(x / 10, u_skew, 'kx');
ylabel('s');
xlabel('x / D');
saveTightFigure(fig3, 'hwa_skewness_mediana.pdf');

fig4 = figure; hold on; grid on;
plot(x / 10, u_kurt, 'kx');
ylabel('k');
xlabel('x / D');
saveTightFigure(fig4, 'hwa_kurtosis_mediana.pdf');

fig5 = figure; hold on; grid on;
plot(x / 10, trasf_en, 'kx');
ylabel('coso');
xlabel('x / D');
saveTightFigure(fig5, 'hwa_trasf_mediana.pdf');