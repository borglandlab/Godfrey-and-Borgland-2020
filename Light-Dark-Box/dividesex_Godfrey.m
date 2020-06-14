function [R] = dividesex_Godfrey(T)

%{
For the table 'Weight' this will create new tables that Male Control, Male
Fasted, Female Control, and Female Fasted.

Used in the function createLDBstruc_Godfrey.m
%}

a = {'Male';'Female'};
b = categorical(a);
c = {'Control';'Fasted'};
d = categorical(c);

% Deleting all rows that aren't 'Male'
T_Male = T;
toDelete = T_Male.Sex ~= b(1);
T_Male(toDelete,:) = [];

% Deleting all rows that aren't 'Female'

T_Female = T;
toDelete = T_Female.Sex ~= b(2);
T_Female(toDelete,:) = [];

% Within the Males
% Deleting all rows that aren't 'Control'
T_Male_Control = T_Male;
toDelete = T_Male_Control.Treatment ~= d(1);
T_Male_Control(toDelete,:) = [];

% Deleting all rows that aren't 'Fasted'
T_Male_Fasted = T_Male;
toDelete = T_Male_Fasted.Treatment ~= d(2);
T_Male_Fasted(toDelete,:) = [];
% Adding 1 row of NaN to the bottom
w = size(T_Male_Fasted);
blank_row = [NaN(w(2))]; blank_row = blank_row(1,:);
T_blank_row = array2table(blank_row);
T_blank_row.Properties.VariableNames(1:end) = T_Male_Fasted.Properties.VariableNames(1:end);
T_blank_row.Date = datetime(missing);
T_blank_row.Mouse = categorical(T_blank_row.Mouse);
T_blank_row.Sex = categorical(T_blank_row.Sex);
T_blank_row.Treatment = categorical(T_blank_row.Treatment);
T_blank_row.Trial = categorical(T_blank_row.Trial);
T_blank_row.Zone = categorical(T_blank_row.Zone);
T_Male_Fasted = [T_Male_Fasted; T_blank_row];


% Within the Females
% Deleting all rows that aren't 'Control'
T_Female_Control = T_Female;
toDelete = T_Female_Control.Treatment ~= d(1);
T_Female_Control(toDelete,:) = [];

% Deleting all rows that aren't 'Fasted'
T_Female_Fasted = T_Female;
toDelete = T_Female_Fasted.Treatment ~= d(2);
T_Female_Fasted(toDelete,:) = [];
T_Female_Fasted = [T_Female_Fasted; T_blank_row];

% Create a structure containing each variable separately
z = size(T); % I want to use the 2 index for size
for n = 7:z(2);
    R(n-6).name = T(:,n).Properties.VariableNames;
end

for n = 7:z(2);
    
    T_Male_Control1 = T_Male_Control;
    T_Male_Fasted1 = T_Male_Fasted;
    T_Female_Control1 = T_Female_Control;
    T_Female_Fasted1 = T_Female_Fasted;
    
    T_Male_Control1.Properties.VariableNames(n) = {'MaleControl'};
    T_Male_Fasted1.Properties.VariableNames(n) = {'MaleFasted'};
    T_Female_Control1.Properties.VariableNames(n) = {'FemaleControl'};
    T_Female_Fasted1.Properties.VariableNames(n) = {'FemaleFasted'};
    
  
    R(n-6).table = [T_Male_Control1(:,n) T_Male_Fasted1(:,n) T_Female_Control1(:,n) T_Female_Fasted1(:,n)];
end
end