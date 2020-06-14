%{
This script takes the data collected from my DSE recordings, cuts off the
last 3 seconds of each sweep, and concatenates the last 6 sweeps of each
acquisition (1 minute baseline before each depolarization step). The data
is then written in a .dat file that can be openned in clampfit and
converted to .abf file.

This script also creates a randomization table for my data. Unfortunately,
I made the randomization table after writing the .dat files, so I had to
change the names of the files manually. This isn't ideal, but still works
since at the end of the day I can't remember which numbers correspond with
each file (so the data analysis is still blinded). The next time I do this,
I would create my randomization table and change the file names in matlab
before writing them. This would save me time.

This data was imported using the following script:
DSE_Import_Godfrey.m
%}

%% Cutting out the last 3 seconds of each each Sweep (5 seconds long per sweep)

Two_second_Index = (2 * 20000) + 1;
Five_second_Index = (5 * 20000);

% Male Control
for n = 1:size(DSE.Male.Control.sweepfile,2);
    for m = 1:size(DSE.Male.Control.sweepfile(n).file_struct,1);
        DSE.Male.Control.sweepfile(n).file_struct(m).sEPSC = [];
        for o = 1:size(DSE.Male.Control.sweepfile(n).file_struct(m).d,3);
            A = DSE.Male.Control.sweepfile(n).file_struct(m).d(Two_second_Index:Five_second_Index,1,o);
            DSE.Male.Control.sweepfile(n).file_struct(m).sEPSC = [DSE.Male.Control.sweepfile(n).file_struct(m).sEPSC A];
        end
    end
end

% Male Fasted
for n = 1:size(DSE.Male.Fasted.sweepfile,2);
    for m = 1:size(DSE.Male.Fasted.sweepfile(n).file_struct,1);
        DSE.Male.Fasted.sweepfile(n).file_struct(m).sEPSC = [];
        for o = 1:size(DSE.Male.Fasted.sweepfile(n).file_struct(m).d,3);
            A = DSE.Male.Fasted.sweepfile(n).file_struct(m).d(Two_second_Index:Five_second_Index,1,o);
            DSE.Male.Fasted.sweepfile(n).file_struct(m).sEPSC = [DSE.Male.Fasted.sweepfile(n).file_struct(m).sEPSC A];
        end
    end
end

% Male Control with AM251
for n = 1:size(DSE.Male.Control_AM251.sweepfile,2);
    for m = 1:size(DSE.Male.Control_AM251.sweepfile(n).file_struct,1);
        DSE.Male.Control_AM251.sweepfile(n).file_struct(m).sEPSC = [];
        for o = 1:size(DSE.Male.Control_AM251.sweepfile(n).file_struct(m).d,3);
            A = DSE.Male.Control_AM251.sweepfile(n).file_struct(m).d(Two_second_Index:Five_second_Index,1,o);
            DSE.Male.Control_AM251.sweepfile(n).file_struct(m).sEPSC = [DSE.Male.Control_AM251.sweepfile(n).file_struct(m).sEPSC A];
        end
    end
end

% Male Fasted with AM251
for n = 1:size(DSE.Male.Fasted_AM251.sweepfile,2);
    for m = 1:size(DSE.Male.Fasted_AM251.sweepfile(n).file_struct,1);
        DSE.Male.Fasted_AM251.sweepfile(n).file_struct(m).sEPSC = [];
        for o = 1:size(DSE.Male.Fasted_AM251.sweepfile(n).file_struct(m).d,3);
            A = DSE.Male.Fasted_AM251.sweepfile(n).file_struct(m).d(Two_second_Index:Five_second_Index,1,o);
            DSE.Male.Fasted_AM251.sweepfile(n).file_struct(m).sEPSC = [DSE.Male.Fasted_AM251.sweepfile(n).file_struct(m).sEPSC A];
        end
    end
end

% Female Control
for n = 1:size(DSE.Female.Control.sweepfile,2);
    for m = 1:size(DSE.Female.Control.sweepfile(n).file_struct,1);
        DSE.Female.Control.sweepfile(n).file_struct(m).sEPSC = [];
        for o = 1:size(DSE.Female.Control.sweepfile(n).file_struct(m).d,3);
            A = DSE.Female.Control.sweepfile(n).file_struct(m).d(Two_second_Index:Five_second_Index,1,o);
            DSE.Female.Control.sweepfile(n).file_struct(m).sEPSC = [DSE.Female.Control.sweepfile(n).file_struct(m).sEPSC A];
        end
    end
end

% Female Fasted
for n = 1:size(DSE.Female.Fasted.sweepfile,2);
    for m = 1:size(DSE.Female.Fasted.sweepfile(n).file_struct,1);
        DSE.Female.Fasted.sweepfile(n).file_struct(m).sEPSC = [];
        for o = 1:size(DSE.Female.Fasted.sweepfile(n).file_struct(m).d,3);
            A = DSE.Female.Fasted.sweepfile(n).file_struct(m).d(Two_second_Index:Five_second_Index,1,o);
            DSE.Female.Fasted.sweepfile(n).file_struct(m).sEPSC = [DSE.Female.Fasted.sweepfile(n).file_struct(m).sEPSC A];
        end
    end
end

% Female Control with AM251
for n = 1:size(DSE.Female.Control_AM251.sweepfile,2);
    for m = 1:size(DSE.Female.Control_AM251.sweepfile(n).file_struct,1);
        DSE.Female.Control_AM251.sweepfile(n).file_struct(m).sEPSC = [];
        for o = 1:size(DSE.Female.Control_AM251.sweepfile(n).file_struct(m).d,3);
            A = DSE.Female.Control_AM251.sweepfile(n).file_struct(m).d(Two_second_Index:Five_second_Index,1,o);
            DSE.Female.Control_AM251.sweepfile(n).file_struct(m).sEPSC = [DSE.Female.Control_AM251.sweepfile(n).file_struct(m).sEPSC A];
        end
    end
end

% Female Fasted with AM251
for n = 1:size(DSE.Female.Fasted_AM251.sweepfile,2);
    for m = 1:size(DSE.Female.Fasted_AM251.sweepfile(n).file_struct,1);
        DSE.Female.Fasted_AM251.sweepfile(n).file_struct(m).sEPSC = [];
        for o = 1:size(DSE.Female.Fasted_AM251.sweepfile(n).file_struct(m).d,3);
            A = DSE.Female.Fasted_AM251.sweepfile(n).file_struct(m).d(Two_second_Index:Five_second_Index,1,o);
            DSE.Female.Fasted_AM251.sweepfile(n).file_struct(m).sEPSC = [DSE.Female.Fasted_AM251.sweepfile(n).file_struct(m).sEPSC A];
        end
    end
end

clear A Five_second_Index Two_second_Index m n o;
%% Concatenating the last 6 sweeps (1 minute baseline) of each acquisition

% Male Control
for n = 1:size(DSE.Male.Control.sweepfile,2);
    for m = 1:size(DSE.Male.Control.sweepfile(n).file_struct,1);
        s = size(DSE.Male.Control.sweepfile(n).file_struct(m).sEPSC,2);
        DSE.Male.Control.sweepfile(n).file_struct(m).sEPSC_conc = [];
        for o = s-5:s;
            A = DSE.Male.Control.sweepfile(n).file_struct(m).sEPSC(:,o);
            DSE.Male.Control.sweepfile(n).file_struct(m).sEPSC_conc = [DSE.Male.Control.sweepfile(n).file_struct(m).sEPSC_conc; A];
        end
    end
end

% Male Fasted
for n = 1:size(DSE.Male.Fasted.sweepfile,2);
    for m = 1:size(DSE.Male.Fasted.sweepfile(n).file_struct,1);
        s = size(DSE.Male.Fasted.sweepfile(n).file_struct(m).sEPSC,2);
        DSE.Male.Fasted.sweepfile(n).file_struct(m).sEPSC_conc = [];
        for o = s-5:s;
            A = DSE.Male.Fasted.sweepfile(n).file_struct(m).sEPSC(:,o);
            DSE.Male.Fasted.sweepfile(n).file_struct(m).sEPSC_conc = [DSE.Male.Fasted.sweepfile(n).file_struct(m).sEPSC_conc; A];
        end
    end
end

% Female Control
for n = 1:size(DSE.Female.Control.sweepfile,2);
    for m = 1:size(DSE.Female.Control.sweepfile(n).file_struct,1);
        s = size(DSE.Female.Control.sweepfile(n).file_struct(m).sEPSC,2);
        DSE.Female.Control.sweepfile(n).file_struct(m).sEPSC_conc = [];
        for o = s-5:s;
            A = DSE.Female.Control.sweepfile(n).file_struct(m).sEPSC(:,o);
            DSE.Female.Control.sweepfile(n).file_struct(m).sEPSC_conc = [DSE.Female.Control.sweepfile(n).file_struct(m).sEPSC_conc; A];
        end
    end
end

% Female Fasted
for n = 1:size(DSE.Female.Fasted.sweepfile,2);
    for m = 1:size(DSE.Female.Fasted.sweepfile(n).file_struct,1);
        s = size(DSE.Female.Fasted.sweepfile(n).file_struct(m).sEPSC,2);
        DSE.Female.Fasted.sweepfile(n).file_struct(m).sEPSC_conc = [];
        for o = s-5:s;
            A = DSE.Female.Fasted.sweepfile(n).file_struct(m).sEPSC(:,o);
            DSE.Female.Fasted.sweepfile(n).file_struct(m).sEPSC_conc = [DSE.Female.Fasted.sweepfile(n).file_struct(m).sEPSC_conc; A];
        end
    end
end

% Male Control with AM251
for n = 1:size(DSE.Male.Control_AM251.sweepfile,2);
    for m = 1:size(DSE.Male.Control_AM251.sweepfile(n).file_struct,1);
        s = size(DSE.Male.Control_AM251.sweepfile(n).file_struct(m).sEPSC,2);
        DSE.Male.Control_AM251.sweepfile(n).file_struct(m).sEPSC_conc = [];
        for o = s-5:s;
            A = DSE.Male.Control_AM251.sweepfile(n).file_struct(m).sEPSC(:,o);
            DSE.Male.Control_AM251.sweepfile(n).file_struct(m).sEPSC_conc = [DSE.Male.Control_AM251.sweepfile(n).file_struct(m).sEPSC_conc; A];
        end
    end
end

% Male Fasted with AM251
for n = 1:size(DSE.Male.Fasted_AM251.sweepfile,2);
    for m = 1:size(DSE.Male.Fasted_AM251.sweepfile(n).file_struct,1);
        s = size(DSE.Male.Fasted_AM251.sweepfile(n).file_struct(m).sEPSC,2);
        DSE.Male.Fasted_AM251.sweepfile(n).file_struct(m).sEPSC_conc = [];
        for o = s-5:s;
            A = DSE.Male.Fasted_AM251.sweepfile(n).file_struct(m).sEPSC(:,o);
            DSE.Male.Fasted_AM251.sweepfile(n).file_struct(m).sEPSC_conc = [DSE.Male.Fasted_AM251.sweepfile(n).file_struct(m).sEPSC_conc; A];
        end
    end
end

% Female Control with AM251
for n = 1:size(DSE.Female.Control_AM251.sweepfile,2);
    for m = 1:size(DSE.Female.Control_AM251.sweepfile(n).file_struct,1);
        s = size(DSE.Female.Control_AM251.sweepfile(n).file_struct(m).sEPSC,2);
        DSE.Female.Control_AM251.sweepfile(n).file_struct(m).sEPSC_conc = [];
        for o = s-5:s;
            A = DSE.Female.Control_AM251.sweepfile(n).file_struct(m).sEPSC(:,o);
            DSE.Female.Control_AM251.sweepfile(n).file_struct(m).sEPSC_conc = [DSE.Female.Control_AM251.sweepfile(n).file_struct(m).sEPSC_conc; A];
        end
    end
end

% Female Fasted with AM251
for n = 1:size(DSE.Female.Fasted_AM251.sweepfile,2);
    for m = 1:size(DSE.Female.Fasted_AM251.sweepfile(n).file_struct,1);
        s = size(DSE.Female.Fasted_AM251.sweepfile(n).file_struct(m).sEPSC,2);
        DSE.Female.Fasted_AM251.sweepfile(n).file_struct(m).sEPSC_conc = [];
        for o = s-5:s;
            A = DSE.Female.Fasted_AM251.sweepfile(n).file_struct(m).sEPSC(:,o);
            DSE.Female.Fasted_AM251.sweepfile(n).file_struct(m).sEPSC_conc = [DSE.Female.Fasted_AM251.sweepfile(n).file_struct(m).sEPSC_conc; A];
        end
    end
end
clear A m n o s;

%% Concatenating the Acquisitions
%{
This portion of the script concatenates those baseline acquisitions that I
just created. Now I will have one trace per cell. The last acquisition for
each cell doesn't have baseline, so the code takes that into account.
%}

% Male Control
for n = 1:size(DSE.Male.Control.sweepfile,2);
    DSE.Male.Control.sweepfile(n).file_struct(1).Full_conc = [];
    for m = 1:size(DSE.Male.Control.sweepfile(n).file_struct,1)-1;  % The -1 is there, because I don't want the last acquisition (which has no baseline)
        DSE.Male.Control.sweepfile(n).file_struct(1).Full_conc = [DSE.Male.Control.sweepfile(n).file_struct.Full_conc; DSE.Male.Control.sweepfile(n).file_struct(m).sEPSC_conc];
    end
end

% Male Fasted
for n = 1:size(DSE.Male.Fasted.sweepfile,2);
    DSE.Male.Fasted.sweepfile(n).file_struct(1).Full_conc = [];
    for m = 1:size(DSE.Male.Fasted.sweepfile(n).file_struct,1)-1;
        DSE.Male.Fasted.sweepfile(n).file_struct(1).Full_conc = [DSE.Male.Fasted.sweepfile(n).file_struct.Full_conc; DSE.Male.Fasted.sweepfile(n).file_struct(m).sEPSC_conc];
    end
end

% Female Control
for n = 1:size(DSE.Female.Control.sweepfile,2);
    DSE.Female.Control.sweepfile(n).file_struct(1).Full_conc = [];
    for m = 1:size(DSE.Female.Control.sweepfile(n).file_struct,1)-1;
        DSE.Female.Control.sweepfile(n).file_struct(1).Full_conc = [DSE.Female.Control.sweepfile(n).file_struct.Full_conc; DSE.Female.Control.sweepfile(n).file_struct(m).sEPSC_conc];
    end
end

% Female Fasted
for n = 1:size(DSE.Female.Fasted.sweepfile,2);
    DSE.Female.Fasted.sweepfile(n).file_struct(1).Full_conc = [];
    for m = 1:size(DSE.Female.Fasted.sweepfile(n).file_struct,1)-1;
        DSE.Female.Fasted.sweepfile(n).file_struct(1).Full_conc = [DSE.Female.Fasted.sweepfile(n).file_struct.Full_conc; DSE.Female.Fasted.sweepfile(n).file_struct(m).sEPSC_conc];
    end
end

% Male Control with AM251
for n = 1:size(DSE.Male.Control_AM251.sweepfile,2);
    DSE.Male.Control_AM251.sweepfile(n).file_struct(1).Full_conc = [];
    for m = 1:size(DSE.Male.Control_AM251.sweepfile(n).file_struct,1)-1;
        DSE.Male.Control_AM251.sweepfile(n).file_struct(1).Full_conc = [DSE.Male.Control_AM251.sweepfile(n).file_struct.Full_conc; DSE.Male.Control_AM251.sweepfile(n).file_struct(m).sEPSC_conc];
    end
end
% Male Fasted with AM251
for n = 1:size(DSE.Male.Fasted_AM251.sweepfile,2);
    DSE.Male.Fasted_AM251.sweepfile(n).file_struct(1).Full_conc = [];
    for m = 1:size(DSE.Male.Fasted_AM251.sweepfile(n).file_struct,1)-1;
        DSE.Male.Fasted_AM251.sweepfile(n).file_struct(1).Full_conc = [DSE.Male.Fasted_AM251.sweepfile(n).file_struct.Full_conc; DSE.Male.Fasted_AM251.sweepfile(n).file_struct(m).sEPSC_conc];
    end
end

% Female Control with AM251
for n = 1:size(DSE.Female.Control_AM251.sweepfile,2);
    DSE.Female.Control_AM251.sweepfile(n).file_struct(1).Full_conc = [];
    for m = 1:size(DSE.Female.Control_AM251.sweepfile(n).file_struct,1)-1;
        DSE.Female.Control_AM251.sweepfile(n).file_struct(1).Full_conc = [DSE.Female.Control_AM251.sweepfile(n).file_struct.Full_conc; DSE.Female.Control_AM251.sweepfile(n).file_struct(m).sEPSC_conc];
    end
end

% Female Fasted with AM251
for n = 1:size(DSE.Female.Fasted_AM251.sweepfile,2);
    DSE.Female.Fasted_AM251.sweepfile(n).file_struct(1).Full_conc = [];
    for m = 1:size(DSE.Female.Fasted_AM251.sweepfile(n).file_struct,1)-1;
        DSE.Female.Fasted_AM251.sweepfile(n).file_struct(1).Full_conc = [DSE.Female.Fasted_AM251.sweepfile(n).file_struct.Full_conc; DSE.Female.Fasted_AM251.sweepfile(n).file_struct(m).sEPSC_conc];
    end
end

clear m n
%% Adding the name of each file within file_struct

% Male Control
l = (length(DSE.Male.Control.cellfile_path)-11):length(DSE.Male.Control.cellfile_path);
for n = 1:size(DSE.Male.Control.sweepfile,2);
    DSE.Male.Control.sweepfile(n).file_struct(1).Cellname = DSE.Male.Control.cellfile_path(n,l);
end

% Male Fasted
l = (length(DSE.Male.Fasted.cellfile_path)-11):length(DSE.Male.Fasted.cellfile_path);
for n = 1:size(DSE.Male.Fasted.sweepfile,2);
    DSE.Male.Fasted.sweepfile(n).file_struct(1).Cellname = DSE.Male.Fasted.cellfile_path(n,l);
end

% Female Control
l = (length(DSE.Female.Control.cellfile_path)-11):length(DSE.Female.Control.cellfile_path);
for n = 1:size(DSE.Female.Control.sweepfile,2);
    DSE.Female.Control.sweepfile(n).file_struct(1).Cellname = DSE.Female.Control.cellfile_path(n,l);
end

% Female Fasted
l = (length(DSE.Female.Fasted.cellfile_path)-11):length(DSE.Female.Fasted.cellfile_path);
for n = 1:size(DSE.Female.Fasted.sweepfile,2);
    DSE.Female.Fasted.sweepfile(n).file_struct(1).Cellname = DSE.Female.Fasted.cellfile_path(n,l);
end

% Male Control with AM251
l = (length(DSE.Male.Control_AM251.cellfile_path)-11):length(DSE.Male.Control_AM251.cellfile_path);
for n = 1:size(DSE.Male.Control_AM251.sweepfile,2);
    DSE.Male.Control_AM251.sweepfile(n).file_struct(1).Cellname = DSE.Male.Control_AM251.cellfile_path(n,l);
end

% Male Fasted with AM251
l = (length(DSE.Male.Fasted_AM251.cellfile_path)-11):length(DSE.Male.Fasted_AM251.cellfile_path);
for n = 1:size(DSE.Male.Fasted_AM251.sweepfile,2);
    DSE.Male.Fasted_AM251.sweepfile(n).file_struct(1).Cellname = DSE.Male.Fasted_AM251.cellfile_path(n,l);
end

% Female Control with AM251
l = (length(DSE.Female.Control_AM251.cellfile_path)-11):length(DSE.Female.Control_AM251.cellfile_path);
for n = 1:size(DSE.Female.Control_AM251.sweepfile,2);
    DSE.Female.Control_AM251.sweepfile(n).file_struct(1).Cellname = DSE.Female.Control_AM251.cellfile_path(n,l);
end

% Female Fasted with AM251
l = (length(DSE.Female.Fasted_AM251.cellfile_path)-11):length(DSE.Female.Fasted_AM251.cellfile_path);
for n = 1:size(DSE.Female.Fasted_AM251.sweepfile,2);
    DSE.Female.Fasted_AM251.sweepfile(n).file_struct(1).Cellname = DSE.Female.Fasted_AM251.cellfile_path(n,l);
end

clear l n

% save('DSE_2019.mat', 'DSE', '-v7.3');
%% Graphing traces
%{
This section allows me to graph the files that I have concatenated. Good to
do to see if everything has worked and I don't have anything weird going
on.
%}
%{
Male Control
for n = 1:size(DSE.Male.Control.sweepfile,2);
    x = linspace(0, (size(DSE.Male.Control.sweepfile(n).file_struct(1).Full_conc,1)/20000), size(DSE.Male.Control.sweepfile(n).file_struct(1).Full_conc,1));
    figure; hold on;
    plot(x,DSE.Male.Control.sweepfile(n).file_struct(1).Full_conc);
    ylabel('Amplitude (pA)'); xlabel('Time (s)');
    title([{DSE.Male.Control.sweepfile(n).file_struct(1).Cellname}]);
    hold off;
end

Male Fasted
for n = 1:size(DSE.Male.Fasted.sweepfile,2);
    x = linspace(0, (size(DSE.Male.Fasted.sweepfile(n).file_struct(1).Full_conc,1)/20000), size(DSE.Male.Fasted.sweepfile(n).file_struct(1).Full_conc,1));
    figure; hold on;
    plot(x,DSE.Male.Fasted.sweepfile(n).file_struct(1).Full_conc);
    ylabel('Amplitude (pA)'); xlabel('Time (s)');
    title([{DSE.Male.Fasted.sweepfile(n).file_struct(1).Cellname}]);
    hold off;
end

Female Control
for n = 1:size(DSE.Female.Control.sweepfile,2);
    x = linspace(0, (size(DSE.Female.Control.sweepfile(n).file_struct(1).Full_conc,1)/20000), size(DSE.Female.Control.sweepfile(n).file_struct(1).Full_conc,1));
    figure; hold on;
    plot(x,DSE.Female.Control.sweepfile(n).file_struct(1).Full_conc);
    ylabel('Amplitude (pA)'); xlabel('Time (s)');
    title([{DSE.Female.Control.sweepfile(n).file_struct(1).Cellname}]);
    hold off;
end

Female Fasted
for n = 1:size(DSE.Female.Fasted.sweepfile,2);
    x = linspace(0, (size(DSE.Female.Fasted.sweepfile(n).file_struct(1).Full_conc,1)/20000), size(DSE.Female.Fasted.sweepfile(n).file_struct(1).Full_conc,1));
    figure; hold on;
    plot(x,DSE.Female.Fasted.sweepfile(n).file_struct(1).Full_conc);
    ylabel('Amplitude (pA)'); xlabel('Time (s)');
    title([{DSE.Female.Fasted.sweepfile(n).file_struct(1).Cellname}]);
    hold off;
end

Male Control with AM251
for n = 1:size(DSE.Male.Control_AM251.sweepfile,2);
    x = linspace(0, (size(DSE.Male.Control_AM251.sweepfile(n).file_struct(1).Full_conc,1)/20000), size(DSE.Male.Control_AM251.sweepfile(n).file_struct(1).Full_conc,1));
    figure; hold on;
    plot(x,DSE.Male.Control_AM251.sweepfile(n).file_struct(1).Full_conc);
    ylabel('Amplitude (pA)'); xlabel('Time (s)');
    title([{DSE.Male.Control_AM251.sweepfile(n).file_struct(1).Cellname}]);
    hold off;
end

Male Fasted with AM251
for n = 1:size(DSE.Male.Fasted_AM251.sweepfile,2);
    x = linspace(0, (size(DSE.Male.Fasted_AM251.sweepfile(n).file_struct(1).Full_conc,1)/20000), size(DSE.Male.Fasted_AM251.sweepfile(n).file_struct(1).Full_conc,1));
    figure; hold on;
    plot(x,DSE.Male.Fasted_AM251.sweepfile(n).file_struct(1).Full_conc);
    ylabel('Amplitude (pA)'); xlabel('Time (s)');
    title([{DSE.Male.Fasted_AM251.sweepfile(n).file_struct(1).Cellname}]);
    hold off;
end

Female Control with AM251
for n = 1:size(DSE.Female.Control_AM251.sweepfile,2);
    x = linspace(0, (size(DSE.Female.Control_AM251.sweepfile(n).file_struct(1).Full_conc,1)/20000), size(DSE.Female.Control_AM251.sweepfile(n).file_struct(1).Full_conc,1));
    figure; hold on;
    plot(x,DSE.Female.Control_AM251.sweepfile(n).file_struct(1).Full_conc);
    ylabel('Amplitude (pA)'); xlabel('Time (s)');
    title([{DSE.Female.Control_AM251.sweepfile(n).file_struct(1).Cellname}]);
    hold off;
end

Female Fasted with AM251
for n = 1:size(DSE.Female.Fasted_AM251.sweepfile,2);
    x = linspace(0, (size(DSE.Female.Fasted_AM251.sweepfile(n).file_struct(1).Full_conc,1)/20000), size(DSE.Female.Fasted_AM251.sweepfile(n).file_struct(1).Full_conc,1));
    figure; hold on;
    plot(x,DSE.Female.Fasted_AM251.sweepfile(n).file_struct(1).Full_conc);
    ylabel('Amplitude (pA)'); xlabel('Time (s)');
    title([{DSE.Female.Fasted_AM251.sweepfile(n).file_struct(1).Cellname}]);
    hold off;
end
clear n x
%}
%%
%{
Writing my files as a database (can also write it as a text file and it
will still work). I then need to open these files in clampfit, specify
that the units are in pA, and that the sampling interval per signal
is 50 us (20KHz). Also, select Gap-Free. Once in clampfit, I also put all
of the data through a 2 KHz bessel filter.
%}

% Male Control
 d = '.dat';
for n = 1:size(DSE.Male.Control.sweepfile,2);
    matrix = DSE.Male.Control.sweepfile(n).file_struct(1).Full_conc;
    name = DSE.Male.Control.sweepfile(n).file_struct(1).Cellname;
    filenamedat = [name d];
    writematrix(matrix,filenamedat);
end

% Male Fasted
 d = '.dat';
for n = 1:size(DSE.Male.Fasted.sweepfile,2);
    matrix = DSE.Male.Fasted.sweepfile(n).file_struct(1).Full_conc;
    name = DSE.Male.Fasted.sweepfile(n).file_struct(1).Cellname;
    filenamedat = [name d];
    writematrix(matrix,filenamedat);
end

% Male Control with AM251
 d = '.dat';
for n = 1:size(DSE.Male.Control_AM251.sweepfile,2);
    matrix = DSE.Male.Control_AM251.sweepfile(n).file_struct(1).Full_conc;
    name = DSE.Male.Control_AM251.sweepfile(n).file_struct(1).Cellname;
    filenamedat = [name d];
    writematrix(matrix,filenamedat);
end

% Male Fasted with AM251
 d = '.dat';
for n = 1:size(DSE.Male.Fasted_AM251.sweepfile,2);
    matrix = DSE.Male.Fasted_AM251.sweepfile(n).file_struct(1).Full_conc;
    name = DSE.Male.Fasted_AM251.sweepfile(n).file_struct(1).Cellname;
    filenamedat = [name d];
    writematrix(matrix,filenamedat);
end

% Female Control
 d = '.dat';
for n = 1:size(DSE.Female.Control.sweepfile,2);
    matrix = DSE.Female.Control.sweepfile(n).file_struct(1).Full_conc;
    name = DSE.Female.Control.sweepfile(n).file_struct(1).Cellname;
    filenamedat = [name d];
    writematrix(matrix,filenamedat);
end

% Female Fasted
 d = '.dat';
for n = 1:size(DSE.Female.Fasted.sweepfile,2);
    matrix = DSE.Female.Fasted.sweepfile(n).file_struct(1).Full_conc;
    name = DSE.Female.Fasted.sweepfile(n).file_struct(1).Cellname;
    filenamedat = [name d];
    writematrix(matrix,filenamedat);
end

% Female Control with AM251
 d = '.dat';
for n = 1:size(DSE.Female.Control_AM251.sweepfile,2);
    matrix = DSE.Female.Control_AM251.sweepfile(n).file_struct(1).Full_conc;
    name = DSE.Female.Control_AM251.sweepfile(n).file_struct(1).Cellname;
    filenamedat = [name d];
    writematrix(matrix,filenamedat);
end

% Female Fasted with AM251
 d = '.dat';
for n = 1:size(DSE.Female.Fasted_AM251.sweepfile,2);
    matrix = DSE.Female.Fasted_AM251.sweepfile(n).file_struct(1).Full_conc;
    name = DSE.Female.Fasted_AM251.sweepfile(n).file_struct(1).Cellname;
    filenamedat = [name d];
    writematrix(matrix,filenamedat);
end

%% Randomizing my cells
%{
This portion of the script creates a table that randomizes my file names to
random numbers. I still need to go to my folders and manually change the
file names to these numbers. However, having this table makes unblinding
everything much simpler.
%}

Name_Matrix = [];

N = 'Male_Control_';
for n = 1:size(DSE.Male.Control.sweepfile,2);
    name = DSE.Male.Control.sweepfile(n).file_struct(1).Cellname;
    NAME = [N name];
    NAME = {NAME};
   	Name_Matrix = [Name_Matrix; NAME];
end

N = 'Male_Fasted_';
for n = 1:size(DSE.Male.Fasted.sweepfile,2);
    name = DSE.Male.Fasted.sweepfile(n).file_struct(1).Cellname;
    NAME = [N name];
    NAME = {NAME};
   	Name_Matrix = [Name_Matrix; NAME];
end

N = 'Male_Control_AM251_';
for n = 1:size(DSE.Male.Control_AM251.sweepfile,2);
    name = DSE.Male.Control_AM251.sweepfile(n).file_struct(1).Cellname;
    NAME = [N name];
    NAME = {NAME};
   	Name_Matrix = [Name_Matrix; NAME];
end

N = 'Male_Fasted_AM251_';
for n = 1:size(DSE.Male.Fasted_AM251.sweepfile,2);
    name = DSE.Male.Fasted_AM251.sweepfile(n).file_struct(1).Cellname;
    NAME = [N name];
    NAME = {NAME};
   	Name_Matrix = [Name_Matrix; NAME];
end

N = 'Female_Control_';
for n = 1:size(DSE.Female.Control.sweepfile,2);
    name = DSE.Female.Control.sweepfile(n).file_struct(1).Cellname;
    NAME = [N name];
    NAME = {NAME};
   	Name_Matrix = [Name_Matrix; NAME];
end

N = 'Female_Fasted_';
for n = 1:size(DSE.Female.Fasted.sweepfile,2);
    name = DSE.Female.Fasted.sweepfile(n).file_struct(1).Cellname;
    NAME = [N name];
    NAME = {NAME};
   	Name_Matrix = [Name_Matrix; NAME];
end

N = 'Female_Control_AM251_';
for n = 1:size(DSE.Female.Control_AM251.sweepfile,2);
    name = DSE.Female.Control_AM251.sweepfile(n).file_struct(1).Cellname;
    NAME = [N name];
    NAME = {NAME};
   	Name_Matrix = [Name_Matrix; NAME];
end

N = 'Female_Fasted_AM251_';
for n = 1:size(DSE.Female.Fasted_AM251.sweepfile,2);
    name = DSE.Female.Fasted_AM251.sweepfile(n).file_struct(1).Cellname;
    NAME = [N name];
    NAME = {NAME};
   	Name_Matrix = [Name_Matrix; NAME];
end
Name_Table = array2table(Name_Matrix);
random_number = randperm(length(Name_Matrix));
Random_Table = array2table(random_number);
Randomizer = [Name_Table Random_Table];
Randomizer.Properties.VariableNames = {'cell_name','random_number'};

writetable(Randomizer, 'sEPSC_Randomizer.xlsx');