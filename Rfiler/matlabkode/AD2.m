%%  AD2 Code for communicating with a data acquisition device.
%
% This is the machine generated representation of a data acquisition
% session using the session-based interface. The data acquisition session
% comprises all the steps you are likely to take when communicating with 
% your data acquisition device. These steps are:
%
% # Create a data acquisition session
% # Add channels specified by subsystem type and device
% # Configure properties
% # Run the data acquisition session
% # Disconnect from the device
%
% To run the saved data acquisition session, type the name of the file,
% AD2, at the MATLAB command prompt.
%
% The file, AD2.M must be on your MATLAB PATH. For additional information
% on setting your MATLAB PATH, type 'help addpath' at the MATLAB command
% prompt.
%
% Example:
%   AD2;
%
%

%%  Disconnect from the device
daqSession.release();
delete(daqSession);
clear daqSession;
