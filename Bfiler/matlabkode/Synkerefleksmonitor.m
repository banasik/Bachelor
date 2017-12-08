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

% Last Modified by GUIDE v2.5 08-Dec-2017 11:52:08

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
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Synkerefleksmonitor (see VARARGIN)

% Choose default command line output for Synkerefleksmonitor
%handles.output = hObject;
handles = Start_GUI(handles);
% Update handles structure
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


% --- Executes on button press in Btn_Start_Measurments.
function Btn_Start_Measurments_Callback(hObject, eventdata, handles)
% hObject    handle to Btn_Start_Measurments (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles = Generate_SineWave(handles);
handles = Read_Measurments(handles);
handles = Process_Measurments(handles);
guidata(hObject,handles);
handles = Show_Measurements(handles);
set(handles.Btn_Save_Measurments,'Visible','On');
guidata(hObject,handles);
%Save_Measurments;




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


% --- Executes on button press in Btn_Save_Measurments.
function Btn_Save_Measurments_Callback(hObject, eventdata, handles)
% hObject    handle to Btn_Save_Measurments (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles = Save_Measurements(handles);
guidata(hObject,handles);
