period = 1/fgenCh.Frequency;
plot(timestamps, data);
xlabel('Time in seconds'); ylabel('Impedance in ohm');
title('Impedance measurment')
axis([0 5*period -gain gain])
