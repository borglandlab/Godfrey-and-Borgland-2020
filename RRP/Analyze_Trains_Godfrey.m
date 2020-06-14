%{
This script will calculate the readily releasable pool (RRP), the
probability of release (p) and the paired-pulse ratio (PPR) given the 100
Hz stimulation. This is following the protocol established by
Regher et al. 2013 and 2016.

Functions that this script will use:
plotephys_train_Godfrey.m
cumulativeSum_Train_Godfrey.m
CalculateRRP_Godfrey.m
PPR_Trains_Godfrey.m
%}

% Finding peak amplitudes of all 40 pulses in the 100 Hz train
[MaleControl_Train] = plotephys_train_Godfrey('Male Control');
[MaleFasted_Train] = plotephys_train_Godfrey('Male Fasted');
[FemaleControl_Train] = plotephys_train_Godfrey('Female Control');
[FemaleFasted_Train] = plotephys_train_Godfrey('Female Fasted');

% Calculatinga and plotting the cumulative sum of the 40 pulses in the
% 100 Hz stimulation
[MaleControl_Train] = cumulativeSum_Train_Godfrey(MaleControl_Train);
[MaleFasted_Train] = cumulativeSum_Train_Godfrey(MaleFasted_Train);
[FemaleControl_Train] = cumulativeSum_Train_Godfrey(FemaleControl_Train);
[FemaleFasted_Train] = cumulativeSum_Train_Godfrey(FemaleFasted_Train);
%%
% Getting the RRP(train) and p(train)
%{
The RRP(train) is calculated by plotting the cumulative sum off all 40
pulses of the 100 Hz stimulation, fitting a line to the last 14 points in
that plot, and taking the y-intercept of the line.

The p(train) is calculated by dividing the first pulse in the 100 Hz
stimulation by the RRP(train).
%}
[MaleControl_Train] = CalculateRRP_Godfrey(MaleControl_Train);
[MaleFasted_Train] = CalculateRRP_Godfrey(MaleFasted_Train);
[FemaleControl_Train] = CalculateRRP_Godfrey(FemaleControl_Train);
[FemaleFasted_Train] = CalculateRRP_Godfrey(FemaleFasted_Train);

%%
% Getting the PPR(train)
%{
The PPR(train) is calculated by dividing the second pulse of the 100 Hz
stimulation by the first pulse of the 100 Hz stimulation.
%}
[MaleControl_Train] = PPR_Trains_Godfrey(MaleControl_Train);
[MaleFasted_Train] = PPR_Trains_Godfrey(MaleFasted_Train);
[FemaleControl_Train] = PPR_Trains_Godfrey(FemaleControl_Train);
[FemaleFasted_Train] = PPR_Trains_Godfrey(FemaleFasted_Train);

%%

% Making a table of RRP(train), p(train), PPR(train)

MC_RRP = NaN(12,1);
MC_RRP(1:length([MaleControl_Train.RRP_train])) = [MaleControl_Train.RRP_train]';
MC_p = NaN(12,1);
MC_p(1:length([MaleControl_Train.p_train])) = [MaleControl_Train.p_train]';
MC_RRP(1:length([MaleControl_Train.RRP_train])) = [MaleControl_Train.RRP_train]';
MC_PPR = NaN(12,1);
MC_PPR(1:length([MaleControl_Train.PPR])) = [MaleControl_Train.PPR]';

MF_RRP = NaN(12,1);
MF_RRP(1:length([MaleFasted_Train.RRP_train])) = [MaleFasted_Train.RRP_train]';
MF_p = NaN(12,1);
MF_p(1:length([MaleFasted_Train.p_train])) = [MaleFasted_Train.p_train]';
MF_PPR = NaN(12,1);
MF_PPR(1:length([MaleFasted_Train.PPR])) = [MaleFasted_Train.PPR]';

FC_RRP = NaN(12,1);
FC_RRP(1:length([FemaleControl_Train.RRP_train])) = [FemaleControl_Train.RRP_train]';
FC_p = NaN(12,1);
FC_p(1:length([FemaleControl_Train.p_train])) = [FemaleControl_Train.p_train]';
FC_PPR = NaN(12,1);
FC_PPR(1:length([FemaleControl_Train.PPR])) = [FemaleControl_Train.PPR]';

FF_RRP = NaN(12,1);
FF_RRP(1:length([FemaleFasted_Train.RRP_train])) = [FemaleFasted_Train.RRP_train]';
FF_p = NaN(12,1);
FF_p(1:length([FemaleFasted_Train.p_train])) = [FemaleFasted_Train.p_train]';
FF_PPR = NaN(12,1);
FF_PPR(1:length([FemaleFasted_Train.PPR])) = [FemaleFasted_Train.PPR]';

Array_RRP_train = [MC_RRP FC_RRP MF_RRP FF_RRP];
Table_RRP_train = array2table(Array_RRP_train);
groups = {'Male_Control', 'Female_Control', 'Male_Fasted', 'Female_Fasted'};
Table_RRP_train.Properties.VariableNames = groups;
clear MC_RRP FC_RRP MF_RRP FF_RRP Array_RRP_train

Array_p_train = [MC_p FC_p MF_p FF_p];
Table_p_train = array2table(Array_p_train);
Table_p_train.Properties.VariableNames = groups;
clear MC_p FC_p MF_p FF_p Array_p_train

Array_PPR_train = [MC_PPR FC_PPR MF_PPR FF_PPR];
Table_PPR_train = array2table(Array_PPR_train);
Table_PPR_train.Properties.VariableNames = groups;
clear MC_PPR FC_PPR MF_PPR FF_PPR Array_PPR_train groups

% writing table to excel

writetable(Table_RRP_train,'Train.xlsx','Sheet','RRP_train','Range','A1');
writetable(Table_p_train,'Train.xlsx','Sheet','p_train','Range','A1');
writetable(Table_PPR_train,'Train.xlsx','Sheet','PPR_train','Range','A1');
%% Plotting traces
%{
% Male Control
n = 9;
%for n = 1:length(MaleControl_Train);
figure; hold on;
plot(MaleControl_Train(n).X, MaleControl_Train(n).trace);
plot(MaleControl_Train(n).peaktime, MaleControl_Train(n).peaks, 'r*');
ylabel('Amplitude (pA)'); xlabel('time (s)');
xlim([0.67 1.1]); ylim([-600 0]);
title(['Male Control' 'the averaged trace for Male Control ' {MaleControl_Train(n).name}]);
hold off;
%end

figure; hold on;
plot([0:39],-MaleControl_Train(n).cumulativeSum, 'ko', 'MarkerSize', 15);
plot([0 39], [MaleControl_Train(n).RRP_train (-MaleControl_Train(n).cumulativeSum(40))], 'k', 'LineWidth', 2);
ylabel('Cumulative EPSC (pA)'); xlabel('Stimulus Number');
title(['Male Control' 'Graph showing RRP(train) calculations for ' {MaleControl_Train(n).name}]);
hold off;

% Male Fasted
n = 9;
%for n = 1:length(MaleFasted_Train);
figure; hold on;
plot(MaleFasted_Train(n).X, MaleFasted_Train(n).trace);
%plot(MaleFasted_Train(n).peaktime, MaleFasted_Train(n).peaks, 'r*');
ylabel('Amplitude (pA)'); xlabel('time (s)');
xlim([0.67 1.1]); ylim([-600 0]);
title(['Male Fasted' 'the averaged trace for Male Fasted ' {MaleFasted_Train(n).name}]);
hold off;
%end

figure; hold on;
plot([0:39],-MaleFasted_Train(n).cumulativeSum, 'ko', 'MarkerSize', 15);
plot([0 39], [MaleFasted_Train(n).RRP_train (-MaleFasted_Train(n).cumulativeSum(40))], 'k', 'LineWidth', 2);
ylabel('Cumulative EPSC (pA)'); xlabel('Stimulus Number');
title(['Male Fasted' 'Graph showing RRP(train) calculations for ' {MaleFasted_Train(n).name}]);
hold off;

% Female Control
n = 6;
%for n = 1:length(FemaleControl_Train);
figure; hold on;
plot(FemaleControl_Train(n).X, FemaleControl_Train(n).trace);
%plot(FemaleControl_Train(n).peaktime, FemaleControl_Train(n).peaks, 'r*');
ylabel('Amplitude (pA)'); xlabel('time (s)');
xlim([0.67 1.1]); ylim([-600 0]);
title(['Female Control' 'the averaged trace for Female Control ' {FemaleControl_Train(n).name}]);
hold off;
%end

figure; hold on;
plot([0:39],-FemaleControl_Train(n).cumulativeSum, 'ko', 'MarkerSize', 15);
plot([0 39], [FemaleControl_Train(n).RRP_train (-FemaleControl_Train(n).cumulativeSum(40))], 'k', 'LineWidth', 2);
ylabel('Cumulative EPSC (pA)'); xlabel('Stimulus Number');
title(['Female Control' 'Graph showing RRP(train) calculations for ' {FemaleControl_Train(n).name}]);
hold off;

% Female Fasted
n = 4;
%for n = 1:length(FemaleFasted_Train);
figure; hold on;
plot(FemaleFasted_Train(n).X, FemaleFasted_Train(n).trace);
%plot(FemaleFasted_Train(n).peaktime, FemaleFasted_Train(n).peaks, 'r*');
ylabel('Amplitude (pA)'); xlabel('time (s)');
xlim([0.67 1.1]); ylim([-600 0]);
title(['Female Fasted' 'the averaged trace for Female Fasted ' {FemaleFasted_Train(n).name}]);
hold off;
%end

figure; hold on;
plot([0:39],-FemaleFasted_Train(n).cumulativeSum, 'ko', 'MarkerSize', 15);
plot([0 39], [FemaleFasted_Train(n).RRP_train (-FemaleFasted_Train(n).cumulativeSum(40))], 'k', 'LineWidth', 2);
ylabel('Cumulative EPSC (pA)'); xlabel('Stimulus Number');
title(['Female Fasted' 'Graph showing RRP(train) calculations for ' {FemaleFasted_Train(n).name}]);
hold off;
%}