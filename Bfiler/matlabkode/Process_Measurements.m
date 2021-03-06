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

BI_data = BIsignal - f_y; 

% Den indtastet stroem
strom = str2double(get(handles.txtstrom,'String'));
BI_dataImpedans = (BI_data/(strom*10^-5));

% Downsampler BI
downBI = downsample(BI_dataImpedans,20000);
% Smoother BI
smoothBI = smooth(downBI);

% Detekterer synk (peaks)
BI_inverted = -smoothBI;
[~,locs_synk] = findpeaks(BI_inverted,'MinPeakHeight',4.5,...
                                        'MinPeakDistance',30);

handles.locs_synk = locs_synk;

handles.BIsignal = smoothBI; %BI signalet gemmes i handles til senere visning

%% EMG

% Downsampler EMG
downEMG = downsample(handles.EMG,20000);
% Smoother EMG
smoothEMG = smooth(downEMG);

handles.EMGsignal = smoothEMG; %EMG signalet gemmes i handles til senere visning
%% TID
% Downsampler EMG
handles.TID = downsample(handles.timestamps,20000); % Nu har tid samme stoerrelse som BI og EMG
end

