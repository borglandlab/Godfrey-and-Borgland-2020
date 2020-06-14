%{
Use this script to add a column for food zone entries and exits to the
Box_Complete table. This will be necessary for creating the behavioural
raster plot. Need DarkBoxC, DarkBoxD, and DarkBoxE. This raw data was
collected using the Noldus software.

Uses the function exclusionrem_2Feed_Godfrey.m
%}
%% For analysis of DarkBoxC

Length = length(DarkBoxC); 
for  m = 1:Length;
Table1 = DarkBoxC(m).Table;

% Pulling data out of the table
FoodZone = table2array(Table1(:,18));
Time = table2array(Table1(:,2));
Increment = Time(2,1) - Time(1,1);

% Creating a vector containing the times of food zone entries
BoxC(m).FoodZoneEntry = [];
l = length(FoodZone);
for n = 2:l
    if FoodZone(n) == 1 && FoodZone(n-1) == 0
        a = Time(n);
    else a = [];
    end
    BoxC(m).FoodZoneEntry = [BoxC(m).FoodZoneEntry;a];
end

% Creating a vector containing the times of the food zone exits
BoxC(m).FoodZoneExit = [];
l = length(FoodZone);
for n = 2:l
    if FoodZone(n) == 0 && FoodZone(n-1) == 1
        a = Time(n);
    else a = [];
    end
    BoxC(m).FoodZoneExit = [BoxC(m).FoodZoneExit;a];
end

%{
Use these 2 if statements to fix when the lengths of food zone entries or
exits are not equal. This is the result of the recording either starting
or stopping while the mouse is in the food zone.
%}
%First fix the food zone entries
if length(BoxC(m).FoodZoneEntry) < length(BoxC(m).FoodZoneExit)
    BoxC(m).FoodZoneEntry(2:length(BoxC(m).FoodZoneEntry) + 1) = BoxC(m).FoodZoneEntry(1:length(BoxC(m).FoodZoneEntry));
    BoxC(m).FoodZoneEntry(1) = 0;
end
% Second fix the food zone exits
if length(BoxC(m).FoodZoneEntry) > length(BoxC(m).FoodZoneExit)
    BoxC(m).FoodZoneExit(length(BoxC(m).FoodZoneExit) + 1) = 600;
end
end

%{
I need to fix number 7. The recording must have started and stopped while
the mouse was in the Food Zone. My fixes above didn't work because they're
the same length. I can fix this by adding 0 to the beginning of Food Zone
Entries and 600 to the end of Food Zone Exits.
%}
BoxC(7).FoodZoneEntry(2:length(BoxC(7).FoodZoneEntry) + 1) = BoxC(7).FoodZoneEntry(1:length(BoxC(7).FoodZoneEntry));
BoxC(7).FoodZoneEntry(1) = 0;
BoxC(7).FoodZoneExit(length(BoxC(7).FoodZoneExit) + 1) = 600;

for  m = 1:Length
    %{
    Use this to calculate the amount of time that the mouse was in the
    Food Zone
    %}
    % First are the individual times for each time the mouse entered
    BoxC(m).FoodZoneTime = [];
    l = length(BoxC(m).FoodZoneExit);
    for n = 1:l
        BoxC(m).FoodZoneTime(n) = BoxC(m).FoodZoneExit(n) - BoxC(m).FoodZoneEntry(n);
    end
    % Second is the total time that the mouse was in the food zone
    BoxC(m).TotalFoodZoneTime = sum(BoxC(m).FoodZoneTime);
end
%% For analysis of DarkBoxD

Length = length(DarkBoxD); 
for  m = 1:Length
    Table1 = DarkBoxD(m).Table;

    % Pulling data out of the table
    FoodZone = table2array(Table1(:,18));
    Time = table2array(Table1(:,2));
    Increment = Time(2,1) - Time(1,1);

    % Creating a vector containing the times of food zone entries
    BoxD(m).FoodZoneEntry = [];
    l = length(FoodZone);
    for n = 2:l
        if FoodZone(n) == 1 && FoodZone(n-1) == 0
            a = Time(n);
        else a = [];
        end
        BoxD(m).FoodZoneEntry = [BoxD(m).FoodZoneEntry;a];
    end

    % Creating a vector containing the times of the food zone exits
    BoxD(m).FoodZoneExit = [];
    l = length(FoodZone);
    for n = 2:l
        if FoodZone(n) == 0 && FoodZone(n-1) == 1
            a = Time(n);
        else a = [];
        end
        BoxD(m).FoodZoneExit = [BoxD(m).FoodZoneExit;a];
    end

    %{
    Use these 2 if statements to fix when the lengths of food zone entries or
    exits are not equal. This is the result of the recording either starting
    or stopping while the mouse is in the food zone.
    %}
    % First fix the food zone entries
    if length(BoxD(m).FoodZoneEntry) < length(BoxD(m).FoodZoneExit)
        BoxD(m).FoodZoneEntry(2:length(BoxD(m).FoodZoneEntry) + 1) = BoxD(m).FoodZoneEntry(1:length(BoxD(m).FoodZoneEntry));
        BoxD(m).FoodZoneEntry(1) = 0;
    end
    % Second fix the food zone exits
    if length(BoxD(m).FoodZoneEntry) > length(BoxD(m).FoodZoneExit)
        BoxD(m).FoodZoneExit(length(BoxD(m).FoodZoneExit) + 1) = 600;
    end
end

for  m = 1:Length
    %{
    Use this to calculate the amount of time that the mouse was in the
    Food Zone
    %}
    % First are the individual times for each time the mouse entered
    BoxD(m).FoodZoneTime = [];
    l = length(BoxD(m).FoodZoneExit);
    for n = 1:l
        BoxD(m).FoodZoneTime(n) = BoxD(m).FoodZoneExit(n) - BoxD(m).FoodZoneEntry(n);
    end
    % Second is the total time that the mouse was in the food zone
    BoxD(m).TotalFoodZoneTime = sum(BoxD(m).FoodZoneTime);
end
%% For analysis of DarkBoxE

Length = length(DarkBoxE); 
for  m = 1:Length
    Table1 = DarkBoxE(m).Table;

    % Pulling data out of the table
    FoodZone = table2array(Table1(:,18));
    Time = table2array(Table1(:,2));
    Increment = Time(2,1) - Time(1,1);

    % Creating a vector containing the times of food zone entries
    BoxE(m).FoodZoneEntry = [];
    l = length(FoodZone);
    for n = 2:l
        if FoodZone(n) == 1 && FoodZone(n-1) == 0
            a = Time(n);
        else a = [];
        end
        BoxE(m).FoodZoneEntry = [BoxE(m).FoodZoneEntry;a];
    end

    % Creating a vector containing the times of the food zone exits
    BoxE(m).FoodZoneExit = [];
    l = length(FoodZone);
    for n = 2:l
        if FoodZone(n) == 0 && FoodZone(n-1) == 1
            a = Time(n);
        else a = [];
        end
        BoxE(m).FoodZoneExit = [BoxE(m).FoodZoneExit;a];
    end
    
    %{
    Use these 2 if statements to fix when the lengths of food zone entries
    or exits are not equal. This is the result of the recording either
    starting or stopping while the mouse is in the food zone.
    %}
    % First fix the food zone entries
    if length(BoxE(m).FoodZoneEntry) < length(BoxE(m).FoodZoneExit)
        BoxE(m).FoodZoneEntry(2:length(BoxE(m).FoodZoneEntry) + 1) = BoxE(m).FoodZoneEntry(1:length(BoxE(m).FoodZoneEntry));
        BoxE(m).FoodZoneEntry(1) = 0;
    end
    % Second fix the food zone exits
    if length(BoxE(m).FoodZoneEntry) > length(BoxE(m).FoodZoneExit)
        BoxE(m).FoodZoneExit(length(BoxE(m).FoodZoneExit) + 1) = 600;
    end
end

for  m = 1:Length
    %{
    Use this to calculate the amount of time that the mouse was in the
    Food Zone.
    %}
    % First are the individual times for each time the mouse entered
    BoxE(m).FoodZoneTime = [];
    l = length(BoxE(m).FoodZoneExit);
    for n = 1:l
        BoxE(m).FoodZoneTime(n) = BoxE(m).FoodZoneExit(n) - BoxE(m).FoodZoneEntry(n);
    end
    % Second is the total time that the mouse was in the food zone
    BoxE(m).TotalFoodZoneTime = sum(BoxE(m).FoodZoneTime);
end
%%

% Need to combine the data into one table
Box = [BoxC BoxD BoxE];

% Removing the exclusions
[Box] = exclusionrem_2Feed_Godfrey(Box);

% Adding my new structure to my structure Box_Complete
[Box_Complete.FoodZoneEntry] = Box.FoodZoneEntry;
[Box_Complete.FoodZoneExit] = Box.FoodZoneExit;
[Box_Complete.FoodZoneTime] = Box.FoodZoneTime;
[Box_Complete.TotalFoodZoneTime] = Box.TotalFoodZoneTime;
