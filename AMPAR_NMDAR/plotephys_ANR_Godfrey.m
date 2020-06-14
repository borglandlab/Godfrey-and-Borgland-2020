function [Group] = plotephys_ANR_Godfrey(Add_Index,Drug_Index,Length,group);
%{
Script for loading an 'abf' electrophysiology file of my AMPAR/NMDAR ratio
recordings and then plotting it with the X-axis in seconds. This script
will also allow me to create an averaged trace.

For this function to work, I need to specify the Group where I will save my
data (will become a structure), the time (sweep #) where the AP5 was added,
the time (sweep #) where the AP5 was seen to take effect, the number of
recordings in this group, and the name of the group (ex. Male_Control)

The data will be organized in the form of a structure, and can then be
prepared/analyzed using the following script:
Analyze_AMPAR_NMDAR_Godfrey.m
%}

pathname = uigetdir; % Creates a variable with the path where this folder is.
addpath(pathname); % Adds the path so that MatLab can reach into that folder
filename = dir(pathname); % Creates a variable with the directory for the folder that I select. Should be the folder where my file is.
r = length(filename) - Length;
for n = 1:length(filename)-r;
Group(n).group = group;
Group(n).name = filename(n+r).name; % Creates a variable 'name' corresponding with 'n'

addpath('/Users/nathansmac/Documents/MATLAB/MATLAB/abfload'); % adds the path to get abfload function
[d,si,h] = abfload(Group(n).name);
%d will actually have 3 components: N1xN2xN3
%N1 = all of my data points over time
%N2 = my channels (I have two channels on here; one was for my test pulse)
%the first channel is where my data is
%N3 = all the different sweeps that I have

t_vec = linspace(0,size(d,1)/20000,size(d,1));  % Creates a vector for my x-coordinates, assuming the sampling rate was 20 KHz

%%
% This picks my total current and my AMPAR-Current (before shifting to 0)
Total_I_Index = [Add_Index(n)-11:Add_Index(n)];
Total_I = d(:,1,Total_I_Index);
AMPAR_I_Index = [Drug_Index(n)+30:Drug_Index(n)+42];
AMPAR_I = d(:,1,AMPAR_I_Index);

%% Adjusts each trace according to the baseline - allowing me to later subtract currents to get the NMDR current
% Baseline points
C1 = 0.4 * 20000;
C2 = 0.6 * 20000;
% For the Total Current
s = size(Total_I);
l = s(3);
Total_I_array = [];
for m = 1:l;
    Baseline_Total_I = Total_I(C1:C2,1,m);
    Distance_Zero_Total_I = mean(Baseline_Total_I);
    Total_I_trace = Total_I(:,1,m) - Distance_Zero_Total_I;
    Total_I_array = [Total_I_array Total_I_trace];
end

Total_I_meantrace = [];
for ii = 1:length(Total_I_array);
    mean_base = mean(Total_I_array(ii,:));
    Total_I_meantrace = [Total_I_meantrace; mean_base];
end

% For the AMPAR Current
s = size(AMPAR_I);
l = s(3);
AMPAR_I_array = [];
for m = 1:l;
    Baseline_AMPAR_I = AMPAR_I(C1:C2,1,m);
    Distance_Zero_AMPAR_I = mean(Baseline_AMPAR_I);
    AMPAR_I_trace = AMPAR_I(:,1,m) - Distance_Zero_AMPAR_I;
    AMPAR_I_array = [AMPAR_I_array AMPAR_I_trace];
end

AMPAR_I_meantrace = [];
for ii = 1:length(AMPAR_I_array);
    mean_base = mean(AMPAR_I_array(ii,:));
    AMPAR_I_meantrace = [AMPAR_I_meantrace; mean_base];
end

% For the NMDAR current
NMDAR_I_meantrace = Total_I_meantrace - AMPAR_I_meantrace;
%% Detection of my AMPAR and NMDAR current peaks

Stim1 = 0.68*20000; Stim2 = 0.75*20000; % my peaks can be found between these points:

% for NMDAR Peaks
[Peaks,PeakTimes] = findpeaks(NMDAR_I_meantrace);   % This may actually return several peaks (based on where it finds inflections)

Index = (Stim1 < PeakTimes) & (Stim2 > PeakTimes); 
Index = Index == 1;

[NMDAR_Peak,Location] = max(Peaks(Index),[],'linear');  % I only want the most maximum point (i.e. only one peak)
PK = PeakTimes(Index);
Peak_Time = PK(Location);
NMDAR_Real_Time = Peak_Time / 20000;

% for AMPAR Peaks
[Peaks,PeakTimes] = findpeaks(AMPAR_I_meantrace);   % Finds many peaks

Index = (Stim1 < PeakTimes) & (Stim2 > PeakTimes); 
Index = Index == 1;

[AMPAR_Peak,Location] = max(Peaks(Index),[],'linear');  % Only take the maximum point.
PK = PeakTimes(Index);
Peak_Time = PK(Location);
AMPAR_Real_Time = Peak_Time / 20000;

AN_Ratio = AMPAR_Peak ./ NMDAR_Peak;

%{
% Plotting the trace - only need to do this to check how my data looks
% (make sure it worked)
figure; hold on;
plot(t_vec,NMDAR_I_meantrace, 'k-');
plot(NMDAR_Real_Time,NMDAR_Peak, 'c*');
plot(t_vec, AMPAR_I_meantrace, 'r-');
plot(AMPAR_Real_Time, AMPAR_Peak, 'c*');
ylabel('Amplitude (pA)'); xlabel('time (s)');
xlim([0.67 1.1]); ylim([0 600]);
title(['AMPAR/NMDAR Ratio for ' {Group(n).name} '_' {Group(n).group}]);
hold off;
%}
%% Puts all my data neatly into a MatLab structure

Group(n).AMPARtrace = AMPAR_I_meantrace;
Group(n).NMDARtrace = NMDAR_I_meantrace;
Group(n).Totaltrace = Total_I_meantrace;
Group(n).AMPAR_Amplitude = AMPAR_Peak;
Group(n).AMPAR_Location = AMPAR_Real_Time;
Group(n).NMDAR_Amplitude = NMDAR_Peak;
Group(n).NMDAR_Location = NMDAR_Real_Time;
Group(n).AN_Ratio = AN_Ratio;
Group(n).X = t_vec;
Group(n).Drug_Index = Drug_Index(n);
end
end