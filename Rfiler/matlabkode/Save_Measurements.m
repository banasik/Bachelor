function handles = Save_Measurements(handles)
% Maalinger gemmes i csv-fil.
[FileName,PathName] = uiputfile('.csv'); % Oprettelse af prompt til brugeren, hvor filnavn og sti skal bestemmes

filepath=fullfile(PathName,FileName); % Sti og filnavn sammensaettes

set(handles.txtSave,'Visible','On'); % Viser beskeden "Saving measurements..."
pause(2);
csvwrite(filepath,({handles.BI,handles.EMG,handles.timestamps})); % Behandlet BI signal, EMG signal og tid samles i en csv-fil.

set(handles.txtSave,'Visible','Off'); % fjerner beskeden "Saving measurements..."
h = msgbox('Measurements saved!'); % Der informeres om at csv-filen er gemt
end

