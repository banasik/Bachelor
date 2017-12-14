function handles = Load_Measurements(handles)
% Maalinger hentes fra csv-fil.
[filename, pathname,] = uigetfile('*.csv', 'Pick a Measurement'); %Brugeren vaelger fil

set(handles.txtLoad,'Visible','On'); % Viser beskeden "Loading measurements..."
pause(1);
filepath=fullfile(pathname,filename);

loadData = csvread(filepath);
% Maaling udpakkes og kan bruges til visning i grafen
handles.BI = loadData(:,1);
handles.EMG = loadData(:,2);
handles.timestamps = loadData(:,3);
end