aiCh = addAnalogInputChannel(s, 'AD1', 1, 'Voltage');
aiCh = addAnalogInputChannel(s, 'AD1', 2, 'Voltage');
s.Rate =500000;
s.DurationInSeconds = 3;
[data, timestamps] = startForeground(s);
