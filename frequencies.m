function [freqRecords] = frequencies(hands)
    #Plots frequency of each hand score
    
    oHands = hands(:,1);
    tHands = hands(:,2);
    oUniqScores = unique(oHands);
    tUniqScores = unique(tHands);
    
    for i = [1:length(oUniqScores)]
        oUniqScores(i,2) = length(find(oHands == oUniqScores(i)));
    end
    for i = [1:length(tUniqScores)]
       tUniqScores(i,2) = length(find(tHands == tUniqScores(i)));
    end
    
    figure;
    plot(oUniqScores(:,1), oUniqScores(:,2));
    title("Score frequencies - (Oli: blue, Tom: red)");
    hold on;
    plot(tUniqScores(:,1), tUniqScores(:,2), 'r');
    xlabel('Score');ylabel('Number of times scored');

    % To store and return records in readable format    
    freqRecords = {};

    % TODO: Any of these that used to return a second result (eg. index/hand number)
    % don't, as they need a 2x1 array as the return container for that to work.

    [oSortedFreqs oUniqIndex] = sort(oUniqScores(:,2));
    freqRecords{1,1} = "Mode score";
    freqRecords{1,2} = oUniqScores(oUniqIndex(end));
    [tSortedFreqs tUniqIndex] = sort(tUniqScores(:,2));
    freqRecords{1,3} = tUniqScores(tUniqIndex(end));

    freqRecords{2,1} = "Frequency of mode";
    freqRecords{2,2} =  oSortedFreqs(end);
    freqRecords{2,3} =  tSortedFreqs(end);

    freqRecords{3,1} = "Second mode score";
    freqRecords{3,2} = oUniqScores(oUniqIndex(end-1));
    freqRecords{3,3} = tUniqScores(tUniqIndex(end-1));

    freqRecords{4,1} = "Frequency of second mode";
    freqRecords{4,2} = oSortedFreqs(end-1);
    freqRecords{4,3} = tSortedFreqs(end-1);

    freqRecords{5,1} = "(Mode/second mode) ratio";
    freqRecords{5,2} = oSortedFreqs(end)/oSortedFreqs(end-1);
    freqRecords{5,3} = tSortedFreqs(end)/tSortedFreqs(end-1);
    
endfunction
