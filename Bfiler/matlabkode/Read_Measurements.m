function handles = Read_Measurements(handles)
% Her bliver maalingen oprettet og startet.
s = handles.GS; %Analog Discovery instillinger fra "Generate_SineWave" funktionen
aiBI = addAnalogInputChannel(s, 'AD1', 1, 'Voltage'); %Oprettelse af analog ind 1 og 2
aiEMG = addAnalogInputChannel(s, 'AD1', 2, 'Voltage');
s.Rate = 30000; % Samplingrate
s.DurationInSeconds = 3; % Tid pr. maaling 

% Visning af message boksen "Measurements running..."
h = figure('units','pixels','position',[300 300 300 80],'windowstyle','modal');
uicontrol('FontSize',12,'style','text','string','Measurements running...','units','pixels','position',[40 30 200 20]);

[data, timestamps] = startForeground(s); % Maaling startes og genererer data og tid
close(h); % Lukker message boksen "Measurements running..."

% Maalingerne gemmes i handles til videre brug
handles.data = data;
handles.timestamps = timestamps;

% Rydder op og slukker forbindelsen til Analog Discovery
s.release();
delete(s);
clear s;
end
