function varargout = Synkerefleksmonitor(varargin)
% SYNKEREFLEKSMONITOR MATLAB code for Synkerefleksmonitor.fig
%      SYNKEREFLEKSMONITOR, by itself, creates a new SYNKEREFLEKSMONITOR or raises the existing
%      singleton*.
%
%      H = SYNKEREFLEKSMONITOR returns the handle to a new SYNKEREFLEKSMONITOR or the handle to
%      the existing singleton*.
%
%      SYNKEREFLEKSMONITOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SYNKEREFLEKSMONITOR.M with the given input arguments.
%
%      SYNKEREFLEKSMONITOR('Property','Value',...) creates a new SYNKEREFLEKSMONITOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Synkerefleksmonitor_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Synkerefleksmonitor_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Synkerefleksmonitor

% Last Modified by GUIDE v2.5 12-Dec-2017 15:48:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Synkerefleksmonitor_OpeningFcn, ...
                   'gui_OutputFcn',  @Synkerefleksmonitor_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Synkerefleksmonitor is made visible.
function Synkerefleksmonitor_OpeningFcn(hObject, eventdata, handles, varargin)
handles = Start_GUI(handles);
guidata(hObject, handles);

% UIWAIT makes Synkerefleksmonitor wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Synkerefleksmonitor_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
%varargout{1} = handles.output;

function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in Btn_Save_Measurements.
function Btn_Save_Measurements_Callback(hObject, eventdata, handles)
handles = Save_Measurements(handles);
guidata(hObject,handles);


% --- Executes on button press in Btn_Start_Measurements.
function Btn_Start_Measurements_Callback(hObject, eventdata, handles)
handles = Generate_SineWave(handles);
handles = Read_Measurements(handles);
handles = Process_Measurements(handles);
guidata(hObject,handles);
handles = Show_Measurements(handles);
set(handles.txtSynk, 'String', length(handles.locs_synk));
set(handles.txtSynk,'Visible','On');
set(handles.Btn_Save_Measurements,'Visible','On');
guidata(hObject,handles);



function txtstrom_Callback(hObject, eventdata, handles)
% hObject    handle to txtstrom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtstrom as text
%        str2double(get(hObject,'String')) returns contents of txtstrom as a double


% --- Executes during object creation, after setting all properties.
function txtstrom_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtstrom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in popSec.
function popSec_Callback(hObject, eventdata, handles)
% hObject    handle to popSec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popSec contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popSec


% --- Executes during object creation, after setting all properties.
function popSec_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popSec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Btn_Load_Measurements.
function Btn_Load_Measurements_Callback(hObject, eventdata, handles)
handles = Load_Measurements(handles);
guidata(hObject,handles);
handles = Process_Measurements(handles);
guidata(hObject,handles);
handles = Show_Measurements(handles);
set(handles.txtSynk, 'String', length(handles.locs_synk));
set(handles.txtSynk,'Visible','On');
set(handles.Btn_Save_Measurements,'Visible','Off');
set(handles.txtLoad,'Visible','Off');
guidata(hObject,handles);
