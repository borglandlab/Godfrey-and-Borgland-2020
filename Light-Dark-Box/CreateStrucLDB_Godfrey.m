function [Light_Dark_Box] = CreateStrucLDB_Godfrey(S1,WeightC,BoxC,DarkBoxC_Entry,S2,WeightD,BoxD,DarkBoxD_Entry,S3,WeightE,BoxE,DarkBoxE_Entry)
%{
For this function to work   S1 = StatisticsLightDarkBoxC
                            S2 = StatisticsLightDarkBoxD
                            S3 = StatisticsLightDarkBoxE
These are all tables that are either from the Noldus software, created in
MatLab, or from an imported excel file (weights of mice and food).

Used in the script LightDarkBox_Analyzer_Godfrey.m
Uses the following functions:
    IndxC_Godfrey.m
        TableMaker_Godfrey.m
            AddVariable_Godfrey.m
        mergevar_Godfrey.m
    IndxD_Godfrey.m
        TableMaker_Godfrey.m
            AddVariable_Godfrey.m
        mergevar_Godfrey.m
    IndxE_Godfrey.m
        TableMaker_Godfrey.m
            AddVariable_Godfrey.m
        mergevar_Godfrey.m
    calculatevar_Godfrey.m
    createLDBstruc_Godfrey.m
        exclusionrem_Godfrey.m
        dividesex_Godfrey.m
%}

% Have to convert the Entries into tables from structures
DarkBoxC_Entry = struct2table(DarkBoxC_Entry);
DarkBoxC_Entry = DarkBoxC_Entry(:,5:end);

DarkBoxD_Entry = struct2table(DarkBoxD_Entry);
DarkBoxD_Entry = DarkBoxD_Entry(:,5:end);

DarkBoxE_Entry = struct2table(DarkBoxE_Entry);
DarkBoxE_Entry = DarkBoxE_Entry(:,5:end);

% This will add 'Male' and 'Female' and 'Fasted' and 'Control' Variables
[T_LightC,T_FoodC,WeightC,BoxC] = IndxC_Godfrey(S1,WeightC,BoxC,DarkBoxC_Entry);

[T_LightD,T_FoodD,WeightD,BoxD] = IndxD_Godfrey(S2,WeightD,BoxD,DarkBoxD_Entry);

[T_LightE,T_FoodE,WeightE,BoxE] = IndxE_Godfrey(S3,WeightE,BoxE,DarkBoxE_Entry);

T_Food = [T_FoodC; T_FoodD; T_FoodE];
T_Light = [T_LightC; T_LightD; T_LightE];

%{
Creating and adding calculated variables for mice, and creating a new table
with the subtracted difference between T_Light and T_Food for specified
variables.
%}
[T_Light_Complete,T_Food_Complete,T_Difference_Complete,T_Weight_Complete] = calculatevar_Godfrey(T_Light,T_Food);

% This function will also create exclusions
[Light_Dark_Box] = createLDBstruc_Godfrey(T_Food_Complete,T_Light_Complete,T_Difference_Complete,T_Weight_Complete);
end