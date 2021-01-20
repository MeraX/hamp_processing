function [tb, f] = removeTBErrors(dateuse, dataversion)

datafile = [getPathPrefix getCampaignFolder(dateuse) 'aux/errorFlagRadiometer.mat'];

% Load error index data (generated by looking through the data using
% assess_radiometer_data.m or run_assessData.m)
load(datafile, 'errorFlag', 'sawtoothFlag', 'date')

vars = whos('-file', datafile);

if any(strcmp(extractfield(vars, 'name'), 'errorFlagSingleChannel'))
    
    load(datafile, 'dateSingleChannel', 'errorFlagSingleChannel', 'frequencySingleChannel', 'instrSingleChannel')
    
    singleChannelError = true;
end

% Get path to radiometer data file
file = listFiles([getPathPrefix getCampaignFolder(dateuse) 'all_nc/radiometer*' dateuse '*' dataversion '*.nc'],...
                    'latest', 'full');
% Read data (brightness temperatures, time, frequency)
tb = ncread(file, 'tb');
t = ncread(file, 'time');
f = ncread(file, 'frequency');


% Explanation for different radiometer modules
% 1: 183,   f>180
% 2: 11990, f>=90 & f<180
% 3: KV,    f<90

% Loop radiometer modules
for i=1:3
    
    % Set module to work on
    if i==1
        index = f>=180;
    elseif i==2
        index = f>=90 & f<180;
    elseif i==3
        index = f<90;
    end
    
    % Get index for current date
    dateindex = strcmp(date, dateuse);
    
    if singleChannelError
        dateindexSingleChannel = strcmp(dateSingleChannel, dateuse);
    end
    
    % Replace error values with nan
    tb(index,errorFlag{dateindex, i}) = nan;
    
    % Check if there were errors in single channels and if sizes of error
    % flags agree with data arrays
    if singleChannelError && ...
            ~isempty(frequencySingleChannel{dateindexSingleChannel, i}) && ...
            all(double(frequencySingleChannel{dateindexSingleChannel, i})==f(index)) && ...
            all(size(tb(index, :))==size(errorFlagSingleChannel{dateindexSingleChannel, i}))
        
        % Copy variable
        tbModule = tb(index, :);
        % Apply error flags to remove data
        tbModule(errorFlagSingleChannel{dateindexSingleChannel, i}) = nan;
        
        % Copy corrected data back
        tb(index, :) = tbModule;
        
        
    end

    % Replace saw tooth values with nan
    tb(index,sawtoothFlag{dateindex, i}) = nan;
    
end