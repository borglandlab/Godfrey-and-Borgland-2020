function [Structure1] = CalculateRRP_Godfrey(Structure1);
%{
This function is for calculating the readily releasable pool (RRP)
according to the protocol established in Regher et al. 2013 and 2016.

plots the final 14 points from the cumulative sum and finds the best fit
line through these points. The y-intercept is the relative readily
releasable pool (RRP). The probability of release is the first point on the
cumulative sum plot divided by the calculated RRP.

This function is used in the following script:
Analyze_Trains_Godfrey.m
%}

for n = 1:length(Structure1)

l = length(Structure1(n).cumulativeSum)-14; % This is so I can take the last 14 points
RRP_points = Structure1(n).cumulativeSum(l:length(Structure1(n).cumulativeSum));    % My RRP point
RRP_time = Structure1(n).peaktime(l:length(Structure1(n).cumulativeSum));   % My time points for the RRP

x = [(l-1):39]';    % First point has to be at 0 instead of 1
p = polyfit(x,RRP_points,1);    % Finding the best fit 1st order polynomial (line) to those last 14 points
f = polyval(p,x);   % Needed for plotting the data

slope = p(1);   % value in first indexed position of p is the slope
y_intercept = p(2); % value in second indexed positino of p is the y intercept

Structure1(n).RRP_train = -y_intercept;
Structure1(n).p_train = Structure1(n).cumulativeSum(1) / y_intercept;
end
end

%% Plotting the data - will need to make figure for paper
%{
x1 = [0:39]';
figure; hold on;
plot(x1,Structure1(1).cumulativeSum);
plot(x,f,'--r');
xlim([0 40]); ylim([-10000 0]);
hold off;
%}