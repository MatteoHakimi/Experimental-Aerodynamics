load '..\dati\file_data.mat'
data_file = data1;
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
saveTightFigure(fig_1, 'fluidodin_andamento.pdf');

% Trasformata
fig_2 = figure; hold on;
[u, f] = easy_fft(data_file, freq_campionamento);
plot(f, abs(u));
xlim([min(f), max(f)]);
xlabel('f [Hz]');
ylabel('|X(f)|');
% title('Trasformata di Fourier del segnale');
saveTightFigure(fig_2, 'fluidodin_fourier_lin.pdf');

fig_2_1 = figure; hold on;
plot(f, abs(u));
xlim([-30, 30]);
xlabel('f [Hz]');
ylabel('|X(f)|');
% title('Trasformata di Fourier del segnale, dettaglio su basse frequenze');
saveTightFigure(fig_2_1, 'fluidodin_fourier_lin_zoom.pdf');

fig_2_2 = figure;
loglog(f, abs(u));
xlim([0, max(f)]);
xlabel('f [Hz]');
ylabel('|X(f)|');
saveTightFigure(fig_2_2, 'fluidodin_fourier_log.pdf');

% Autocorrelazione
fig_3 = figure; hold on;
[y, x] = z_autocorr(data_file);
x = x / 1000;
plot(x, y);
xlabel('\tau [s]');
ylabel('\rho_{x}(\tau)');
% title('Coefficiente di autocorrelazione del segnale');
saveTightFigure(fig_3, 'fluidodin_autocorr.pdf');

% Autocorrelazione scala di Taylor
fig_3_1 = figure; hold on;
y_taylor = y(1:100);
x_taylor = x(1:100);
x_sq = x_taylor .^ 2;
p = polyfit(x_sq(1:10), y_taylor(1:10), 1);
retta = x_sq * p(1) + p(2);
plot(x_sq, y_taylor, '.-');
plot(x_sq, retta);
xlabel('\tau^2 [s^2]');
ylabel('\rho_{x}(\tau)');
ylim([0 1]);
legend('Autocorrelazione', 'Retta tangente in \tau = 0');
saveTightFigure(fig_3_1, 'fluidodin_autocorr_taylor.pdf');

% Autocorrelazione scala di Taylor - zoom
fig_3_2 = figure; hold on;
y_taylor = y(1:50);
x_taylor = x(1:50);
x_sq = x_taylor .^ 2;
p = polyfit(x_sq(1:10), y_taylor(1:10), 1);
retta = x_sq * p(1) + p(2);
plot(x_sq, y_taylor, '.-');
plot(x_sq, retta);
xlabel('\tau^2 [s^2]');
ylabel('\rho_{x}(\tau)');
ylim([0 1]);
legend('Autocorrelazione', 'Retta tangente in \tau = 0');
saveTightFigure(fig_3_2, 'fluidodin_autocorr_taylor_zoom.pdf');