function handles = Start_GUI(handles)
%% Denne funktion har til opgave at saette tilfoeje objekter til GUI op naar programmet startes. 
set(handles.txtDate, 'String', (datestr(datestr(now)))); %Dato og tid vises

axes(handles.axes3) %Visning af billede i GUI
myImage = imread('SynkBillede.PNG');
image(myImage);
axis off
axis image

set(handles.Btn_Save_Measurements,'Visible','Off'); %Save Measurements knappen er ikke synlig
end