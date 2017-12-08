function handles = Save_Measurements(handles)
% Maalinger gemmes i csv-fil.
[FileName,PathName] = uiputfile('.csv'); % Oprettelse af prompt til brugeren, hvor filnavn og sti skal bestemmes

filepath=fullfile(PathName,FileName); % Sti og filnavn sammensaettes

% Message boksen "Saving measurements..." vises
f = figure('units','pixels','position',[300 300 300 80],'windowstyle','modal');
uicontrol('FontSize',12,'style','text','string','Saving measurements...','units','pixels','position',[40 30 200 20]);

pause(1); % Pauser i 1 sek for at message boksen kan naa at blive vist under gemmeprocessen starter

csvwrite(filepath,({handles.BIsignal,handles.data(:,2),handles.timestamps})); % Behandlet BI signal, EMG signal og tid samles i en csv-fil.

close(f); %Lukker message boksen igen efter csv-filen er gemt

h = msgbox('Measurements saved!'); % Der informeres om at csv-filen er gemt
end

