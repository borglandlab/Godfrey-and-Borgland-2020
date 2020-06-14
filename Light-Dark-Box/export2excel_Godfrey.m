function export2excel_Godfrey(S,S_2way)
%{
Exporting data into an excel file
S = Light_Dark_Box, S_2way - Light_Dark_Box_2way

Used in the script LightDarkBox_Analyzer_Godfrey.m
%}
%%
% these first 4 are for Light_Dark_Box

for n = 1:length(S(1).structure);
    c = char(S(1).structure(n).name);
    % The purpose of this next if statement is because the function
    % writetable will only allow for Sheet names up to 31 characters, but
    % some of my structure names are longer than that, so this takes the
    % first 15 and last 15 and chops out the middle. That way I get a Sheet
    % name that is short enough, but can still tell what each Sheet is
    % refering to.
    if length(c) > 31;
        length(c(end-15))
        i = [1:15, (length(c)-15:length(c))];
        c = c(i);
    end 
writetable(S(1).structure(1).table,'Light_Dark_Box_InFoodZone.xlsx','Sheet',[c],'Range','A1');
end

for n = 1:length(S(2).structure);
        c = char(S(2).structure(n).name);
    if length(c) > 31;
        length(c(end-15))
        i = [1:15, (length(c)-15:length(c))];
        c = c(i);
    end 
writetable(S(2).structure(n).table,'Light_Dark_Box_InLightSide.xlsx','Sheet',[c],'Range','A1');
end

for n = 1:length(S(3).structure);
        c = char(S(3).structure(n).name);
    if length(c) > 31;
        length(c(end-15))
        i = [1:15, (length(c)-15:length(c))];
        c = c(i);
    end 
writetable(S(3).structure(n).table,'Light_Dark_Box_Difference.xlsx','Sheet',[c],'Range','A1');
end

for n = 1:length(S(4).structure);
        c = char(S(4).structure(n).name);
    if length(c) > 31;
        length(c(end-15))
        i = [1:15, (length(c)-15:length(c))];
        c = c(i);
    end 
writetable(S(4).structure(n).table,'Light_Dark_Box_Weight.xlsx','Sheet',[c],'Range','A1');
end
%%
% these first 4 are for Light_Dark_Box_2way
% Supposed to make it easier for me to copy and paste into GraphPad Prism
% based on the format of how I typically do my 2 way ANOVAs

for n = 1:length(S_2way(1).structure);
        c = char(S_2way(1).structure(n).name);
    if length(c) > 31;
        length(c(end-15))
        i = [1:15, (length(c)-15:length(c))];
        c = c(i);
    end 
writetable(S_2way(1).structure(n).table,'Light_Dark_Box(2way)_InFoodZone.xlsx','Sheet',[c],'Range','A1');
end

for n = 1:length(S_2way(2).structure);
        c = char(S_2way(2).structure(n).name);
    if length(c) > 31;
        length(c(end-15))
        i = [1:15, (length(c)-15:length(c))];
        c = c(i);
    end
writetable(S_2way(2).structure(n).table,'Light_Dark_Box(2way)_InLightSide.xlsx','Sheet',[c],'Range','A1');
end

for n = 1:length(S_2way(3).structure);
        c = char(S_2way(3).structure(n).name);
    if length(c) > 31;
        length(c(end-15))
        i = [1:15, (length(c)-15:length(c))];
        c = c(i);
    end
writetable(S_2way(3).structure(n).table,'Light_Dark_Box(2way)_Difference.xlsx','Sheet',[c],'Range','A1');
end

for n = 1:length(S_2way(4).structure);
        c = char(S_2way(4).structure(n).name);
    if length(c) > 31;
        length(c(end-15))
        i = [1:15, (length(c)-15:length(c))];
        c = c(i);
    end
writetable(S_2way(4).structure(n).table,'Light_Dark_Box(2way)_Weight.xlsx','Sheet',[c],'Range','A1');
end
end
