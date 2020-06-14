function [S] = AddVelocitytime_2way_Godfrey(S)

%{
For creating table that shows the relative percentage within both the Food
Zone, and the Light - Food Zone.

Used in the script LightDarkBox_Analyzer_Godfrey.m
%}

% Food Zone

S(1).structure(32).name = 'TotalVelocityoverTime';
s = size(table2array(S(1).structure(4).table));
for n = 1:s(2);
    for m = 1:s(1);
        S(1).structure(32).table(m,n) = table2array(S(1).structure(4).table(m,n)) / table2array(S(1).structure(23).table(m,n));
    end 
end
S(1).structure(32).table = array2table(S(1).structure(32).table);
S(1).structure(32).table.Properties.VariableNames(1:4) = {'MaleControl','FemaleControl','MaleFasted','FemaleFasted'};


% Light - Food Zone

S(3).structure(19).name = 'TotalVelocityoverTime';
s = size(table2array(S(3).structure(2).table));
for n = 1:s(2);
    for m = 1:s(1);
        S(3).structure(19).table(m,n) = table2array(S(3).structure(2).table(m,n)) / table2array(S(3).structure(12).table(m,n));
    end 
end
S(3).structure(19).table = array2table(S(3).structure(19).table);
S(3).structure(19).table.Properties.VariableNames(1:4) = {'MaleControl','FemaleControl','MaleFasted','FemaleFasted'};
end