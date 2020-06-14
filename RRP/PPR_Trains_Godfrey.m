function [Structure1] = PPR_Trains_Godfrey(Structure1);

%{
This is a very simple function that calculates the paired-pulse ratio (PPR)
from the 40 pulse 100 Hz train stimulation. Divides the second pulse of the
train stimulation by the first pulse.

This function is used in the following script:
Analyze_Trains_Godfrey.m
%}

for n = 1:length(Structure1);
    Structure1(n).PPR = Structure1(n).peaks(2) / Structure1(n).peaks(1);
end
end

