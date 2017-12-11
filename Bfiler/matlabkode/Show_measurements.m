function handles = Show_Measurements(handles)
% De optaget signaler BI og EMG plottes

axes(handles.axes1); % Vises i axes1 
subplot(2,1,1)
plot(handles.timestamps, handles.BIsignal,'k'); % Det behandlet BI signal
title('Bioimpedance')
ylabel('Impedance (ohm)');
axis([2 12 13.24 13.35])
axis('auto y')

subplot(2,1,2)
plot(handles.timestamps, handles.data(:,2),'k'); % EMG signalet
title('EMG')
xlabel('Time in seconds')
ylabel('Voltage (V)');
axis([2 12 3 3.5])
axis('auto y')
end
