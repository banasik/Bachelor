function handles = Save_Measurements(handles)
[FileName,PathName] = uiputfile('.csv');



filepath=fullfile(PathName,FileName);


f = figure('units','pixels','position',[300 300 300 80],'windowstyle','modal');
uicontrol('FontSize',12,'style','text','string','Saving measurements...','units','pixels','position',[40 30 200 20]);

pause(1); 

csvwrite(filepath,({handles.BIsignal,handles.data(:,2),handles.timestamps}));
close(f);
h = msgbox('Measurements saved!');
% handles.FileName = FileName;
% handles.PathName = PathName;
end

