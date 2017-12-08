function handles = Process_Measurments(handles)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

RawBI = handles.data(:,1);

% Dobbeltensret signal
BIabs = abs(RawBI);

% Udglat signal
lpFilt = designfilt('lowpassfir', 'PassbandFrequency', 2E-3, ...
                    'StopbandFrequency', 2E-2, 'PassbandRipple', 0.2, ...
                    'StopbandAttenuation', 40, 'DesignMethod', ...
                    'kaiserwin');

BIsignal = filter(lpFilt,BIabs);
handles.BIsignal = BIsignal;

end

