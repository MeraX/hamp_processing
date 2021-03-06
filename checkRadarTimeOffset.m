%% checkRadarTimeOffset
%   checkRadarTimeOffset - code for assessing time offsets betweeen radar
%                          and aircraft time
%
%       Code to assess any time offsets between radar and bahamas data by
%       investigating aircraft turns. The surface echo from the radar is
%       plotted together with the surface location calculated from aircraft
%       attitude data. If both visually match, there is no time difference.
%       Otherwise, this script helps identifying the necessary offset to
%       match both data sets.
%
%       Set a date to investigate in the beginning with 'flightdate'.
%
%       Set 'readNew' to true to read in new data. Otherwise, data in
%       memory will be used. This script does not clear the memory at the
%       start of each run!
%
%       Set 'opendap' to true to read data from specMACS opendap directory
%       (https://macsserver.physik.uni-muenchen.de/products/dap/eurec4a/nav/).
%       Otherwise, local bahams data will be used.
%
%
%
%   Syntax:  checkRadarTimeOffset
%
%   Inputs:
%       none; specify processing mode in beginning of file
%
%   Outputs:
%       none; time offset information to be added to timeOffsetLookup.m
%
%
%
%
%   Author: Dr. Heike Konow
%   Meteorological Institute, Hamburg University
%   email address: heike.konow@uni-hamburg.de
%   Website: http://www.mi.uni-hamburg.de/
%   September 2020; Last revision: November 2020

%------------- BEGIN CODE --------------
%% Input

% --------- Input ----------- %
% Set flight date
flightdate = '20200126';
% Set to true if new data should be read
readNew = false;
% Set to true if bahamas should be loaded from opendap
opendap = false;
% --------------------------- %

%% Preparations
% Close all open figures
close all
% Define one second as serial date number
sdnSecond = 1/24/60/60;


if readNew
    %% Read radar data
    
    % Look for files
    radarfile = listFiles([getPathPrefix getCampaignFolder(flightdate) 'radar/*' flightdate '*'], 'full', 'mat');
    
    % Read reflectivity
    Zg = ncread(radarfile, 'Zg');
    % Convert to dBZ
    dBZ = 10 .* log10(Zg);
    
    % Read radar range and time
    range = ncread(radarfile, 'range');
    timeRadar = ncread(radarfile, 'time');


    %% Read bahamas data
    if opendap
        % Set data location
        bahamasfile = ['https://macsserver.physik.uni-muenchen.de/products/dap/eurec4a/nav/EUREC4A_HALO_BAHAMAS-SPECMACS-100Hz-final_' flightdate 'a.nc'];
        
        % Read bahamas data
        timeBahamas = ncread(bahamasfile, 'time') .* 1e-6;
        roll = ncread(bahamasfile, 'roll');
        pitch = ncread(bahamasfile, 'pitch');
        alt = ncread(bahamasfile, 'height');
    else
        % Look for files
        bahamasfile = listFiles([getPathPrefix getCampaignFolder(flightdate) 'bahamas/*' flightdate '*'], 'full', 'mat');
        
        % Read bahamas data
        timeBahamas = ncread(bahamasfile, 'TIME');
        roll = ncread(bahamasfile, 'IRS_PHI');
        pitch = ncread(bahamasfile, 'IRS_THE');
        alt = ncread(bahamasfile, 'IRS_ALT');
    end
end

%% Plot data

% Set plot switch to true
testPlot = true;

% Create figure
fh = figure(1);
% Set figure size and position
fh.Position = [745 497 934 453];

% Plot radar and bahamas data together
plotComp(timeRadar, range, dBZ, timeBahamas, roll, pitch, alt)

disp('----------------------')
prompt = 'Zoom into aircraft turn. Do calculated surface and radar surface signal match? (y/n)';

% Get input
s = input(prompt,'s');

% If times match
if strcmp(s, 'y')
    
    disp('')
    disp('----------------------')
    disp(['Great! The time offset is 0 sec for flight on ' flightdate])
    
    % Time offset is zero
    tOffset = 0;
    
    % Set plot switch to false and end plotting
    testPlot = false;
    % Get limits for x and y axis
    xl = xlim;
    yl = ylim;
    
% If times don't match
elseif strcmp(s, 'n')
    
    % Shift time series against each other
    
    disp('')
    disp('----------------------')
    prompt = 'How many seconds should the radar data be shifted? (negative: to the left, positive: to the right)';
    
    % Get current time offset
    tOffset = str2double(input(prompt,'s'));
    % Get limits for x and y axis
    xl = xlim;
    yl = ylim;
    
% If input was time offset directly
elseif ~isempty(regexp(s, '[0-9]', 'once')) 
    
    % Get offset from input
    tOffset = str2double(s);
    % Get limits for x and y axis
    xl = xlim;
    yl = ylim;

% Otherwise, return error
else
    error('Please provide ''y'' or ''n'' as answer')
end

%% Test offset

% Plot while switch is true
while testPlot
    
    % Call figure
    figure(1)
    
    % Plot radar and bahamas data together
    plotComp(timeRadar, range, dBZ, timeBahamas, roll, pitch, alt, tOffset)
    
    % Set axes limits to previous values
    xlim(xl)
    ylim(yl)
    % Enable date ticks while zooming
    datetickzoom('x', 'HH:MM:SS', 'keeplimits')
    
    % Ask for feedback
    disp('')
    disp('----------------------')
    prompt = 'Do calculated surface and radar surface signal match now? (y/n)';
    s = input(prompt,'s');
    
    % If data series match
    if strcmp(s, 'y')
        disp(['Great! The time offset is ' num2str(tOffset) ' seconds for flight on ' flightdate])
        
        % End plotting
        testPlot = false;
        
    % If data series don't match
    elseif strcmp(s, 'n')
        
        disp('')
        disp('----------------------')
        prompt = 'How many seconds should the radar data be shifted additionally? (negative: to the left, positive: to the right)';
        
        % Update time offset
        tOffset = tOffset + str2double(input(prompt,'s'));
        xl = xlim;
        yl = ylim;
    
    % If input was time offset directly
    elseif ~isempty(regexp(s, '[0-9]', 'once')) 
        
        % Update time offset
        tOffset = tOffset + str2double(s);
        xl = xlim;
        yl = ylim;
    
    % Otherwise, return error
    else
        error('Please provide ''y'' or ''n'' as answer')
    end

    
end

%% Final test


disp('')
disp('----------------------')
fprintf('Here is the final test figure. If everything looks good, \nplease add the following as a new line to the file timeOffsetLookup.m: \n');

fprintf('''%s'', %d;\n', flightdate, tOffset);

% Call figure
figure(1)
% Plot data series with current offset
plotComp(timeRadar+tOffset, range, dBZ, timeBahamas, roll, pitch, alt)
xlim(xl)
ylim(yl)
datetickzoom('x', 'HH:MM:SS', 'keeplimits')

%% Functions

function plotComp(timeRadar, range, dBZ, timeBahamas, roll, pitch, alt, tOffset)
    
    % Calculate surface distance from aircraft from roll and pitch angle
    sfcCalc = alt ./ cosd(roll) ./ cosd(pitch);
    
    % Convert times to sdn
    timeRadar = unixtime2sdn(timeRadar);
    timeBahamas = unixtime2sdn(timeBahamas);
    
    % Plot radar echo
    surface(timeRadar, range, dBZ, 'EdgeColor', 'none')
    % Adapt color map
    addWhiteToColormap
    
    % Hold plot
    hold on
    
    % Calculate maximum reflectivity
    maxdBZ = max(max(dBZ(~isinf(dBZ))));
    
    % If a time offset is specified, plot old series in grey and current in
    % black
    if exist('tOffset', 'var')
        
        % Convert offset to sdn
        tOffset = 1/24/60/60 .* tOffset;
        
        % Plot old data series grey
        plot3(timeBahamas, sfcCalc, repmat(maxdBZ, length(timeBahamas), 1),...
            'x', 'Color', [.7 .7 .7])
        
        % Plot current data series in black
        plot3(timeBahamas-tOffset, sfcCalc, repmat(maxdBZ, length(timeBahamas), 1),...
            'x-k')
        
    else
        % Plot current data series
        plot3(timeBahamas, sfcCalc, repmat(maxdBZ, length(timeBahamas), 1),...
            'x-k')
    end
    
    % Enable date ticks while zooming
    datetickzoom('x', 'HH:MM:SS')
    
    % Make pretty
    finetunefigures
    setFontSize(gca,14)
    
    % Enable zoom tool
    zoom on
    % Switch figure hold off
    hold off
end



%------------- END OF CODE --------------
