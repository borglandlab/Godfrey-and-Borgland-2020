%{
This script is used to create a behavioural raster plot that can be used in
my paper as a figure to illustrate how the mouse is behaving during the
Light-Dark Box test. The raster plot shows when the mouse is in the dark
zone, the light zone, and the food zone.

Need Box_Complete, which is found in BehaviouralRaster.mat, to run this
script. This means that all other analysis must be complete.

Need the function RGB_converter to run this part of the script. You can
find different colours online in RBG format and then convert them. Allows
you to get exactly the colour that you want.

These figures can be saved as *.eps files that can then be opened in
illustrator.
%}

% Different colours converting from RGB that I tried
[darkblue] = RGB_converter([45 051 89]);
[yellow] = RGB_converter([242 202 126]);
[orange] = RGB_converter([242 123 80]);
[green] = RGB_converter([4 191 138]);
[blue] = RGB_converter([7 157 217]);

l1 = length(Box_Complete);

for m = 1:l1;

    l = length(Box_Complete(m).LightEntry);
    v = [1 1];

    figure; hold on;
    %alpha = 0.5;

    for n = 1:l
        x = [Box_Complete(m).DarkEntry(n) Box_Complete(m).LightEntry(n)];
        plot(x, v, 'color', blue, 'LineWidth',50);
    end

    l = length(Box_Complete(m).FoodZoneEntry);

    for n = 1:l
        x = [Box_Complete(m).FoodZoneEntry(n) Box_Complete(m).FoodZoneExit(n)];
        plot(x, v, 'color', yellow, 'LineWidth',50);
    end

    %l = length(Box_Complete(m).StopMove);

    %for n = 1:l
        %x = [Box_Complete(m).StopMove(n) Box_Complete(m).StartMove(n)];
        %plot(x, v, 'color', orange, 'LineWidth',50);
    %end

    n4 = 'Mouse #'; n1 = {Box_Complete(m).Mouse}; n2 = {Box_Complete(m).Sex}; n3 = {Box_Complete(m).Treatment};
    n1 = num2str(n1{:}); n2 = n2{:}; n3 = n3{:}; n2 = n2{:}; n3 = n3{:};
    TITLE = [n4 n1 ' ' n2 ' ' n3];
    title(TITLE);

    xlabel('Time (s)');

    %legend('Mouse in Dark Zone', 'Mouse in Food Zone');

    hold off;
end

clear alpha l l1 m n v x r a n1 n2 n3 n4 TITLE;
%%
%{
To compare all the best ones that I picked out to find the best for each
group.
%}
% Male Control vs Female Control

r = [1 39 32 38 26 24 21 16];

% Male Fasted vs Female Fasted
r = [6 42 40 34 33 37 25 22 15 8];

figure; hold on;

for m = r

    l = length(Box_Complete(m).LightEntry);
    v = [1 1];
    a = find(r == m);
    subplot(length(r),1,a); hold on;
    alpha = 0.5;

    for n = 1:l
        x = [Box_Complete(m).DarkEntry(n) Box_Complete(m).LightEntry(n)];
        plot(x, v, 'color', blue, 'LineWidth',30);
    end

    l = length(Box_Complete(m).FoodZoneEntry);

    for n = 1:l
        x = [Box_Complete(m).FoodZoneEntry(n) Box_Complete(m).FoodZoneExit(n)];
        plot(x, v, 'color', yellow, 'LineWidth',30);
    end

    n4 = 'Mouse #'; n1 = {Box_Complete(m).Mouse}; n2 = {Box_Complete(m).Sex}; n3 = {Box_Complete(m).Treatment};
    n1 = num2str(n1{:}); n2 = n2{:}; n3 = n3{:}; n2 = n2{:}; n3 = n3{:};
    TITLE = [n4 n1 ' ' n2 ' ' n3];
    title(TITLE);

    hold off;
end
hold off;
clear alpha l l1 m n v x r a n1 n2 n3 n4 TITLE;
%% To create my best trace for each group

%{
These are the figures that I used in the paper
%}

% Different colours that I used.
[darkdarkblue] = RGB_converter([28 28 38]);
[red] = RGB_converter([140 53 69]);

[green] = RGB_converter([3 140 101]);
[yellow] = RGB_converter([242, 226, 5]);

[purple] = RGB_converter([151 15 242]);
[green] = RGB_converter([73 217 7]);
r = [1 16 40 22];

black = [0 0 0];
grey = [0.75 0.75 0.75];

for m = r

    l = length(Box_Complete(m).LightEntry);
    v = [1 1];

    figure; hold on;
    alpha = 0.5;

    for n = 1:l
        x = [Box_Complete(m).DarkEntry(n) Box_Complete(m).LightEntry(n)];
        plot(x, v, 'color', black, 'LineWidth',50);
    end

    l = length(Box_Complete(m).FoodZoneEntry);

    for n = 1:l
        x = [Box_Complete(m).FoodZoneEntry(n) Box_Complete(m).FoodZoneExit(n)];
        plot(x, v, 'color', grey, 'LineWidth',50);
    end

    plot([-1 0], [1 1], 'k-', 'LineWidth', 50);
    plot([600 601], [1 1], 'k-', 'LineWidth', 50);

    n4 = 'Mouse #'; n1 = {Box_Complete(m).Mouse}; n2 = {Box_Complete(m).Sex}; n3 = {Box_Complete(m).Treatment};
    n1 = num2str(n1{:}); n2 = n2{:}; n3 = n3{:}; n2 = n2{:}; n3 = n3{:};
    TITLE = [n4 n1 ' ' n2 ' ' n3];
    title(TITLE);

    xlabel('Time (s)');

    %legend('Mouse in Dark Zone', 'Mouse in Food Zone'); % This legend doesn't look very good.

    hold off;
end

clear alpha l l1 m n v x r a n1 n2 n3 n4 TITLE;