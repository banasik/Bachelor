%% Setup Session, Add Channels and Configure Parameters
% Create the data acquisition session
daqSession = daq.createSession('digilent');
% Create analog input channel with board ID 'AD1', Channel '1', measuring 'Voltage'
daqSession.addAnalogInputChannel('AD1', '1', 'Voltage');
%% Clean up and release hardware
daqSession.release();
delete(daqSession);
clear daqSession;
