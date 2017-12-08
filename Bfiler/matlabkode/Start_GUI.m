function handles = Start_GUI(handles)
%handles.output = hObject;

set(handles.txtDate, 'String', (datestr(datestr(now))));

axes(handles.axes3)
myImage = imread('SynkBillede.PNG');
image(myImage);
axis off
axis image

set(handles.Btn_Save_Measurments,'Visible','Off');

% handles.myImage = axes3;
% imshow(myImage);
% Update handles structure
%guidata(hObject, handles);
end