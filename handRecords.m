function [handRecords] = handRecords(hands)

    handTotals = sum(hands, 2);
    bins = linspace(-100, 400, 101); % linear space bins of width 5
    figure
    hist(handTotals, bins)
    title('Total points scored per hand');
    %TODO: set xticks to be readable
    % print handscores.png
    close

    handRecords = {};
    handRecords{1,1} = "Average total points scored per hand";
    handRecords{1,2} = round(mean(handTotals));
    handRecords{1,3}= "";  % For the dimensions to match other files

    handRecords{2,1} = "Percentage of hands drawn";
    handRecords{2,2} = length(find(hands(:,1) == hands(:,2)))/100;

endfunction