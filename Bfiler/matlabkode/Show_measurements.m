function handles = Show_Measurements(handles)
% De optaget signaler BI og EMG plottes

axes(handles.axes1); % Vises i axes1 
subplot(2,1,1)
plot(handles.timestamps, handles.BIsignal,'k'); % Det behandlet BI signal
title('Bioimpedance')
ylabel('Impedance (ohm)');

subplot(2,1,2)
plot(handles.timestamps, handles.data(:,2),'k'); % EMG signalet
title('EMG')
xlabel('Time in seconds')
ylabel('Voltage (V)');
end
