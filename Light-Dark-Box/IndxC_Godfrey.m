function [T_LightC,T_FoodC,WeightC,BoxC] = IndxC_Godfrey(T1,WeightC,BoxC,DarkBoxC_Entry);

%{
Preparation for StatisticsLightDarkBoxC needed
T1 must be StatisticsLightDarkBoxC;

Used in the function CreateStrucLDB_Godfrey.m
Uses the following functions:
    TableMaker_Godfrey.m
        AddVariable_Godfrey.m
    mergevar_Godfrey.m
%}

% Preparation of StatisticsLightDarkBoxC
T1 = T1(2:end,:); % This is specifically because the first trial wasn't a mouse on this day
DarkBoxC_Entry = DarkBoxC_Entry(2:end,:); % Same reason

% Indexing for StatisticsLightDarkBoxC
MouseIndx = 1:20;
MaleIndx = [1 2 3 4 5 6 13 14 17 18];
FemaleIndx = [7 8 9 10 11 12 15 16 19 20];
ControlIndx = [1 3 5 7 9 11 13 16 17 19];
FastedIndx = [2 4 6 8 10 12 14 15 18 20];

[T_LightC, T_FoodC] = TableMaker_Godfrey(T1,MouseIndx,MaleIndx,FemaleIndx,ControlIndx,FastedIndx);
[T_LightC] = mergevar_Godfrey(T_LightC,DarkBoxC_Entry,WeightC,BoxC);
[T_FoodC] = mergevar_Godfrey(T_FoodC,DarkBoxC_Entry,WeightC,BoxC);
end
