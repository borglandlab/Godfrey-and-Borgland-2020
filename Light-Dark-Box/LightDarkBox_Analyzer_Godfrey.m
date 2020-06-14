%{
To use these functions, make sure that all Box table imports have the same
length, all Weight table imports have the same length, and all Statistics
table imports have the same length. To do this, you need to make sure not
to include the notes and # of stools columns in some of the Weight table
imports. Also, make sure that the columns are designated as their
appropriate DateTime, Categorical, or Number.

Uses the following functions:
    EntriestoDark_Godfrey.m
    CreateStrucLDB_Godfrey.m
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
    CreateStrucLDB_2way_Godfrey.m
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
        createLDBstruc_2way_Godfrey.m
            exclusionrem_Godfrey.m
            dividesex_2way_Godfrey.m
    AddRelativePercent_Godfrey.m
    AddRelativePercent_2way_Godfrey.m
    AddVelocitytime_Godfrey.m
    AddVelocitytime_2way_Godfrey.m
    AddVelDif_Godfrey.m
    AddVelDif_2way_Godfrey.m
    export2excel_Godfrey.m
%}

%% Dark and Light Zone Entries
%{
Use this to create a structure containing Dark Zone and Light Zone Entry
information. Specifically number of entries and latency to first entry.
%}

[DarkBoxC_Entry] = EntriestoDark_Godfrey;
[DarkBoxD_Entry] = EntriestoDark_Godfrey;
[DarkBoxE_Entry] = EntriestoDark_Godfrey;
%% Can do everything from start to finish with this function

[Light_Dark_Box] = CreateStrucLDB_Godfrey(StatisticsLightDarkBoxC,WeightC,BoxC,DarkBoxC_Entry,StatisticsLightDarkBoxD,WeightD,BoxD,DarkBoxD_Entry,StatisticsLightDarkBoxE,WeightE,BoxE,DarkBoxE_Entry);
%% Use this to create same structure that will be organized for a two-way anova

[Light_Dark_Box_2way] = CreateStrucLDB_2way_Godfrey(StatisticsLightDarkBoxC,WeightC,BoxC,DarkBoxC_Entry,StatisticsLightDarkBoxD,WeightD,BoxD,DarkBoxD_Entry,StatisticsLightDarkBoxE,WeightE,BoxE,DarkBoxE_Entry);
%% Adding tables to structure
%{
Adding 3 new tables to my structures, 1. Sum of Moving and Not Moving in
Zone, 2. Relative Percent of Moving in Zone, 3. Relative Percent of Not
Moving in Zone
%}
[Light_Dark_Box] = AddRelativePercent_Godfrey(Light_Dark_Box);

% for the data that will be used in the 2 way ANOVA
[Light_Dark_Box_2way] = AddRelativePercent_2way_Godfrey(Light_Dark_Box_2way);

% Adding table of total velocity over time to the Food Zone and the Light -
% Food Zone
[Light_Dark_Box] = AddVelocitytime_Godfrey(Light_Dark_Box);

[Light_Dark_Box_2way] = AddVelocitytime_2way_Godfrey(Light_Dark_Box_2way);

% Adding tables containing the difference in totalvelociy/time and the
% difference of relative percent moving and not moving. Stored in the Light
% - Food Zone
[Light_Dark_Box] = AddVelDif_Godfrey(Light_Dark_Box);
[Light_Dark_Box_2way] = AddVelDif_2way_Godfrey(Light_Dark_Box_2way);

%% Exporting to excel
%{
Exporting tables within these last 2 structures to excel Each name within
my structure will be it's own excel file. Each table within my structure
within my structure will be a Sheet of it's own.
%}
export2excel_Godfrey(Light_Dark_Box,Light_Dark_Box_2way);