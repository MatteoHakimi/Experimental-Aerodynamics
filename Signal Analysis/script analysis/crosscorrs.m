load('..\dati\file_data.mat');

% data1: fluidodin
% data2: pure noise
% data3: fluid+noise
% data4: sinusoidal
% data5: sin+noise

freq_campionamento = 1000;
durata = 10;

time = linspace(0, durata, freq_campionamento * durata);

% sin + sin&noise
fig_1 = figure; hold on;
y = z_xcorr(data4, data5);
plot(time, y);
xlabel('\tau [s]');
ylabel('\rho_{x, y}(\tau)');
ylim([-1, 1]);
saveTightFigure(fig_1, 'xcorr_sin_noisesin.pdf');

% sin + noise
fig_2 = figure; hold on;
y = z_xcorr(data4, data2);
plot(time, y);
xlabel('\tau [s]');
ylabel('\rho_{x, y}(\tau)');
ylim([-1, 1]);
saveTightFigure(fig_2, 'xcorr_sin_noise.pdf');

% sin + fluid
fig_3 = figure; hold on;
y = z_xcorr(data4, data1);
plot(time, y);
xlabel('\tau [s]');
ylabel('\rho_{x, y}(\tau)');
ylim([-1, 1]);
saveTightFigure(fig_3, 'xcorr_sin_fluid.pdf');

% FFT sin + fluid
fig_3_1 = figure; hold on;
y(end) = y(end - 1) + (y(end - 1) - y(end - 2)) / 2;
[f, Y] = easy_fft(y, 1000);
plot(f, abs(Y));
xlim([-25, 25]);
xlabel('f [Hz]');
ylabel('|P_{x, y}(f)|');
saveTightFigure(fig_3_1, 'xcorr_sin_fluid_fourier.pdf');

% Sin + fluid&noise
fig_4 = figure; hold on;
y = z_xcorr(data4, data3);
plot(time, y);
xlabel('\tau [s]');
ylabel('\rho_{x, y}(\tau)');
ylim([-1, 1]);
saveTightFigure(fig_4, 'xcorr_sin_noisefluid.pdf');

% FFT sin + fluid
fig_4_1 = figure; hold on;
y(end) = y(end - 1) + (y(end - 1) - y(end - 2)) / 2;
[f, Y] = easy_fft(y, 1000);
plot(f, abs(Y));
xlim([-50, 50]);
xlabel('f [Hz]');
ylabel('|P_{x, y}(f)|');
saveTightFigure(fig_4_1, 'xcorr_sin_noisefluid_fourier.pdf');

% fluid + fluid&noise
fig_5 = figure; hold on;
y = z_xcorr(data1, data3);
plot(time, y);
xlabel('\tau [s]');
ylabel('\rho_{x, y}(\tau)');
ylim([-1, 1]);
saveTightFigure(fig_5, 'xcorr_fluid_noisefluid.pdf');

% fluid + sin&noise
fig_6 = figure; hold on;
y = z_xcorr(data1, data5);
plot(time, y);
xlabel('\tau [s]');
ylabel('\rho_{x, y}(\tau)');
ylim([-1, 1]);
saveTightFigure(fig_6, 'xcorr_fluid_noisesin.pdf');

% fluid + noise
fig_7 = figure; hold on;
y = z_xcorr(data1, data2);
plot(time, y);
xlabel('\tau [s]');
ylabel('\rho_{x, y}(\tau)');
ylim([-1, 1]);
saveTightFigure(fig_7, 'xcorr_fluid_noise.pdf');

% fluid&noise + noise
fig_8 = figure; hold on;
y = z_xcorr(data3, data2);
plot(time, y);
xlabel('\tau [s]');
ylabel('\rho_{x, y}(\tau)');
ylim([-1, 1]);
saveTightFigure(fig_8, 'xcorr_noisefluid_noise.pdf');

% fluid&noise + sin&noise
fig_9 = figure; hold on;
y = z_xcorr(data5, data3);
plot(time, y);
xlabel('\tau [s]');
ylabel('\rho_{x, y}(\tau)');
ylim([-1, 1]);
saveTightFigure(fig_9, 'xcorr_fluidnoise_sinnoise.pdf');

% sin&noise + noise
fig_10 = figure; hold on;
y = z_xcorr(data5, data2);
plot(time, y);
xlabel('\tau [s]');
ylabel('\rho_{x, y}(\tau)');
ylim([-1, 1]);
saveTightFigure(fig_10, 'xcorr_sinnoise_noise.pdf');