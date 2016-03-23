function [handRecords] = handRecords(hands)

    handTotals = sum(hands, 2);
    bins = linspace(-100, 400, 101); % linear space bins of width 5
    figure
    hist(handTotals, bins)
    title('Total points scored per hand');
    %TODO: set xticks to be readable
    % print handscores.png
    close

    %TODO: This is nasty - vectorise it somehow.
    streaks = [0,0];
    currentStreak = [0,0];
    for i = 1:length(hands)
        if(hands(i,1) > hands(i,2))
            currentStreak(1) += 1;
            currentStreak(2) = 0;
        elseif(hands(i,2) > hands(i,1))
            currentStreak(1) = 0;
            currentStreak(2) += 1;
        else
            currentStreak = [0,0];
        end
        for j = 1:2
            if(currentStreak(j) > streaks(j))
                streaks(j) = currentStreak(j);
            end
        end
    end

    handRecords = {};
    handRecords{1,1} = "Average total points scored per hand";
    handRecords{1,2} = round(mean(handTotals));

    handRecords{2,1} = "Percentage of hands drawn";
    handRecords{2,2} = length(find(hands(:,1) == hands(:,2)))/100;

    handRecords{3,1} = "Longest winning streak";
    handRecords{3,2} = streaks(1);
    handRecords{3,3} = streaks(2);

endfunction
