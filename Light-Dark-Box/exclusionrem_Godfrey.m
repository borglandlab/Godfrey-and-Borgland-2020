function [T2] = exclusionrem_Godfrey(T1);

%{
This function will remove any exlcusions from the table.

Used in the function createLDBstruc_Godfrey.m
%}

T2 = T1;

e = [24 36 37 39 40 44 45 46 48 49];

e = categorical(e);


toDelete = T2.Mouse == e(1) | T2.Mouse = e(2) | T2.Mouse = e(3) | T2.Mouse == e(4) | T2.Mouse == e(5) | T2.Mouse == e(6) | T2.Mouse == e(7) | T2.Mouse == e(8) | T2.Mouse == e(9) | T2.Mouse == e(10);

T2(toDelete,:) = [];
end