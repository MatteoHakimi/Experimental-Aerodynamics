load '..\dati\file_data.mat'
data_file = data4;
freq_campionamento = 1000;
durata = 10;

time = linspace(0, durata, length(data_file));

% Andamento
fig_1 = figure; hold on;
set(fig_1, 'Position', [200 200 900	300]);
plot(time, data_file, 'LineWidth', 0.25);
xlabel('t [s]');
ylabel('x(t)');
% title('Andamento segnale nel tempo');
saveTightFigure(fig_1, 'sinusoidale_andamento.pdf');

% Trasformata
fig_2 = figure; hold on;
[u, f] = easy_fft(data_file, freq_campionamento);
plot(f, abs(u));
xlim([min(f), max(f)]);
xlabel('f [Hz]');
ylabel('|X(f)|');
% title('Trasformata di Fourier del segnale');
saveTightFigure(fig_2, 'sinusoidale_fourier_lin.pdf');

fig_2_1 = figure; hold on;
plot(f, abs(u));
xlim([-5, 5]);
xlabel('f [Hz]');
ylabel('|X(f)|');
% title('Trasformata di Fourier del segnale, dettaglio su basse frequenze');
saveTightFigure(fig_2_1, 'sinusoidale_fourier_lin_zoom.pdf');

% Densità spettrale di potenza
fig_4 = figure;
loglog(f, abs(u));
xlim([0, max(f)]);
xlabel('f [Hz]');
ylabel('|S(f)|');
% title('Densità spettrale di potenza del segnale');
saveTightFigure(fig_4, 'sinusoidale_fourier_log.pdf');

% % Densità di probabilità
% fig_2 = figure; hold on;
% [y, x] = ksdensity(data_file);
% gauss = normpdf(x, mean(data_file), std(data_file));
% plot(x, y, 'b', x, gauss, 'r--');
% xlabel('u');
% ylabel('p(u)');
% title('Densità di probabilità del segnale');
% legend('Segnale di rumore', 'Gaussiana di riferimento');
% saveTightFigure(fig_2, 'rumore_bianco_pdf.pdf');

% Autocorrelazione
fig_3 = figure; hold on;
[y, x] = z_autocorr(data_file);
x = x / 1000;
plot(x, y);
xlabel('\tau [s]');
ylabel('\rho_{x}(\tau)');
ylim([-1.5 1.5]);
% title('Coefficiente di autocorrelazione del segnale');
saveTightFigure(fig_3, 'sinusoidale_autocorr.pdf');

