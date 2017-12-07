handles.output = hObject;

set(handles.edit1,'String',datestr(datestr(now)));
myImage = imread('SynkBillede.PNG');
axes(handles.axes3);
imshow(myImage);




% Update handles structure
guidata(hObject, handles);