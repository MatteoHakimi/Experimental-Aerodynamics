clear; close all

fig = figure; hold on; grid on;

load('..\..\4 Ultrasound Anemometer\3 Cilindro 1D\1D.mat');
x = 1 * ones(1, 21);
quiv1 = quiver(x, y/10, V_std ./ V_mean * 100, x - x, 'maxheadsize', 0, 'linewidth', 1);

load('..\..\4 Ultrasound Anemometer\4 Cilindro 3D\3D.mat');
x = 3 * ones(1, 21);
quiv2 = quiver(x, y/10, V_std ./ V_mean * 100, x - x, 'maxheadsize', 0, 'linewidth', 1);

y_circ = linspace(0.5, -0.5, 100);
x_circ = sqrt(0.5 ^ 2- y_circ .^2) - 0.5;
plot(x_circ, y_circ, 'k');
xlabel('x/D');
ylabel('y/D');
axis equal
% title('Campo di velocità media ad uno e tre diametri');
saveTightFigure(gcf, 'ua_iturbe.pdf');