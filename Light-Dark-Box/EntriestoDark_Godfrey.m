function [DarkBoxC] = EntriestoDark_Godfrey
%{
Used in the script LightDarkBox_Analyzer_Godfrey.m    
%}
directory = uigetdir; % directory(1,55:62) is '6Sep2019'
inventory = dir(directory);
F1 = inventory(3).folder;
N1 = inventory(3).name;
DarkBoxC = [];
for m = 1:(length(inventory)-2);
    F2 = inventory(m+2).folder;
    N2 = inventory(m+2).name;
    %{
    If I don't do this opts thing, then the table will import really messed
    up and be difficult to work with
    %}
    opts = detectImportOptions([F1 filesep N1]);
    DarkBoxC(m).Table = readtable([F2 filesep N2],opts);

    Dark_index = isnan(DarkBoxC(m).Table.Area);

    %{
    This for loop with the if else statements will give me the times of
    entry and the time of exit.
    %}
    DarkBoxC(m).EntryExit = [];
    l = length(DarkBoxC(m).Table.Area);
        for n = 2:l-2;
            %{
            This gives me the time of entry to the dark zone, aka the time of
            exit from the light zone.
            %}
            if Dark_index(n) == 1 && Dark_index(n-1) == 0;
            a = DarkBoxC(m).Table.RecordingTime(n);
            else a = [];
        end
        DarkBoxC(m).EntryExit = [DarkBoxC(m).EntryExit;a];
        %{
        This gives me the time of exit from the dark zone, aka the time of
        entry to the light zone
        %}
            if Dark_index(n) == 0 && Dark_index(n-1) == 1;
            a = DarkBoxC(m).Table.RecordingTime(n);
            else a = [];
            end
            %{
            This vector will contain all the dark entries as odd numbers and all
            the light entries as even numbers.
            %}
        DarkBoxC(m).EntryExit = [DarkBoxC(m).EntryExit;a];
    end
    %{
    Creating Vector Structures for Dark Entries and Light Entries, and 
    adjusting their lengths so that they're equal   The NaN is in case the
    mouse never enterred the Dark Zone, otherwise this  function will fail
    in those cases.
    %}
    DarkBoxC(m).DarkEntry = NaN;
    % Now creating my Dark Entries and Light Entries
    DarkBoxC(m).DarkEntry = [DarkBoxC(m).DarkEntry;DarkBoxC(m).EntryExit(1:2:end)];
    DarkBoxC(m).LightEntry = DarkBoxC(m).EntryExit(2:2:end);
    if (length(DarkBoxC(m).DarkEntry) ~= length(DarkBoxC(m).LightEntry)) == 1;
        DarkBoxC(m).LightEntry(length(DarkBoxC(m).DarkEntry)) = NaN;
    else DarkBoxC(m).LightEntry = DarkBoxC(m).LightEntry;
    end

    %{
    The hold is in case the mouse never enterred the Dark Zone, otherwise this
    function will fail in those cases.
    %}
    hold = DarkBoxC(m).DarkEntry;

    %{
    In order to remove glitches where the mouse disappears for less than or
    equal to 0.5s.
    %}
    for n = 1:(length(DarkBoxC(m).DarkEntry));
        if (DarkBoxC(m).LightEntry(n) - DarkBoxC(m).DarkEntry(n)) <= 0.5;
            DarkBoxC(m).LightEntry(n) = NaN; DarkBoxC(m).DarkEntry(n) = NaN;
        else DarkBoxC(m).LightEntry(n) = DarkBoxC(m).LightEntry(n); DarkBoxC(m).DarkEntry(n) = DarkBoxC(m).DarkEntry(n);
        end
    end

    %{
    Removing all of those measurements that are glitches. Will also remove the
    NaN that I added earlier to make them the same length, but I fix this
    later.
    %}
    nanindex_Light = ~isnan(DarkBoxC(m).LightEntry);
    DarkBoxC(m).LightEntry = DarkBoxC(m).LightEntry(nanindex_Light);
    nanindex_Dark = ~isnan(DarkBoxC(m).DarkEntry);
    DarkBoxC(m).DarkEntry = DarkBoxC(m).DarkEntry(nanindex_Dark);
    %{
    This if statment is in case the mouse never enterred the Dark Zone, otherwise this
    function will fail in those cases.
    %}
    if isnan(hold(length(hold))) == 1;
        DarkBoxC(m).DarkEntry = NaN;
    else DarkBoxC(m).DarkEntry = DarkBoxC(m).DarkEntry;
    end
    %{
    If the glitch is at the very beginning, then if statment will take care
    of that.
    %}
    if DarkBoxC(m).DarkEntry(1) < 1;
        DarkBoxC(m).DarkEntry = DarkBoxC(m).DarkEntry(2:end);
        DarkBoxC(m).LightEntry = DarkBoxC(m).LightEntry(2:end);
    else DarkBoxC(m).DarkEntry = DarkBoxC(m).DarkEntry;
        DarkBoxC(m).LightEntry = DarkBoxC(m).LightEntry;
    end

    % Adjusting their lengths again
    if (length(DarkBoxC(m).DarkEntry) ~= length(DarkBoxC(m).LightEntry)) == 1;
        DarkBoxC(m).LightEntry(length(DarkBoxC(m).DarkEntry)) = NaN;
    else DarkBoxC(m).LightEntry = DarkBoxC(m).LightEntry;
    end

    %{
    Calculates the sum of Dark Entries and Light Entries, as well as calculates
    the latency to the first Dark Entry and Dark Exit (aka Light Entry)
    %}
    DarkBoxC(m).DarkEntrysum = length(DarkBoxC(m).DarkEntry);
    DarkBoxC(m).LightEntrysum = length(DarkBoxC(m).LightEntry);
    DarkBoxC(m).Latency_DarkEntry = DarkBoxC(m).DarkEntry(1);
    DarkBoxC(m).Latency_LightEntry = DarkBoxC(m).LightEntry(1) - DarkBoxC(m).DarkEntry(1);

    %{
    This corrects the sum of Light Entries when they are not equal to the sum
    of Dark Entries - Remember that there is an NaN in there as a place holder
    to assure that the columns have the same number of rows in order to allow
    for subtraction.
    %}
    if isnan(DarkBoxC(m).DarkEntry(length(DarkBoxC(m).DarkEntry))) == 1;
        DarkBoxC(m).DarkEntrysum = DarkBoxC(m).DarkEntrysum - 1;
    else DarkBoxC(m).DarkEntrysum = DarkBoxC(m).DarkEntrysum;
    end
    if isnan(DarkBoxC(m).LightEntry(length(DarkBoxC(m).LightEntry))) == 1;
        DarkBoxC(m).LightEntrysum = DarkBoxC(m).LightEntrysum - 1;
    else DarkBoxC(m).LightEntrysum = DarkBoxC(m).LightEntrysum;
    end
    %{
    Ending at this point will give me total number of Dark Entries, total
    number of Light Entries, and latency to first entry for both the Light Zone
    and Dark Zone. I can easily get the rest of the data from the Noldus
    software
    %}
end
end
