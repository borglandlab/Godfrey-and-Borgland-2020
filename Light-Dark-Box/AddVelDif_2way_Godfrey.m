function [S] = AddVelDif_2way_Godfrey(S)

%{
For creating table that shows the relative percentage within both the Food
Zone, and the Light - Food Zone.

Used in the script LightDarkBox_Analyzer_Godfrey.m
%}

% Light - Food Zone

% For Moving
S(3).structure(20).name = 'DifferenceofMovement';
s = size(table2array(S(3).structure(17).table));
for n = 1:s(2);
    for m = 1:s(1);
        S(3).structure(20).table(m,n) = table2array(S(3).structure(17).table(m,n)) - table2array(S(1).structure(30).table(m,n));
    end 
end
S(3).structure(20).table = array2table(S(3).structure(20).table);
S(3).structure(20).table.Properties.VariableNames(1:4) = {'MaleControl','FemaleControl','MaleFasted','FemaleFasted'};


% For not Moving
S(3).structure(21).name = 'DifferenceofNonMovement';
s = size(table2array(S(3).structure(18).table));
for n = 1:s(2);
    for m = 1:s(1);
        S(3).structure(21).table(m,n) = table2array(S(3).structure(18).table(m,n)) - table2array(S(1).structure(31).table(m,n));
    end 
end
S(3).structure(21).table = array2table(S(3).structure(21).table);
S(3).structure(21).table.Properties.VariableNames(1:4) = {'MaleControl','FemaleControl','MaleFasted','FemaleFasted'};


% For Velocity/time
S(3).structure(22).name = 'DifferenceofVelocity';
s = size(table2array(S(3).structure(19).table));
for n = 1:s(2);
    for m = 1:s(1);
        S(3).structure(22).table(m,n) = table2array(S(3).structure(19).table(m,n)) - table2array(S(1).structure(32).table(m,n));
    end 
end
S(3).structure(22).table = array2table(S(3).structure(22).table);
S(3).structure(22).table.Properties.VariableNames(1:4) = {'MaleControl','FemaleControl','MaleFasted','FemaleFasted'};
end