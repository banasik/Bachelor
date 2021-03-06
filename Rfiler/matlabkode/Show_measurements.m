function handles = Show_Measurements(handles)
% De maalte signaler BI og EMG plottes

axes(handles.axes1); % Vises i axes1 
subplot(2,1,1)
plot(handles.TID, handles.BIsignal,'k'); % Det behandlet BI signal
hold on
plot(handles.TID(handles.locs_synk),handles.BIsignal(handles.locs_synk)','o','MarkerFaceColor','b');
title('Bioimpedance')
ylabel('Impedance (ohm)');
axis([1 12 -5 5])


subplot(2,1,2)
plot(handles.TID, handles.EMGsignal,'k'); % EMG signalet
title('EMG')
xlabel('Time in seconds')
ylabel('Voltage (V)');
axis([1 12 0.05 0.1])
end
