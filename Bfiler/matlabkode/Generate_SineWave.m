function handles = Generate_SineWave(handles)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
s = daq.createSession('digilent'); % Opretter forbindelse til Analog Discovery

fgenBI = addFunctionGeneratorChannel(s, 'AD1', 1, 'Sine'); % Opsaetning af kanal og waveform

fgenBI.Gain = 2; % Amplitude paa 2V

fgenBI.Frequency = 20000; % Frekvens paa 20 kHz

handles.GS = s;


end