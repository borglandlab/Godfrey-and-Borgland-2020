function [T4] = AddVariable_Godfrey(T1,MouseIndx,MaleIndx,FemaleIndx,ControlIndx,FastedIndx)

%{
Used in the function TableMaker_Godfrey.m
%}

% Creating a categorical array of 'Mouse' based on the indexing provided
Mouse = MouseIndx;
Mouse = Mouse';
Mouse = categorical(Mouse);

% Creating a categorical array of 'Male' and 'Female' based on the indexing
% provided
s = size(T1(:,1));
Sex = NaN(s(1),1);
Sex = num2str(Sex);
Sex = {Sex};
Sex(MaleIndx) = {'Male'};
Sex(FemaleIndx) = {'Female'};
Sex = Sex';
Sex = categorical(Sex);

% Creating a categorical array of 'Control' and 'Fasted' based on the
% indexing that was provided
Treatment = NaN(s(1),1);
Treatment = num2str(Treatment);
Treatment = {Treatment};
Treatment(ControlIndx) = {'Control'};
Treatment(FastedIndx) = {'Fasted'};
Treatment = Treatment';
Treatment = categorical(Treatment);

% Adding variables to the table using the 3 categorical arrays that I
% created
T2 = addvars(T1,Mouse,'Before', 'Trial');
T3 = addvars(T2,Sex,'Before', 'Trial');
T4 = addvars(T3,Treatment,'Before', 'Trial');
end
