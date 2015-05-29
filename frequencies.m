function frequencies(hands)
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
          
    [oSortedFreqs uniqIndex] = sort(oUniqScores(:,2));
    oMode = oUniqScores(uniqIndex(end))
    freq =  oSortedFreqs(end)
    oSecondMode = oUniqScores(uniqIndex(end-1))
    freq = oSortedFreqs(end-1)
    oModeRatio = oSortedFreqs(end)/oSortedFreqs(end-1)
    
    [tSortedFreqs uniqIndex] = sort(tUniqScores(:,2));
    tMode = tUniqScores(uniqIndex(end))
    timesScored =  tSortedFreqs(end)
    tSecondMode = tUniqScores(uniqIndex(end-1))
    timesScored = tSortedFreqs(end-1)
    tModeRatio = tSortedFreqs(end)/tSortedFreqs(end-1)
    
endfunction
