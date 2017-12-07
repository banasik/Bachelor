function handles = Read_Measurments(handles)
s = handles.GS;
aiBI = addAnalogInputChannel(s, 'AD1', 1, 'Voltage');
aiEMG = addAnalogInputChannel(s, 'AD1', 2, 'Voltage');
s.Rate = 500000;
s.DurationInSeconds = 3;
[data, timestamps] = startForeground(s);

handles.data = data;
handles.timestamps = timestamps;

end
