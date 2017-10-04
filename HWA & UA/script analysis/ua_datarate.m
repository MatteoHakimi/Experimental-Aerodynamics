clear all; close all;

temp = load('..\..\4 Ultrasound Anemometer\1 Calibrazione velocità\10.3.txt');

for i = 1 : size(temp, 1)
	v_mod(i) = 0.912 * norm(temp(i, 1 : 3));
end

for i = 1 : length(v_mod)
	v_mean(i) = mean(v_mod(1 : i));
end

fig1 = figure; hold on; grid on;
plot(v_mean, 'k');
plot([1, 1000], [v_mean(end), v_mean(end)], 'r');
xlabel('N_c numero di campioni');
ylabel('V_{media} [m/s]');
title ({'Andamento del valor medio a diversi numeri di campioni', 'u_{\infty} = 10.4, galleria libera'});
saveTightFigure(fig1, 'datarate_calib.pdf');

temp = load('..\..\4 Ultrasound Anemometer\3 Cilindro 1D\Dati TXT\p04.txt');

for i = 1 : size(temp, 1)
	v_mod(i) = 0.912 * norm(temp(i, 1 : 3));
end

for i = 1 : length(v_mod)
	v_mean(i) = mean(v_mod(1 : i));
end

fig2 = figure; hold on; grid on;
plot(v_mean, 'k');
plot([1, 100 * ceil(length(v_mean) / 100)], [v_mean(end), v_mean(end)], 'r');
xlabel('N_c numero di campioni');
ylabel('V_{media} [m/s]');
title ({'Andamento del valor medio a diversi numeri di campioni', 'u_{\infty} = 10.4, cilindro in galleria, x/D = 1, y/D = 0.4'});
saveTightFigure(fig2, 'datarate_scia.pdf');
