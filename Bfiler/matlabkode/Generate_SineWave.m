function handles = Generate_SineWave(handles)
% For at faa Analog Discovery til at fungere med Matlab skal denne saettes op med
% foelgende indstillinger:
s = daq.createSession('digilent'); % Opretter forbindelse til Analog Discovery

fgenBI = addFunctionGeneratorChannel(s, 'AD1', 1, 'Sine'); % Opsaetning af funktionsgenerator og waveform

fgenBI.Gain = 2; % Amplitude paa 2V

fgenBI.Frequency = 20000; % Frekvens paa 20 kHz

handles.GS = s; % Giver mulighed for starte en maaling vha. handles.GS
end