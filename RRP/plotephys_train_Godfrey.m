function [Group] = plotephys_train_Godfrey(group);
%{
Script for loading an 'abf' electrophysiology file of my train recordings,
creating an averaged trace of the first two sweeps and then plotting it
with the X-axis in seconds. This script is for data that was collected at
20 KHz using Clampex in an abf file type.

This function is used in the following script:
Analyze_Trains_Godfrey.m
%}

%% Getting my data from a manually selected file

fprintf(['\nselect ' group '\n\n']);

pathname = uigetdir; % Creates a variable with the path where this folder is.
addpath(pathname); % Adds the path so that MatLab can reach into that folder
filename = dir(pathname); % Creates a variable with the directory for the folder that I select. Should be the folder where my file is.

for n = 1:length(filename)-2;
Group(n).name = filename(n+2).name; % Creates a variable 'name' corresponding with 'n'

addpath('/Users/nathansmac/Documents/MATLAB/MATLAB/abfload'); % adds the path to get abload
[d,si,h] = abfload(Group(n).name);
%d will actually have 3 components: N1xN2xN3
%N1 = all of my data points over time
%N2 = my channels (I have two channels on here; one was for my test pulse)
%the first channel is where my data is
%N3 = all the different sweeps that I have

%% Creating my x-axis

t_vec = linspace(0,size(d,1)/20000,size(d,1));      % My sampling rate was 20 KHz, so this give me time in seconds
%% Subtracting my baseline

% My baseline region of interest:
B1 = 0.4 * 20000;   % Converting from time to data points (sample colleced at 20 KHz)
B2 = 0.6 * 20000;

s = size(d);
l = s(3);
for m = 1:l;        % Do this for every sweep (most of my recordings have 4 sweeps)
    Baseline = d(B1:B2,1,m);            % Designates the area of my trace that will be the baseline
    Distance_Zero = mean(Baseline);     % Finds the average value of all my values within baseline region
    Cell1(m).trace = d(:,1,m) - Distance_Zero;  % Subtracts baseline, so all my values will be measured from 0 pA
end

%% Creating an average trace of the first two sweeps in the file

basetrace_array = [];
for m = 1:2;                                % This for loop will be done on my first and second sweeps
    basetrace_vector = Cell1(m).trace;      % One at a time
    basetrace_array = [basetrace_array basetrace_vector];   % Puts them in an array side by side
end

Cell1(1).basetrace = [];        % This creates my trace
for ii = 1:length(basetrace_array);     % Will run this for every point in my trace
    mean_base = mean(basetrace_array(ii,:));    % Takes the average one row at a time
    Cell1(1).basetrace = [Cell1(1).basetrace; mean_base];   % Adds each value below the last, making a column that contains all the averaged values
end

%% Creating my regions of interest

Stim1 = [0.6797];         % 0.68          0.6798       This is the start of region where I can find my first peak
Stim2 = [0.685];          % 0.687         0.685        This is the end of the region where I can find my first peak
l = length(Stim1);
while l < 40;                               % This loop creates an index where I can find my 40 peaks
    Stim1 = [Stim1; (Stim1(end) + 0.01)];
    Stim2 = [Stim2; (Stim2(end) + 0.01)];
    l = length(Stim1);
end

Stim1 = Stim1 * 20000;         % Multiplies my time values by 20000, because this data was collected at 20 KHz
Stim2 = Stim2 * 20000;         % This gives me my values per data point.
%% Finding the peaks (amplitude and location in seconds)

% This is a shorter and cleaner way (Although maybe not faster):
All_Peaks = NaN(1,40);
All_Peaktimes = NaN(1,40);
l = length(Stim1);  % Contains all my regions of interest
for m = 1:l         % Will run this for loop for all 40 regions of interest
    A = int32(Stim1(m));   % The beginning of my region of interest. Must be an integer for the findepeaks function.
    B = int32(Stim2(m));   % The end of my region of interest
    [Peaks,Peaktimes]= findpeaks(-Cell1(1).basetrace(A:B)); % This will give me multiple peaks within each region
    Peaktimes = Peaktimes + Stim1(m);   % Add the beginning of my region of interest to get the actual times
    Peak = min(-Peaks);                 % Find the lowest peak, which will be my actual peaks, since this is an inward current
    Peak = Peak(1);                     % Just in case I got two values that were the same, I'm only going to take the first.
    Index = -Peaks == Peak;             % Creates an index where my peak occured
    Peak_time = Peaktimes(Index);       % Uses that index to find my times
    Peak_time = Peak_time / 20000;      % Converts to seconds (sampling rate of 20 KHz
    Peak_time = Peak_time(1);           % Just in case I got two values that were the same, I'm only going to take the first.
    All_Peaks(m) = Peak;       % Creates avector
    All_Peaktimes(m) = Peak_time; % Creates a vector
end

%% Creating a graph to look at my data

figure; hold on;
plot(t_vec,Cell1(1).basetrace);
plot(All_Peaktimes, All_Peaks, 'r*');
ylabel('Amplitude (pA)'); xlabel('time (s)');
xlim([0.67 1.1]); ylim([-600 0]);
title(['the averaged trace for ' {Group(n).name}]);
hold off;

%% The data that I will take out of this function in the Group structure

Group(n).trace = Cell1(1).basetrace;
Group(n).X = t_vec;
Group(n).peaks = All_Peaks;
Group(n).peaktime = All_Peaktimes;

fprintf(['\nCompleted: ' Group(n).name '\n\n'])
end
