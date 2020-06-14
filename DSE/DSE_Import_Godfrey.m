%{
This script allows me to choose the folder where my data is and then it
will create a directory and extract the abf files, organizing everything
into a matlab structure that is organized by filename and sweeps.

Although I could, I didn't use this data in matlab to calculate the DSE. I
had already done that in clampfit. I only used this data to create traces
to analyze the sEPSCs.

This script imports data from abf files for analysis in the following
script:
sEPSCs_Analysis_Godfrey.m
%}

%% Getting data for Male Control

% First step - prompts me to pick the folder where I can find my data, and
% saves that folder in my structure.
display = 'select folder for Male Control with no AM251'
DSE.Male.Control.folder = uigetdir;
DSE.Male.Control.directory = dir(DSE.Male.Control.folder);
clear display;

% Second step - creates a file path for each file (cell) within the chosen
% folder.
DSE.Male.Control.cellfile_path = [];

MC_number = 12;
start = (length(DSE.Male.Control.directory) - MC_number) + 1;

for f = start:length(DSE.Male.Control.directory);
    A = [DSE.Male.Control.folder,filesep,DSE.Male.Control.directory(f).name];
    DSE.Male.Control.cellfile_path = [DSE.Male.Control.cellfile_path ; A];
end
clear f A;

% Third step - creating a directory for each file (cell) that will display
% all the sweeps.
% locations
for f = 1:length(DSE.Male.Control.cellfile_path(:,1))
DSE.Male.Control.sweepfile(f).directory = dir(DSE.Male.Control.cellfile_path(f, :));
end

% Fourth step - Creating a structure for each sweep, names it, and then
% imports data using abfload to the structure. This way the data is neatly
% organized.
for g = 1:length(DSE.Male.Control.sweepfile)
    h = length(DSE.Male.Control.sweepfile(g).directory)-2
    DSE.Male.Control.sweepfile(g).file_struct = dir([DSE.Male.Control.sweepfile(g).directory(h).folder,filesep,'*.abf']);
    DSE.Male.Control.sweepfile(g).file_names = {DSE.Male.Control.sweepfile(g).file_struct.name};

    % loading data using abfload
for f = 1:length(DSE.Male.Control.sweepfile(g).file_names)
    file_path = [DSE.Male.Control.sweepfile(g).file_struct(f).folder,filesep,DSE.Male.Control.sweepfile(g).file_names{f}]
    [DSE.Male.Control.sweepfile(g).file_struct(f).d,DSE.Male.Control.sweepfile(1).file_struct(f).si,DSE.Male.Control.sweepfile(g).file_struct(f).h] = abfload(file_path)
end
end
clear g h f file_path start MC_number;
%% Getting data for Male Fasted

% First step
display = 'select folder for Male Fasted with no AM251'
DSE.Male.Fasted.folder = uigetdir;
DSE.Male.Fasted.directory = dir(DSE.Male.Fasted.folder);
clear display;

% Second step
DSE.Male.Fasted.cellfile_path = [];

MF_number = 11;
start = (length(DSE.Male.Fasted.directory) - MF_number) + 1;

for f = start:length(DSE.Male.Fasted.directory);
    A = [DSE.Male.Fasted.folder,filesep,DSE.Male.Fasted.directory(f).name];
    DSE.Male.Fasted.cellfile_path = [DSE.Male.Fasted.cellfile_path ; A];
end
clear f A;

% Third step
for f = 1:length(DSE.Male.Fasted.cellfile_path(:,1))
DSE.Male.Fasted.sweepfile(f).directory = dir(DSE.Male.Fasted.cellfile_path(f, :));
end

% Fourth step

for g = 1:length(DSE.Male.Fasted.sweepfile)
    h = length(DSE.Male.Fasted.sweepfile(g).directory)-2
    DSE.Male.Fasted.sweepfile(g).file_struct = dir([DSE.Male.Fasted.sweepfile(g).directory(h).folder,filesep,'*.abf']);
    DSE.Male.Fasted.sweepfile(g).file_names = {DSE.Male.Fasted.sweepfile(g).file_struct.name};

for f = 1:length(DSE.Male.Fasted.sweepfile(g).file_names)
    file_path = [DSE.Male.Fasted.sweepfile(g).file_struct(f).folder,filesep,DSE.Male.Fasted.sweepfile(g).file_names{f}]
    [DSE.Male.Fasted.sweepfile(g).file_struct(f).d,DSE.Male.Fasted.sweepfile(1).file_struct(f).si,DSE.Male.Fasted.sweepfile(g).file_struct(f).h] = abfload(file_path)
end
end
clear g h f file_path start MF_number;
%% Getting data for Female Control

% First step
display = 'select folder for Female Control with no AM251'
DSE.Female.Control.folder = uigetdir;
DSE.Female.Control.directory = dir(DSE.Female.Control.folder);
clear display;

% Second step
DSE.Female.Control.cellfile_path = [];

FC_number = 10;
start = (length(DSE.Female.Control.directory) - FC_number) + 1;

for f = start:length(DSE.Female.Control.directory);
    A = [DSE.Female.Control.folder,filesep,DSE.Female.Control.directory(f).name];
    DSE.Female.Control.cellfile_path = [DSE.Female.Control.cellfile_path ; A];
end
clear f A;

% Third step
for f = 1:length(DSE.Female.Control.cellfile_path(:,1))
DSE.Female.Control.sweepfile(f).directory = dir(DSE.Female.Control.cellfile_path(f, :));
end

% Fourth step

for g = 1:length(DSE.Female.Control.sweepfile)
    h = length(DSE.Female.Control.sweepfile(g).directory)-2
    DSE.Female.Control.sweepfile(g).file_struct = dir([DSE.Female.Control.sweepfile(g).directory(h).folder,filesep,'*.abf']);
    DSE.Female.Control.sweepfile(g).file_names = {DSE.Female.Control.sweepfile(g).file_struct.name};

for f = 1:length(DSE.Female.Control.sweepfile(g).file_names)
    file_path = [DSE.Female.Control.sweepfile(g).file_struct(f).folder,filesep,DSE.Female.Control.sweepfile(g).file_names{f}]
    [DSE.Female.Control.sweepfile(g).file_struct(f).d,DSE.Female.Control.sweepfile(1).file_struct(f).si,DSE.Female.Control.sweepfile(g).file_struct(f).h] = abfload(file_path)
end
end
clear g h f file_path start FC_number;
%% Getting data for Female Fasted

% First step
display = 'select folder for Female Fasted with no AM251'
DSE.Female.Fasted.folder = uigetdir;
DSE.Female.Fasted.directory = dir(DSE.Female.Fasted.folder);
clear display;

% Second step
DSE.Female.Fasted.cellfile_path = [];

FF_number = 11;
start = (length(DSE.Female.Fasted.directory) - FF_number) + 1;

for f = start:length(DSE.Female.Fasted.directory);
    A = [DSE.Female.Fasted.folder,filesep,DSE.Female.Fasted.directory(f).name];
    DSE.Female.Fasted.cellfile_path = [DSE.Female.Fasted.cellfile_path ; A];
end
clear f A;

% Third step
for f = 1:length(DSE.Female.Fasted.cellfile_path(:,1))
DSE.Female.Fasted.sweepfile(f).directory = dir(DSE.Female.Fasted.cellfile_path(f, :));
end

% Fourth step

for g = 1:length(DSE.Female.Fasted.sweepfile)
    h = length(DSE.Female.Fasted.sweepfile(g).directory)-2
    DSE.Female.Fasted.sweepfile(g).file_struct = dir([DSE.Female.Fasted.sweepfile(g).directory(h).folder,filesep,'*.abf']);
    DSE.Female.Fasted.sweepfile(g).file_names = {DSE.Female.Fasted.sweepfile(g).file_struct.name};

for f = 1:length(DSE.Female.Fasted.sweepfile(g).file_names)
    file_path = [DSE.Female.Fasted.sweepfile(g).file_struct(f).folder,filesep,DSE.Female.Fasted.sweepfile(g).file_names{f}]
    [DSE.Female.Fasted.sweepfile(g).file_struct(f).d,DSE.Female.Fasted.sweepfile(1).file_struct(f).si,DSE.Female.Fasted.sweepfile(g).file_struct(f).h] = abfload(file_path)
end
end
clear g h f file_path start FF_number;
%% Getting data for Male Control_AM251

% First step
display = 'select folder for Male Control with AM251'
DSE.Male.Control_AM251.folder = uigetdir;
DSE.Male.Control_AM251.directory = dir(DSE.Male.Control_AM251.folder);
clear display;

% Second step
DSE.Male.Control_AM251.cellfile_path = [];

MCA_number = 3;
start = (length(DSE.Male.Control_AM251.directory) - MCA_number) + 1;

for f = start:length(DSE.Male.Control_AM251.directory);
    A = [DSE.Male.Control_AM251.folder,filesep,DSE.Male.Control_AM251.directory(f).name];
    DSE.Male.Control_AM251.cellfile_path = [DSE.Male.Control_AM251.cellfile_path ; A];
end
clear f A;

% Third step
for f = 1:length(DSE.Male.Control_AM251.cellfile_path(:,1))
DSE.Male.Control_AM251.sweepfile(f).directory = dir(DSE.Male.Control_AM251.cellfile_path(f, :));
end

% Fourth step

for g = 1:length(DSE.Male.Control_AM251.sweepfile)
    h = length(DSE.Male.Control_AM251.sweepfile(g).directory)-2
    DSE.Male.Control_AM251.sweepfile(g).file_struct = dir([DSE.Male.Control_AM251.sweepfile(g).directory(h).folder,filesep,'*.abf']);
    DSE.Male.Control_AM251.sweepfile(g).file_names = {DSE.Male.Control_AM251.sweepfile(g).file_struct.name};

for f = 1:length(DSE.Male.Control_AM251.sweepfile(g).file_names)
    file_path = [DSE.Male.Control_AM251.sweepfile(g).file_struct(f).folder,filesep,DSE.Male.Control_AM251.sweepfile(g).file_names{f}]
    [DSE.Male.Control_AM251.sweepfile(g).file_struct(f).d,DSE.Male.Control_AM251.sweepfile(1).file_struct(f).si,DSE.Male.Control_AM251.sweepfile(g).file_struct(f).h] = abfload(file_path)
end
end
clear g h f file_path start MCA_number;
%% Getting data for Male Fasted_AM251

% First step
display = 'select folder for Male Fasted with AM251'
DSE.Male.Fasted_AM251.folder = uigetdir;
DSE.Male.Fasted_AM251.directory = dir(DSE.Male.Fasted_AM251.folder);
clear display;

% Second step
DSE.Male.Fasted_AM251.cellfile_path = [];

MFA_number = 4;
start = (length(DSE.Male.Fasted_AM251.directory) - MFA_number) + 1;

for f = start:length(DSE.Male.Fasted_AM251.directory);
    A = [DSE.Male.Fasted_AM251.folder,filesep,DSE.Male.Fasted_AM251.directory(f).name];
    DSE.Male.Fasted_AM251.cellfile_path = [DSE.Male.Fasted_AM251.cellfile_path ; A];
end
clear f A;

% Third step
for f = 1:length(DSE.Male.Fasted_AM251.cellfile_path(:,1))
DSE.Male.Fasted_AM251.sweepfile(f).directory = dir(DSE.Male.Fasted_AM251.cellfile_path(f, :));
end

% Fourth step

for g = 1:length(DSE.Male.Fasted_AM251.sweepfile)
    h = length(DSE.Male.Fasted_AM251.sweepfile(g).directory)-2
    DSE.Male.Fasted_AM251.sweepfile(g).file_struct = dir([DSE.Male.Fasted_AM251.sweepfile(g).directory(h).folder,filesep,'*.abf']);
    DSE.Male.Fasted_AM251.sweepfile(g).file_names = {DSE.Male.Fasted_AM251.sweepfile(g).file_struct.name};

for f = 1:length(DSE.Male.Fasted_AM251.sweepfile(g).file_names)
    file_path = [DSE.Male.Fasted_AM251.sweepfile(g).file_struct(f).folder,filesep,DSE.Male.Fasted_AM251.sweepfile(g).file_names{f}]
    [DSE.Male.Fasted_AM251.sweepfile(g).file_struct(f).d,DSE.Male.Fasted_AM251.sweepfile(1).file_struct(f).si,DSE.Male.Fasted_AM251.sweepfile(g).file_struct(f).h] = abfload(file_path)
end
end
clear g h f file_path start MFA_number;
%% Getting data for Female Control_AM251

% First step
display = 'select folder for Female Control with AM251'
DSE.Female.Control_AM251.folder = uigetdir;
DSE.Female.Control_AM251.directory = dir(DSE.Female.Control_AM251.folder);
clear display;

% Second step
DSE.Female.Control_AM251.cellfile_path = [];

FCA_number = 5;
start = (length(DSE.Female.Control_AM251.directory) - FCA_number) + 1;

for f = start:length(DSE.Female.Control_AM251.directory);
    A = [DSE.Female.Control_AM251.folder,filesep,DSE.Female.Control_AM251.directory(f).name];
    DSE.Female.Control_AM251.cellfile_path = [DSE.Female.Control_AM251.cellfile_path ; A];
end
clear f A;

% Third step
for f = 1:length(DSE.Female.Control_AM251.cellfile_path(:,1))
DSE.Female.Control_AM251.sweepfile(f).directory = dir(DSE.Female.Control_AM251.cellfile_path(f, :));
end

% Fourth step

for g = 1:length(DSE.Female.Control_AM251.sweepfile)
    h = length(DSE.Female.Control_AM251.sweepfile(g).directory)-2
    DSE.Female.Control_AM251.sweepfile(g).file_struct = dir([DSE.Female.Control_AM251.sweepfile(g).directory(h).folder,filesep,'*.abf']);
    DSE.Female.Control_AM251.sweepfile(g).file_names = {DSE.Female.Control_AM251.sweepfile(g).file_struct.name};

for f = 1:length(DSE.Female.Control_AM251.sweepfile(g).file_names)
    file_path = [DSE.Female.Control_AM251.sweepfile(g).file_struct(f).folder,filesep,DSE.Female.Control_AM251.sweepfile(g).file_names{f}]
    [DSE.Female.Control_AM251.sweepfile(g).file_struct(f).d,DSE.Female.Control_AM251.sweepfile(1).file_struct(f).si,DSE.Female.Control_AM251.sweepfile(g).file_struct(f).h] = abfload(file_path)
end
end
clear g h f file_path start FCA_number;
%% Getting data for Female Fasted_AM251

% First step
display = 'select folder for Female Fasted with AM251'
DSE.Female.Fasted_AM251.folder = uigetdir;
DSE.Female.Fasted_AM251.directory = dir(DSE.Female.Fasted_AM251.folder);
clear display;

% Second step
DSE.Female.Fasted_AM251.cellfile_path = [];

FFA_number = 10;
start = (length(DSE.Female.Fasted_AM251.directory) - FFA_number) + 1;

for f = start:length(DSE.Female.Fasted_AM251.directory);
    A = [DSE.Female.Fasted_AM251.folder,filesep,DSE.Female.Fasted_AM251.directory(f).name];
    DSE.Female.Fasted_AM251.cellfile_path = [DSE.Female.Fasted_AM251.cellfile_path ; A];
end
clear f A;

% Third step
for f = 1:length(DSE.Female.Fasted_AM251.cellfile_path(:,1))
DSE.Female.Fasted_AM251.sweepfile(f).directory = dir(DSE.Female.Fasted_AM251.cellfile_path(f, :));
end

% Fourth step

for g = 1:length(DSE.Female.Fasted_AM251.sweepfile)
    h = length(DSE.Female.Fasted_AM251.sweepfile(g).directory)-2
    DSE.Female.Fasted_AM251.sweepfile(g).file_struct = dir([DSE.Female.Fasted_AM251.sweepfile(g).directory(h).folder,filesep,'*.abf']);
    DSE.Female.Fasted_AM251.sweepfile(g).file_names = {DSE.Female.Fasted_AM251.sweepfile(g).file_struct.name};

for f = 1:length(DSE.Female.Fasted_AM251.sweepfile(g).file_names)
    file_path = [DSE.Female.Fasted_AM251.sweepfile(g).file_struct(f).folder,filesep,DSE.Female.Fasted_AM251.sweepfile(g).file_names{f}]
    [DSE.Female.Fasted_AM251.sweepfile(g).file_struct(f).d,DSE.Female.Fasted_AM251.sweepfile(1).file_struct(f).si,DSE.Female.Fasted_AM251.sweepfile(g).file_struct(f).h] = abfload(file_path)
end
end
clear g h f file_path start FFA_number;
%%
%{
Need to clean up a couple files, since on some of the first ones it
creates extra blank files at the end. I can just delete those rows
manually and then save it afterwards.

Have to use the -v7.3 since the DSE file is larger than 2 GB. THis -v7.3
does some sort of compression, which makes the file smaller than 2 GB in
the end, but it takes significantly longer to save and load.
%}
% save('DSE_2019.mat', 'DSE', '-v7.3');