function handles = Load_Measurements(handles)

[filename, pathname,] = uigetfile('*.csv', 'Pick a Measurement');
set(handles.txtLoad,'Visible','On');
pause(1);
filepath=fullfile(pathname,filename);

loadData = csvread(filepath);
handles.BI = loadData(:,1);
handles.EMG = loadData(:,2);
handles.timestamps = loadData(:,3);
end