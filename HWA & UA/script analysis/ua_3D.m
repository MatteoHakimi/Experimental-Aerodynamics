clear; close all;
load('..\..\4 Ultrasound Anemometer\4 Cilindro 3D\3D.mat');
load('..\..\4 Ultrasound Anemometer\4 Cilindro 3D\3D_filt.mat');

matlab_red = [0.8500, 0.3250, 0.0980];

fig1 = figure; hold on; grid on;
plot(V_mean_filt * 0.912 / 10, y/10, 'x');
plot(v_mean_filt * 0.912 / 10, y/10, 'x');
% title({'Campo medio di velocità in \ity\rm\bf', 'u_{\infty} = 10 m/s, x/D = 1'});
ylabel('y/D');
legend('V / u_{\infty}', 'u / u_{\infty}', 'Location', 'southeast');
saveTightFigure(fig1, 'ua_campo_medio_3D.pdf');

fig2 = figure; hold on; grid on;
plot_fig2 = plot(V_std ./ (V_mean * 0.912) * 100, y / 10, 'x', 'Color', matlab_red);
% title({'Indice di turbolenza in \ity\rm\bf', 'u_{\infty} = 10 m/s, x/D = 3'});
xlabel('I_{\sigma} [%]');
ylabel('y/D');
saveTightFigure(fig2, 'ua_indice_turbolenza_3D.pdf');

fig3 = figure; hold on; grid on;
plot(V_skew, y/10, 'x', 'Color', matlab_red);
% title({'Skewness in \ity\rm\bf', 'u_{\infty} = 10 m/s, x/D = 3'});
xlabel('s');
ylabel('y/D');
saveTightFigure(fig3, 'ua_skewness_3D.pdf');

fig4 = figure; hold on; grid on;
plot(V_kurt, y/10, 'x', 'Color', matlab_red);
% title({'Flatness in \ity\rm\bf', 'u_{\infty} = 10 m/s, x/D = 3'});
xlabel('k');
ylabel('y/D');
saveTightFigure(fig4, 'ua_flatness_3D.pdf');