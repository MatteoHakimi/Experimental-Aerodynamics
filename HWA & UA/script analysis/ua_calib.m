% Calibrazine velocità

load('..\..\4 Ultrasound Anemometer\1 Calibrazione velocità\calib_vel.mat');

i_max = 22;
coeffs = polyfit(vel_misurate(1:i_max), vel_vere(1:i_max), 1);

fig_vel = figure; hold on; grid on;
x = linspace(0, 35, 1000);
y = coeffs(1) * x + coeffs(2);
plot(vel_misurate, vel_vere, 'bx');
hold on;
plot(x, y, 'r');

ylim([0, 35]);
xlabel('Velocità misurata [m/s]');
ylabel('Velocità vera [m/s]');
title('Calibrazione anemometro ad ultrasuoni');
legend('Dati misurati', 'Interpolazione', 'Location', 'southeast');
saveTightFigure(fig_vel, 'ua_calib_vel.pdf');


% Calibrazione angolo
load('..\..\4 Ultrasound Anemometer\2 Calibrazione angolo\angolo.mat');

x = linspace(0, 360, 2);

fig_ang = figure; hold on; grid on;
plot(theta_misurato, theta_vero, 'bx');
plot(x, x, 'r');
legend('Dati sperimentali', 'Interpolazione lineare', 'Location', 'Southeast');
title('Calibrazione anemometro ad ultrasuoni, angolo misurato');
xlabel('\theta_{misurato} [°]');
ylabel('\theta_{vero} [°]');
xlim([0 360]);
ylim([0 360]);
ax = gca;
ax.XTick = [0 : 60 : 360];
ax.YTick = [0 : 60 : 360];
saveTightFigure(fig_ang, 'ua_calib_ang.pdf');