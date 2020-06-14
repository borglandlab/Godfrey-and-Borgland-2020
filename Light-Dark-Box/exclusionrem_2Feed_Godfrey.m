function [T2] = exclusionrem_2Feed_Godfrey(T1);

%{
Used in the script FoodZoneEntry_Godfrey.m
%}

T2 = T1;
for e = [49 48 46 45 44 40 39 37 36 24];
    T2(e) = [];
end
end