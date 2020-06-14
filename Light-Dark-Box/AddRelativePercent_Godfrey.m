function [S] = AddRelativePercent_Godfrey(S)

%{
For creating table that shows the relative percentage within both the Food
Zone, and the Light - Food Zone.

Used in the script LightDarkBox_Analyzer_Godfrey.m
%}

% Food Zone

S(1).structure(29).name = 'SumofMovingandNotMoving';
s = size(table2array(S(1).structure(8).table));
for n = 1:s(2);
    for m = 1:s(1);
        S(1).structure(29).table(m,n) = table2array(S(1).structure(8).table(m,n)) + table2array(S(1).structure(13).table(m,n));
    end 
end
S(1).structure(29).table = array2table(S(1).structure(29).table);
S(1).structure(29).table.Properties.VariableNames(1:4) = {'MaleControl','MaleFasted','FemaleControl','FemaleFasted'};

S(1).structure(30).name = 'RelativePercentMoving';
s = size(table2array(S(1).structure(8).table));
for n = 1:s(2);
    for m = 1:s(1);
        S(1).structure(30).table(m,n) = ((table2array(S(1).structure(8).table(m,n))) / (table2array(S(1).structure(29).table(m,n)))).*100;
    end 
end
S(1).structure(30).table = array2table(S(1).structure(30).table);
S(1).structure(30).table.Properties.VariableNames(1:4) = {'MaleControl','MaleFasted','FemaleControl','FemaleFasted'};

S(1).structure(31).name = 'RelativePercentNotMoving';
s = size(table2array(S(1).structure(8).table));
for n = 1:s(2);
    for m = 1:s(1);
        S(1).structure(31).table(m,n) = ((table2array(S(1).structure(13).table(m,n))) / (table2array(S(1).structure(29).table(m,n)))).*100;
    end 
end
S(1).structure(31).table = array2table(S(1).structure(31).table);
S(1).structure(31).table.Properties.VariableNames(1:4) = {'MaleControl','MaleFasted','FemaleControl','FemaleFasted'};


% Light - Food Zone

S(3).structure(16).name = 'SumofMovingandNotMoving';
s = size(table2array(S(3).structure(4).table));
for n = 1:s(2);
    for m = 1:s(1);
        S(3).structure(16).table(m,n) = table2array(S(3).structure(4).table(m,n)) + table2array(S(3).structure(7).table(m,n));
    end 
end
S(3).structure(16).table = array2table(S(3).structure(16).table);
S(3).structure(16).table.Properties.VariableNames(1:4) = {'MaleControl','MaleFasted','FemaleControl','FemaleFasted'};

S(3).structure(17).name = 'RelativePercentMoving';
s = size(table2array(S(1).structure(4).table));
for n = 1:s(2);
    for m = 1:s(1);
        S(3).structure(17).table(m,n) = ((table2array(S(3).structure(4).table(m,n))) / (table2array(S(3).structure(16).table(m,n)))).*100;
    end 
end
S(3).structure(17).table = array2table(S(3).structure(17).table);
S(3).structure(17).table.Properties.VariableNames(1:4) = {'MaleControl','MaleFasted','FemaleControl','FemaleFasted'};

S(3).structure(18).name = 'RelativePercentNotMoving';
s = size(table2array(S(3).structure(4).table));
for n = 1:s(2);
    for m = 1:s(1);
        S(3).structure(18).table(m,n) = ((table2array(S(3).structure(7).table(m,n))) / (table2array(S(3).structure(16).table(m,n)))).*100;
    end 
end
S(3).structure(18).table = array2table(S(3).structure(18).table);
S(3).structure(18).table.Properties.VariableNames(1:4) = {'MaleControl','MaleFasted','FemaleControl','FemaleFasted'};
end