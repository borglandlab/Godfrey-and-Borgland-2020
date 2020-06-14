function [T_Light,T_Food,T_Difference,T_Weight] = calculatevar_Godfrey(T1,T2)
%{
Calculating and adding changes in weight for mouse data from T1.
T1 = T_Light.

Used in the function CreateStrucLDB_Godfrey.m
%}

Mouse10AM_diff =  T1.Mouse10AM - T1.Mouse6PM;
Mouse10AM_percent = (Mouse10AM_diff./T1.Mouse6PM)*100;
Chow10AM_diff = T1.Chow6PM - T1.Chow10AM;
Chow10AM_gkg = Chow10AM_diff./(T1.Mouse6PM./1000);
Water10AM_diff = T1.Water6PM - T1.Water10AM;
Water10AM_gkg = Water10AM_diff./(T1.Mouse6PM./1000);
T3 = addvars(T1,Mouse10AM_diff,Mouse10AM_percent,Chow10AM_diff,Chow10AM_gkg,Water10AM_diff,Water10AM_gkg,'Before','BeforeSHF');

DiffSHF = T1.BeforeSHF - T1.AfterSHF;
DiffSHF_gkg = DiffSHF./(T1.Mouse10AM./1000);
T3 = addvars(T3,DiffSHF,DiffSHF_gkg,'Before','Mouse0hr');

ChangeMouse1hr = T1.Mouse1hr - T1.Mouse0hr;
ChangeMouse1hr_percent = (ChangeMouse1hr./T1.Mouse0hr)*100;
ChangeWater1hr = T1.Water0hr - T1.Water1hr;
ChangeWater1hr_gkg = ChangeWater1hr./(T1.Mouse0hr./1000);
ChangeSHF1hr = T1.SHF0hr - T1.SHF1hr;
ChangeSHF1hr_gkg = ChangeSHF1hr./(T1.Mouse0hr./1000);
T3 = addvars(T3,ChangeMouse1hr,ChangeMouse1hr_percent,ChangeWater1hr,ChangeWater1hr_gkg,ChangeSHF1hr,ChangeSHF1hr_gkg,ChangeSHF1hr_gkg,'Before','SHF2hr');

ChangeSHF2ndhr = T1.SHF1hr - T1.SHF2hr;
ChangeSHF2ndhr_gkg = ChangeSHF2ndhr./(T1.Mouse1hr./1000);
ChangeSHF2hr = T1.SHF0hr - T1.SHF2hr;
ChangeSHF2hr_gkg = ChangeSHF2hr./(T1.Mouse0hr./1000);
T3 = addvars(T3,ChangeSHF2ndhr,ChangeSHF2ndhr_gkg,ChangeSHF2hr,ChangeSHF2hr_gkg);
%%
%{
Calculating and adding changes in weight for mouse data from T2.
T2 = T_Food.
%}

Mouse10AM_diff =  T2.Mouse10AM - T2.Mouse6PM;
Mouse10AM_percent = (Mouse10AM_diff./T2.Mouse6PM)*100;
Chow10AM_diff = T2.Chow6PM - T2.Chow10AM;
Chow10AM_gkg = Chow10AM_diff./(T2.Mouse6PM/1000);
Water10AM_diff = T2.Water6PM - T2.Water10AM;
Water10AM_gkg = Water10AM_diff./(T2.Mouse6PM/1000);
T4 = addvars(T2,Mouse10AM_diff,Mouse10AM_percent,Chow10AM_diff,Chow10AM_gkg,Water10AM_diff,Water10AM_gkg,'Before','BeforeSHF');

DiffSHF = T2.BeforeSHF - T2.AfterSHF;
DiffSHF_gkg = DiffSHF./(T2.Mouse10AM/1000);
T4 = addvars(T4,DiffSHF,DiffSHF_gkg,'Before','Mouse0hr');

ChangeMouse1hr = T2.Mouse1hr - T2.Mouse0hr;
ChangeMouse1hr_percent = (ChangeMouse1hr./T2.Mouse0hr)*100;
ChangeWater1hr = T2.Water0hr - T2.Water1hr;
ChangeWater1hr_gkg = ChangeWater1hr./(T2.Mouse0hr./1000);
ChangeSHF1hr = T2.SHF0hr - T2.SHF1hr;
ChangeSHF1hr_gkg = ChangeSHF1hr./(T2.Mouse0hr/1000);
T4 = addvars(T4,ChangeMouse1hr,ChangeMouse1hr_percent,ChangeWater1hr,ChangeWater1hr_gkg,ChangeSHF1hr,ChangeSHF1hr_gkg,ChangeSHF1hr_gkg,'Before','SHF2hr');

ChangeSHF2ndhr = T2.SHF1hr - T2.SHF2hr;
ChangeSHF2ndhr_gkg = ChangeSHF2ndhr./(T2.Mouse1hr./1000);
ChangeSHF2hr = T2.SHF0hr - T2.SHF2hr;
ChangeSHF2hr_gkg = ChangeSHF2hr./(T2.Mouse0hr./1000);
T4 = addvars(T4,ChangeSHF2ndhr,ChangeSHF2ndhr_gkg,ChangeSHF2hr,ChangeSHF2hr_gkg);
%%
%{
This creates a table called T_Difference of the absolute value of
T_Light - T_Food.

Creating an index for the above variables from T_Light or T_Food
D = [7 12 13 14 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31];
Chop these out because variables 13 - 17 just end up equalling 0. They are
obviously the same value in each Table.
%}
D = [7 10 13 14 15 18 19 20 21 22 23 24 25 31 32];

A = [];
for n = D
B = T1(:,n).Properties.VariableNames;
A = [A B];
end

%{
Creating an array T that is the absolute value T_Light - T_Food for the
indexed variables.
%}
T = [];
for w = D;
    X = T1{:,w} - T2{:,w};
    Y = abs(X);
    T = [T Y];
end

%{
Converting the array T to a table called T_Difference and then adding the
variable names according to A.
%}
T_Difference = array2table(T);
x = 1:length(A);
T_Difference.Properties.VariableNames(x) = A(x);
T_Difference = [T1(:,1:6) T_Difference];
a = size(T1(:,6));
b = {'For Light Zone - Food Zone'};
c = [];
for n = 1:a(1); 
c = [c, b];
end
c = c';
c = categorical(c);
T_Difference.Zone = c;

%%
%{
To create 4 different tables:
T_Different, T_Food, T_Light, and T_Weight
%}
T_Difference;

T_Food = T4(:,1:34);

T_Light = T3(:,1:34);

T_Weight = [T3(:,1:6) T3(:,35:end)];
end