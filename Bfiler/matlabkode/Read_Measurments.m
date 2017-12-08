function handles = Read_Measurments(handles)
s = handles.GS;
aiBI = addAnalogInputChannel(s, 'AD1', 1, 'Voltage');
aiEMG = addAnalogInputChannel(s, 'AD1', 2, 'Voltage');
s.Rate = 500000;
s.DurationInSeconds = 3;

h = figure('units','pixels','position',[300 300 300 80],'windowstyle','modal');
uicontrol('FontSize',12,'style','text','string','Measurements running...','units','pixels','position',[40 30 200 20]);

[data, timestamps] = startForeground(s);
close(h);


handles.data = data;
handles.timestamps = timestamps;

%% Clean up and release hardware
s.release();
delete(s);
clear s;

end
