load ..\dati\file_data.mat

time = linspace(0, 10, length(data4));

% Finestre
w_hamm = hamming(length(data4));
w_hann = hanning(length(data4));
w_flat = flattopwin(length(data4));
w_bart = bartlett(length(data4));

% Hamming e hanning sul sinusoidale
fig1 = figure; hold on; colors = get(gca, 'ColorOrder');
plot(time, data4 .* w_hamm, 'Color', colors(1, :));
plot(time, data4 .* w_hann, 'Color', colors(2, :));
xlabel('t [s]');
ylabel('x(t)');
legend('Hamming', 'Hanning');
saveTightFigure(fig1, 'window_hamm_hann_sin.pdf');

fig1_f = figure; hold on;
[u_sine, f] = easy_fft(data4, 1000);
u_hamm = easy_fft(data4 .* w_hamm, 1000);
u_hann = easy_fft(data4 .* w_hann, 1000);
plot(f, abs(u_sine), 'Color', colors(3, :));
plot(f, abs(u_hamm), 'Color', colors(1, :));
plot(f, abs(u_hann), 'Color', colors(2, :));
xlabel('f [Hz]'); xlim([-5, 5]);
ylabel('|X(f)|');
legend('Originale', 'Hamming', 'Hanning');
saveTightFigure(fig1_f, 'window_hamm_hann_sin_fourier.pdf');

% Flat Top e Bartlett sul sinusoidale
fig2 = figure; hold on;
plot(time, data4 .* w_flat, 'Color', colors(1, :));
plot(time, data4 .* w_bart, 'Color', colors(2, :));
xlabel('t [s]');
ylabel('x(t)');
legend('Flat-Top', 'Bartlett');
saveTightFigure(fig2, 'window_flat_bart_sin.pdf');

fig2_f = figure; hold on;
[u_sine, f] = easy_fft(data4, 1000);
u_hamm = easy_fft(data4 .* w_flat, 1000);
u_hann = easy_fft(data4 .* w_bart, 1000);
plot(f, abs(u_sine), 'Color', colors(3, :));
plot(f, abs(u_hamm), 'Color', colors(1, :));
plot(f, abs(u_hann), 'Color', colors(2, :));
xlabel('f [Hz]'); xlim([-5, 5]);
ylabel('|X(f)|');
legend('Originale', 'Flat-Top', 'Bartlett');
saveTightFigure(fig2_f, 'window_flat_bart_sin_fourier.pdf');

% Hamming e hanning sul sinusoidale con rumore
fig3 = figure; hold on;
plot(time, data5 .* w_hamm, 'Color', colors(1, :));
plot(time, data5 .* w_hann, 'Color', colors(2, :));
xlabel('t [s]');
ylabel('x(t)');
legend('Hamming', 'Hanning');
saveTightFigure(fig3, 'window_hamm_hann_sinnoise.pdf');

fig3_f = figure; hold on;
[u_sine, f] = easy_fft(data5, 1000);
u_hamm = easy_fft(data5 .* w_hamm, 1000);
u_hann = easy_fft(data5 .* w_hann, 1000);
plot(f, abs(u_sine), 'Color', colors(3, :));
plot(f, abs(u_hamm), 'Color', colors(1, :));
plot(f, abs(u_hann), 'Color', colors(2, :));
xlabel('f [Hz]'); xlim([-5, 5]);
ylabel('|X(f)|');
legend('Originale', 'Hamming', 'Hanning');
saveTightFigure(fig3_f, 'window_hamm_hann_sinnoise_fourier.pdf');

% Hanning e Flat Top sul fluidodinaamico
fig4 = figure; hold on;
plot(time, data1 .* w_hann, 'Color', colors(1, :));
plot(time, data1 .* w_flat, 'Color', colors(2, :));
xlabel('t [s]');
ylabel('x(t)');
legend('Hamming', 'Flat Top');
saveTightFigure(fig4, 'window_hamm_flat_fluid.pdf');

fig4_f = figure; hold on;
[u_fluid, f] = easy_fft(data5, 1000);
u_hamm = easy_fft(data1 .* w_hamm, 1000);
u_flat = easy_fft(data1 .* w_flat, 1000);
plot(f, abs(u_fluid), 'Color', colors(3, :));
plot(f, abs(u_hamm), 'Color', colors(1, :));
plot(f, abs(u_flat), 'Color', colors(2, :));
xlabel('f [Hz]'); xlim([-20, 20]);
ylabel('|X(f)|');
legend('Originale', 'Hamming', 'Flat Top');
saveTightFigure(fig4_f, 'window_hamm_flat_fluid_fourier.pdf');