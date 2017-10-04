load('..\..\4 Ultrasound Anemometer\2 Calibrazione angolo\angolo.mat');

x = linspace(0, 360, 2);

figure; hold on; grid on;
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
saveTightFigure(gcf, 'calib_angolo.pdf');