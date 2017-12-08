function handles = Show_Measurements(handles)
%period = 1/fgenCh.Frequency;
axes(handles.axes1);
subplot(2,1,1)
plot(handles.timestamps, handles.BIsignal,'k');
title('Bioimpedance')
ylabel('Impedance (ohm)');

subplot(2,1,2)
plot(handles.timestamps, handles.data(:,2),'k');
title('EMG')
xlabel('Time in seconds')
ylabel('Voltage (V)');


%axis([0 s.DurationInSeconds -5 15])
end
