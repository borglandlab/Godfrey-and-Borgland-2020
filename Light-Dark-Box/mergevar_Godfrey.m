function [T] = mergevar_Godfrey(T1,T7,T2,T5)
%{
T1 is the table with the data from Noldus, T2 is the table with the weights
at 6PM and 10AM, and T4 is the table with the SHF measurements 0hr, 1hr,
and 2hr after the Light-Dark Box Test.

Used in the function IndxC/D/E_Godfrey.m
%}

% T1 is for T_LightC/D/E or T_FoodC/D/E
Date = T2.Date;
T3 = T2(:,5:end);

T4 = addvars(T1,Date,'Before', 'Mouse');

% T5 is for BoxC, BoxD, or BoxE.
T6 = T5(:,5:end);

T = [T4 T7 T3 T6];
end
