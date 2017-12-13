function handles = Read_Measurements(handles)
% Her bliver maalingen oprettet og startet.
s = handles.GS; %Analog Discovery instillinger fra "Generate_SineWave" funktionen
aiBI = addAnalogInputChannel(s, 'AD1', 1, 'Voltage'); %Oprettelse af analog ind 1 og 2
aiEMG = addAnalogInputChannel(s, 'AD1', 2, 'Voltage');
s.Rate = 500000; % Samplingrate

% Henter den oenskede maaling i sek
sekunder = get(handles.popSec,'string');
selectedIndex = get(handles.popSec,'Value');
s.DurationInSeconds = str2double(sekunder{selectedIndex});

set(handles.txtMeasure,'Visible','On'); % Viser beskeden "Measurements running..."

[data, timestamps] = startForeground(s); % Maaling startes og genererer data og tid

set(handles.txtMeasure,'Visible','Off'); % fjerner beskeden "Measurements running..."

% data bliver delt op i BI, EMG og tid
handles.BI = data(:,1);
handles.EMG = data(:,2);
handles.timestamps = timestamps;

% Rydder op og lukker forbindelsen til Analog Discovery
s.release();
delete(s);
clear s;
end
