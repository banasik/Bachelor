function handles = Process_Measurements(handles)
% Digital envelope af BI signalet.
RawBI = handles.data(:,1); % Det raa BI signal tages ud af data

% Dobbeltensret BI signal
BIabs = abs(RawBI);

% Udglattr BI signal med lavpas filter.
% Knaekfrekvens = 500 Hz
% Daemper en dekade frem til 5000 Hz
lpFilt = designfilt('lowpassfir', 'PassbandFrequency', 0.001, ...
                    'StopbandFrequency', 0.01, 'PassbandRipple', 0.2, ...
                    'StopbandAttenuation', 40, 'DesignMethod', ...
                    'kaiserwin');

BIsignal = filter(lpFilt,BIabs); %BI signalet filteret
handles.BIsignal = BIsignal; %BI signalet gemmes i handles til senere visning
end

