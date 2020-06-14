function [GroupA] = cumulativeSum_Train(GroupA);

%{
This function calculates the cumulative sum in amplitude (pA) and in
percent from my train data. Step in determining the relative readily
releasable pool.

This function is used in the following script:
Analyze_Trains_Godfrey.m
%}

% for calculating the cumulative sum
for m = 1:length(GroupA);
GroupA(m).cumulativeSum = cumsum(GroupA(m).peaks);
end

%{
GroupA(m).cumulativeSum_percent = [];
for n = 1:length(GroupA(m).cumulativeSum);
    a = (GroupA(m).cumulativeSum(n)/GroupA(m).cumulativeSum(end))*100;
    GroupA(m).cumulativeSum_percent = [GroupA(m).cumulativeSum_percent; a];
end
%}

X = 0:1:(length(GroupA(m).cumulativeSum)-1);
figure; hold on; % I could use the function savefig here to save this figure
GroupA(m).cumulativeSumplot = plot(X,-GroupA(m).cumulativeSum,'b-*','MarkerEdgeColor','r');
ylabel('Amplitude (pA)'); xlabel('pulse number');
title(['the cumulative sum for ' {GroupA(m).name} 'a male fasted mouse']);
hold off

%{
% This is to plot the cumulative sum as a percent.
figure;
plot(X,MaleFasted_Train(1).cumulativeSum_percent);
%}
end