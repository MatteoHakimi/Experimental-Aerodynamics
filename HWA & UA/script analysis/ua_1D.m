clear; close all
load('..\..\4 Ultrasound Anemometer\3 Cilindro 1D\1D.mat');
load('..\..\4 Ultrasound Anemometer\3 Cilindro 1D\1D_filt.mat');

matlab_red = [0.8500, 0.3250, 0.0980];
matlab_blu = [0.0000, 0.4470, 0.7410];

fig1 = figure; hold on; grid on;
plot(V_mean_filt * 0.912 / 10, y/10, 'x');
plot(v_mean_filt * 0.912 / 10, y/10, 'x');
% title({'Campo medio di velocità in \ity\rm\bf', 'u_{\infty} = 10 m/s, x/D = 1'});
ylabel('y/D');
legend('V / u_{\infty}', 'u / u_{\infty}', 'Location', 'southeast');
saveTightFigure(fig1, 'ua_campo_medio_1D.pdf');

% fig1_1 = figure; hold on; grid on;
% plot(v_mean_filt * 0.192 / 10, y/10, 'bx');
% title({'Componente di velocità parallela ad \itx\rm\bf in \ity\rm\bf', 'u_{\infty} = 10 m/s, x/D = 1'});
% xlabel('u / u_{\infty}');
% ylabel('y/D');
% saveTightFigure(fig1_1, 'ua_vel_u_1D.pdf');

fig2 = figure; hold on; grid on;
plot(V_std ./ (V_mean * 0.912) * 100, y/10, 'bx');
% title({'Indice di turbolenza in \ity\rm\bf', 'u_{\infty} = 10 m/s, x/D = 1'});
xlabel('I_{\sigma} [%]');
ylabel('y/D');
saveTightFigure(fig2, 'ua_indice_turbolenza_1D.pdf');

fig3 = figure; hold on; grid on;
plot(V_skew, y/10, 'bx');
% title({'Skewness in \ity\rm\bf', 'u_{\infty} = 10 m/s, x/D = 1'});
xlabel('s');
ylabel('y/D');
saveTightFigure(fig3, 'ua_skewness_1D.pdf');

fig4 = figure; hold on; grid on;
plot(V_kurt, y/10, 'bx');
% title({'Flatness in \ity\rm\bf', 'u_{\infty} = 10 m/s, x/D = 1'});
xlabel('k');
ylabel('y/D');
saveTightFigure(fig4, 'ua_flatness_1D.pdf');