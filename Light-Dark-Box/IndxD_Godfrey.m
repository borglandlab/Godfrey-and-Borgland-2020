function [T_LightD,T_FoodD,WeightD,BoxD] = IndxD_Godfrey(T1,WeightD,BoxD,DarkBoxD_Entry)

%{
No prreparation of StatisticsLightDarkBoxD needed
T1 must be StatisticsLightDarkBoxD;

Used in the function CreateStrucLDB_Godfrey.m
Uses the following functions:
    TableMaker_Godfrey.m
        AddVariable_Godfrey.m
    mergevar_Godfrey.m
%}

% Indexing for StatisticsLightDarkBoxD
MouseIndx = 21:36;
MaleIndx = 9:16;
FemaleIndx = 1:8;
ControlIndx = 1:2:16;
FastedIndx = 2:2:16;

[T_LightD, T_FoodD] = TableMaker_Godfrey(T1,MouseIndx,MaleIndx,FemaleIndx,ControlIndx,FastedIndx);
[T_LightD] = mergevar_Godfrey(T_LightD,DarkBoxD_Entry,WeightD,BoxD);
[T_FoodD] = mergevar_Godfrey(T_FoodD,DarkBoxD_Entry,WeightD,BoxD);
end
