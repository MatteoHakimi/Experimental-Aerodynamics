load '..\dati\file_data.mat'
data_file = data5;
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
saveTightFigure(fig_1, 'rumore_sin_andamento.pdf');

% Trasformata
fig_2 = figure; hold on;
[u, f] = easy_fft(data_file, freq_campionamento);
plot(f, abs(u));
xlim([min(f), max(f)]);
xlabel('f [Hz]');
ylabel('|X(f)|');
% title('Trasformata di Fourier del segnale');
saveTightFigure(fig_2, 'rumore_sin_fourier_lin.pdf');

fig_2_1 = figure; hold on;
plot(f, abs(u));
xlim([-5, 5]);
xlabel('f [Hz]');
ylabel('|X(f)|');
% title('Trasformata di Fourier del segnale, dettaglio su basse frequenze');
saveTightFigure(fig_2_1, 'rumore_sin_fourier_lin_zoom.pdf');

fig_2_2 = figure;
loglog(f, abs(u));
xlim([0, max(f)]);
xlabel('f [Hz]');
ylabel('|X(f)|');
saveTightFigure(fig_2_2, 'rumore_sin_fourier_log.pdf');

% Autocorrelazione
fig_3 = figure; hold on
[y, x] = z_autocorr(data_file);
x = x / 1000;
plot(x, y);
xlabel('\tau [s]');
ylabel('\rho_{x}(\tau)');
ylim([-1, 1]);
% title('Coefficiente di autocorrelazione del segnale');
saveTightFigure(fig_3, 'rumore_sin_autocorr.pdf');

% Filtro passa-basso unico
fig_5 = figure;
filtrato = low_pass(data_file, 15, freq_campionamento);
plot(time, filtrato, time, data4, '--');
xlabel('t [s]');
ylabel('x(t)');
legend('Segnale filtrato', 'Segnale ideale');
% title('Segnale filtrato con passa-basso a 10Hz');
saveTightFigure(fig_5, 'rumore_sin_filt_1.pdf');

% Filtro passa-basso e passa-alto
fig_5_1 = figure;
filtrato = low_pass(data_file, 5, freq_campionamento);
filtrato = high_pass(filtrato, 1, freq_campionamento);
plot(time, filtrato, time, data4, '--');
xlabel('t [s]');
ylabel('x(t)');
legend('Segnale filtrato', 'Segnale ideale');
% title('Segnale filtrato con passa-basso a 5 Hz e passa-alto a 1 Hz');
saveTightFigure(fig_5_1, 'rumore_sin_filt_2.pdf');