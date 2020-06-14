%{
This script imports data through the plotephys_ANR_Godfrey and then saves
the AMPAR/NMDAR ratio in a structure and writes it to a file so that I can
analyze the data in graph pad prism. This code requires you to specify both
the time (# of sweeps) when the AP5 is added and also the time (# of
sweeps) when the AP5 is seen to begin taking effect.

This script uses the following function:
plotephys_ANR_Godfrey.m
%}
%% Creating structures that contain all my AMPAR/NMDAR ratio data

Group_MC = 'Male Control';
Add_Index_MC = [54 105 82 106 79 43 31 122 142];    % This is an index of when the AP5 was added for each recording
Drug_Index_MC = [76 118 111 125 99 64 51 147 165]'; % This is an index of when the AP5 was seen to take effect for each recording
Length_MC = 9;  % Number of recordings there are for this group (Male Control)
addpath('/Users/nathansmac/Documents/MATLAB/MATLAB');   % assures that the path to the plotephys_ANR_Godfrey function can be found
display 'Select Folder for AMPAR/NDMAR Ratio Male Control';
[MaleControl_AMPARNMDAR] = plotephys_ANR_Godfrey(Add_Index_MC,Drug_Index_MC,Length_MC,Group_MC);    % Calls the plotephys_ANR_Godfrey function
clear Add_Index_MC Group_MC Drug_Index_MC Length_MC display;

Group_MF = 'Male Fasted';
Add_Index_MF = [75 187 77 83 74 46 35 115 36 33];
Drug_Index_MF = [98 209 101 107 91 67 59 145 54 53]';
Length_MF = 10;
addpath('/Users/nathansmac/Documents/MATLAB/MATLAB');
display 'Select Folder for AMPAR/NDMAR Ratio Male Fasted';
[MaleFasted_AMPARNMDAR] = plotephys_ANR_Godfrey(Add_Index_MF,Drug_Index_MF,Length_MF,Group_MF);
clear Add_Index_MF Group_MF Drug_Index_MF Length_MF display;

Group_FC = 'Female Control';
Add_Index_FC = [307 125 43 80 121 179 51 48];
Drug_Index_FC = [327 146 66 99 148 204 75 72]';
Length_FC = 8;
addpath('/Users/nathansmac/Documents/MATLAB/MATLAB');
display 'Select Folder for AMPAR/NDMAR Ratio Female Control';
[FemaleControl_AMPARNMDAR] = plotephys_ANR_Godfrey(Add_Index_FC,Drug_Index_FC,Length_FC,Group_FC);
clear Add_Index_FC Group_FC Drug_Index_FC Length_FC display

Group_FF = 'Female Fasted';
Add_Index_FF = [186 50 46 100 108 38 32 81 32];
Drug_Index_FF = [202 69 66 123 135 56 51 101 52]';
Length_FF = 9;
addpath('/Users/nathansmac/Documents/MATLAB/MATLAB');
display 'Select Folder for AMPAR/NDMAR Ratio Female Fasted';
[FemaleFasted_AMPARNMDAR] = plotephys_ANR_Godfrey(Add_Index_FF,Drug_Index_FF,Length_FF,Group_FF);
clear Add_Index_FF Group_FF Drug_Index_FF Length_FF display;

%% Creating tables from my structure

% Creating a table for the two-way ANOVA analysis in graph pad prism

MC_Ratio = NaN(10,1);
MC_Ratio(1:length([MaleControl_AMPARNMDAR.AN_Ratio])) = [MaleControl_AMPARNMDAR.AN_Ratio]';
MF_Ratio = NaN(10,1);
MF_Ratio(1:length([MaleFasted_AMPARNMDAR.AN_Ratio])) = [MaleFasted_AMPARNMDAR.AN_Ratio]';
FC_Ratio = NaN(10,1);
FC_Ratio(1:length([FemaleControl_AMPARNMDAR.AN_Ratio])) = [FemaleControl_AMPARNMDAR.AN_Ratio]';
FF_Ratio = NaN(10,1);
FF_Ratio(1:length([FemaleFasted_AMPARNMDAR.AN_Ratio])) = [FemaleFasted_AMPARNMDAR.AN_Ratio]';

AN_Ratio_2way = [MC_Ratio FC_Ratio MF_Ratio FF_Ratio];
AN_Ratio_2way = array2table(AN_Ratio_2way);
AN_Ratio_2way.Properties.VariableNames(1:4) = {'Male_Control' 'Female_Control' 'Male_Fasted' 'Female_Fasted'};

% Creating a table for the Column Statistics analysis in graph pad prism
AN_Ratio_CS = [MC_Ratio MF_Ratio FC_Ratio FF_Ratio];
AN_Ratio_CS = array2table(AN_Ratio_CS);
AN_Ratio_CS.Properties.VariableNames(1:4) = {'Male_Control' 'Male_Fasted' 'Female_Control' 'Female_Fasted'};

clear MC_Ratio MF_Ratio FC_Ratio FF_Ratio ans;
%% Saving both tables to an excel file
writetable(AN_Ratio_2way,'AN_Ratio1.xlsx','Sheet','2Way_ANOVA','Range','A1');
writetable(AN_Ratio_CS, 'AN_Ratio1.xlsx','Sheet','Column_Statistics','Range','A1');

%% Creating traces
%{
L = length(MaleControl_AMPARNMDAR(1).AMPARtrace);
X = linspace(0,5,L);

% All of my male control traces
for n = 1:length(MaleControl_AMPARNMDAR);
figure; hold on;
plot(X, MaleControl_AMPARNMDAR(n).AMPARtrace);
%plot(MaleControl_AMPARNMDAR(n).AMPAR_Location, MaleControl_AMPARNMDAR(n).AMPAR_Amplitude, 'r*');
plot(X,MaleControl_AMPARNMDAR(n).NMDARtrace);
%plot(MaleControl_AMPARNMDAR(n).NMDAR_Location,MaleControl_AMPARNMDAR(n).NMDAR_Amplitude, 'c*');
ylabel('Amplitude (pA)'); xlabel('time (s)');
xlim([0.67 0.8]); ylim([0 400]);
title(['the averaged trace for Male Control ' {MaleControl_AMPARNMDAR(n).name}]);
hold off;
end

% All of my male fasted traces
for n = 1:length(MaleFasted_AMPARNMDAR);
figure; hold on;
plot(X, MaleFasted_AMPARNMDAR(n).AMPARtrace);
%plot(MaleFasted_AMPARNMDAR(n).AMPAR_Location, MaleFasted_AMPARNMDAR(n).AMPAR_Amplitude, 'r*');
plot(X,MaleFasted_AMPARNMDAR(n).NMDARtrace);
%plot(MaleFasted_AMPARNMDAR(n).NMDAR_Location,MaleFasted_AMPARNMDAR(n).NMDAR_Amplitude, 'c*');
ylabel('Amplitude (pA)'); xlabel('time (s)');
xlim([0.67 0.8]); ylim([0 400]);
title(['the averaged trace for Male Fasted ' {MaleFasted_AMPARNMDAR(n).name}]);
hold off;
end

% All of my female control traces
for n = 1:length(FemaleControl_AMPARNMDAR);
figure; hold on;
plot(X, FemaleControl_AMPARNMDAR(n).AMPARtrace);
%plot(FemaleControl_AMPARNMDAR(n).AMPAR_Location, FemaleControl_AMPARNMDAR(n).AMPAR_Amplitude, 'r*');
plot(X,FemaleControl_AMPARNMDAR(n).NMDARtrace);
%plot(FemaleControl_AMPARNMDAR(n).NMDAR_Location,FemaleControl_AMPARNMDAR(n).NMDAR_Amplitude, 'c*');
ylabel('Amplitude (pA)'); xlabel('time (s)');
xlim([0.67 0.8]); ylim([0 400]);
title(['the averaged trace for Female Control ' {FemaleControl_AMPARNMDAR(n).name}]);
hold off;
end

% All of my female fasted traces
for n = 1:length(FemaleFasted_AMPARNMDAR);
figure; hold on;
plot(X, FemaleFasted_AMPARNMDAR(n).AMPARtrace);
%plot(FemaleFasted_AMPARNMDAR(n).AMPAR_Location, FemaleFasted_AMPARNMDAR(n).AMPAR_Amplitude, 'r*');
plot(X,FemaleFasted_AMPARNMDAR(n).NMDARtrace);
%plot(FemaleFasted_AMPARNMDAR(n).NMDAR_Location,FemaleFasted_AMPARNMDAR(n).NMDAR_Amplitude, 'c*');
ylabel('Amplitude (pA)'); xlabel('time (s)');
xlim([0.67 0.8]); ylim([0 400]);
title(['the averaged trace for Female Fasted ' {FemaleFasted_AMPARNMDAR(n).name}]);
hold off;
end
%}