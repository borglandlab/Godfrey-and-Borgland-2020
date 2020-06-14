% Creating a Structure containing data for my behavioural raster plot

% Removing the first row of Box C, because it's not actually a mouse
DarkBoxC = DarkBoxC(:,2:end);

% Creating BoxC
BoxC_Complete = BoxC_Latency2Feed_2sec;

l = length(DarkBoxC);
for n = 1:l;
BoxC_Complete(n).DarkEntry = DarkBoxC(n).DarkEntry;
BoxC_Complete(n).LightEntry = DarkBoxC(n).LightEntry;
BoxC_Complete(n).DarkEntrysum = DarkBoxC(n).DarkEntrysum;
BoxC_Complete(n).LightEntrysum = DarkBoxC(n).LightEntrysum;
BoxC_Complete(n).Latency_DarkEntry = DarkBoxC(n).Latency_DarkEntry;
BoxC_Complete(n).Latency_LightEntry = DarkBoxC(n).Latency_LightEntry;
end

% Creating BoxD
BoxD_Complete = BoxD_Latency2Feed_2sec;

l = length(DarkBoxD);
for n = 1:l;
BoxD_Complete(n).DarkEntry = DarkBoxD(n).DarkEntry;
BoxD_Complete(n).LightEntry = DarkBoxD(n).LightEntry;
BoxD_Complete(n).DarkEntrysum = DarkBoxD(n).DarkEntrysum;
BoxD_Complete(n).LightEntrysum = DarkBoxD(n).LightEntrysum;
BoxD_Complete(n).Latency_DarkEntry = DarkBoxD(n).Latency_DarkEntry;
BoxD_Complete(n).Latency_LightEntry = DarkBoxD(n).Latency_LightEntry;
end

% Creating BoxE
BoxE_Complete = BoxE_Latency2Feed_2sec;

l = length(DarkBoxE);
for n = 1:l;
BoxE_Complete(n).DarkEntry = DarkBoxE(n).DarkEntry;
BoxE_Complete(n).LightEntry = DarkBoxE(n).LightEntry;
BoxE_Complete(n).DarkEntrysum = DarkBoxE(n).DarkEntrysum;
BoxE_Complete(n).LightEntrysum = DarkBoxE(n).LightEntrysum;
BoxE_Complete(n).Latency_DarkEntry = DarkBoxE(n).Latency_DarkEntry;
BoxE_Complete(n).Latency_LightEntry = DarkBoxE(n).Latency_LightEntry;
end

% Creating a Complete box with C D and E
Box_Complete = [BoxC_Complete BoxD_Complete BoxE_Complete];

%%
% Removing exclusions
for e = [49 48 46 45 44 40 39 37 36 24];
    Box_Complete(e) = [];
end

%%

C_Sex = categorical([Box_Complete.Sex]);
C_Treatment = categorical([Box_Complete.Treatment]);

MC = [];
for m = 1:length(C_Sex);
    if C_Sex(m) == 'Male' && C_Treatment(m) == 'Control';
    a = 1;
    MC = [MC a];
    else
    a = 0;
    MC = [MC a];
    end
end

