function [T_LightE,T_FoodE,WeightE,BoxE] = IndxE_Godfrey(T1,WeightE,BoxE,DarkBoxE_Entry)

%{
No prepration for StatisticsLightDarkBoxE needed, but for some reason there
is a "Dark Zone" for Trial 17, but that will be removed before any indexing
is used.
T1 must be StatisticsLightDarkBoxE;

Used in the function CreateStrucLDB_Godfrey.m
Uses the following functions:
    TableMaker_Godfrey.m
        AddVariable_Godfrey.m
    mergevar_Godfrey.m
%}

% For StatisticsLightDarkBoxE
MouseIndx = 37:52;
MaleIndx = 9:16;
FemaleIndx = 1:8;
ControlIndx = 1:2:16;
FastedIndx = 2:2:16;

[T_LightE, T_FoodE] = TableMaker_Godfrey(T1,MouseIndx,MaleIndx,FemaleIndx,ControlIndx,FastedIndx);
[T_LightE] = mergevar_Godfrey(T_LightE,DarkBoxE_Entry,WeightE,BoxE);
[T_FoodE] = mergevar_Godfrey(T_FoodE,DarkBoxE_Entry,WeightE,BoxE);
end
