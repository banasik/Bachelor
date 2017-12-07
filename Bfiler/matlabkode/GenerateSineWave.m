
s = daq.createSession('digilent');
fgenCh = addFunctionGeneratorChannel(s, 'AD1', 1, 'Sine');
gain =2;
fgenCh.Gain = gain;
fgenCh.Frequency = 2000;


