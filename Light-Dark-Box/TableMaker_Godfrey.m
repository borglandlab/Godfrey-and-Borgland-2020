function [T_Light, T_Food] = TableMaker_Godfrey(T1,MouseIndx,MaleIndx,FemaleIndx,ControlIndx,FastedIndx)
%{
Removes the first variable, 'Result 2', which is in every table that I
imported and is meaninless for my analysis. It's because of the way that
the Noldus software organizes data. Technically I could get 'Result 1',
and other numbers, but I only used 'Result 2'.

Used in the function IndxC/D/E_Godfrey.m
Uses the function AddVariable_Godfrey.m
%}
T2 = T1(:,2:end);

% Renaming the first two variables 'Trial' and 'Zone'
T2.Properties.VariableNames(1:2) = {'Trial','Zone'};

% Creating table of 'In Light Zone'
Array_Light1 = T2.Zone == 'For center-point in Light';
T_Light1 = T2(Array_Light1, :);

% Creating table of 'In 9X9 Food Zone'
Array_Food1 = T2.Zone == 'For center-point in 9X9 Food Zone';
T_Food1 = T2(Array_Food1, :);

% Calling function AddVars to add Mouse, Sex, and Treatment based off of
% indexing provided
[T_Light] = AddVariable_Godfrey(T_Light1,MouseIndx,MaleIndx,FemaleIndx,ControlIndx,FastedIndx);
[T_Food] = AddVariable_Godfrey(T_Food1,MouseIndx,MaleIndx,FemaleIndx,ControlIndx,FastedIndx);
end
