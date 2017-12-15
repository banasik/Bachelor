function handles = Process_Measurements(handles)
% Digital behandling af BI og EMG
%% BI signal - envelope

% Dobbelt ensretter BI signal
BIabs = abs(handles.BI);

% Udglattr BI signal med lavpas filter.
% Knaekfrekvens = 500 Hz
% Daemper en dekade frem til 5000 Hz
lpFilt = designfilt('lowpassfir', 'PassbandFrequency', 0.001, ...
                    'StopbandFrequency', 0.01, 'PassbandRipple', 0.2, ...
                    'StopbandAttenuation', 40, 'DesignMethod', ...
                    'kaiserwin');

BIsignal = filter(lpFilt,BIabs); %BI signalet filteret

% Detrending data
[p,s,mu] = polyfit((1:numel(BIsignal))',BIsignal,6);
f_y = polyval(p,(1:numel(BIsignal))',[],mu);


