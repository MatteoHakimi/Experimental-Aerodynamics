clear; close all; clc;
load('..\dati\file_data.mat');

% No windowing

data4_no_zp = data4;
Y_10k = fft(data4_no_zp);
f_Y10k = linspace(0, 1000, length(Y_10k));

data4_20k_zp = [data4; zeros(10000, 1)];
Y_20k = fft(data4_20k_zp);
f_Y20k = linspace(0, 1000, length(Y_20k));

data4_40k_zp = [data4; zeros(30000, 1)];
Y_40k = fft(data4_40k_zp);
f_Y40k = linspace(0, 1000, length(Y_40k));

data4_80k_zp = [data4; zeros(70000, 1)];
Y_80k = fft(data4_80k_zp);
f_Y80k = linspace(0, 1000, length(Y_80k));

fig_nw = figure; hold on;
plot(f_Y10k, abs(Y_10k));
plot(f_Y20k, abs(Y_20k));
plot(f_Y40k, abs(Y_40k));
plot(f_Y80k, abs(Y_80k));
xlabel('f [Hz]'); xlim([0, 4]);
ylabel('|X(f)|');
legend('10k punti', '20k punti', '40k punti', '80k punti');
saveTightFigure(fig_nw, 'zeropadding_sin_no_win.pdf');

% Con windowing

data4_no_zp_win = data4 .* hamming(10000);
Y_10k = fft(data4_no_zp_win);
f_Y10k = linspace(0, 1000, length(Y_10k));

data4_20k_zp_win = [data4 .* hamming(10000); zeros(10000, 1)];
Y_20k = fft(data4_20k_zp_win);
f_Y20k = linspace(0, 1000, length(Y_20k));

data4_40k_zp_win = [data4 .* hamming(10000); zeros(30000, 1)];
Y_40k = fft(data4_40k_zp_win);
f_Y40k = linspace(0, 1000, length(Y_40k));

data4_80k_zp_win = [data4 .* hamming(10000); zeros(70000, 1)];
Y_80k = fft(data4_80k_zp_win);
f_Y80k = linspace(0, 1000, length(Y_80k));

fig_win = figure; hold on;
plot(f_Y10k, abs(Y_10k));
plot(f_Y20k, abs(Y_20k));
plot(f_Y40k, abs(Y_40k));
plot(f_Y80k, abs(Y_80k));
xlabel('f [Hz]'); xlim([1, 2]);
ylabel('|X(f)|');
legend('10k punti', '20k punti', '40k punti', '80k punti');
saveTightFigure(fig_win, 'zeropadding_sin_window.pdf');