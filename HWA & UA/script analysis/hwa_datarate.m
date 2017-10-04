temp = load('..\..\1 Hot Wire Anemometer\1 Calibrazione\Dati TXT\01840.txt');
media = zeros(1, length(temp));

for i = 1 : length(temp)
	media(i) = mean(temp(1:i));
end

fig1 = figure; hold on, grid on;
plot(media, 'k');
plot([1, i], [media(end), media(end)], 'r');
xlabel('N_c numero di campioni');
ylabel('V_{media} [V]');
% title({'Valor medio delle misure al variare del numero di campioni', 'u = 18.4 m/s, N = 4000'});
saveTightFigure(fig1, 'datarate_calib.pdf');

temp = load('..\..\1 Hot Wire Anemometer\2 1D\Dati TXT\p025.txt');
media = zeros(1, length(temp));

for i = 1 : length(temp)
	media(i) = mean(temp(1:i));
end

fig2 = figure; hold on, grid on;
plot(media, 'k');
plot([1, i], [media(end), media(end)], 'r');
xlabel('N_c numero di campioni [\times 10^4]');
ax = gca; set(ax, 'XTickLabel', [0 : 0.2 : 2]);
ylabel('V_{media} [V]');
% title({'Valor medio delle misure al variare del numero di campioni', 'u = 10.0 m/s, N = 20000, x / D = 1, y / D = 0.25'});
saveTightFigure(fig2, 'datarate_scia.pdf');