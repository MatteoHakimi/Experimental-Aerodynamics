clear; close all

figure(1); hold on; grid on
load('..\..\4 Ultrasound Anemometer\3 Cilindro 1D\1D_full_filt.mat');
x = 1 * ones(1, 21);
quiver(x, y/10, v_mean_filt * 0.912, (u_mean_filt + w_mean_filt) * 0.912 / 2);

load('..\..\4 Ultrasound Anemometer\4 Cilindro 3D\3D_full_filt.mat');
x = 3 * ones(1, 21);
quiver(x, y/10, v_mean_filt * 0.912, (u_mean_filt + w_mean_filt) * 0.912 / 2);

y_circ = linspace(0.5, -0.5, 100);
x_circ = sqrt(0.5 ^ 2- y_circ .^2) - 0.5;
plot(x_circ, y_circ, 'k');
xlabel('x/D');
ylabel('y/D');
axis equal
% title('Campo di velocità media ad uno e tre diametri');
saveTightFigure(gcf, 'ua_quiver.pdf');