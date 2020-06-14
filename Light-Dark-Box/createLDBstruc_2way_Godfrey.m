function [Light_Dark_Box] = createLDBstruc_2way_Godfrey(T_Food_Complete,T_Light_Complete,T_Difference_Complete,T_Weight_Complete)

%{
Removing mice that were exclded for various reasons. Total of 10 mice in
Fasted groups and 11 mice in Control groups.

Used in the script LightDarkBox_Analyzer_Godfrey.m
Uses the following functions:
    exclusionrem_Godfrey.m
    dividesex_2way_Godfrey.m
%}
[T_Light_Exclusions] = exclusionrem_Godfrey(T_Light_Complete);
[T_Food_Exclusions] = exclusionrem_Godfrey(T_Food_Complete);
[T_Difference_Exclusions] = exclusionrem_Godfrey(T_Difference_Complete);
[T_Weight_Exclusions] = exclusionrem_Godfrey(T_Weight_Complete);

%{
This creates a structure Light_Dark_Box with all the data neatly organized
in tables of Male Control, Male Fasted, Female Control, Female Fasted for
category that I measured/recorded.
%}
[F] = dividesex_2way_Godfrey(T_Food_Exclusions);
[L] = dividesex_2way_Godfrey(T_Light_Exclusions);
[D] = dividesex_2way_Godfrey(T_Difference_Exclusions);
[W] = dividesex_2way_Godfrey(T_Weight_Exclusions);

Light_Dark_Box(1).name = 'In Food Zone';
Light_Dark_Box(1).structure = F;
Light_Dark_Box(2).name = 'In Light Side';
Light_Dark_Box(2).structure = L;
Light_Dark_Box(3).name = 'Light Side - Food Zone';
Light_Dark_Box(3).structure = D;
Light_Dark_Box(4).name = 'Weight Changes of mice and SHF'
Light_Dark_Box(4).structure = W;