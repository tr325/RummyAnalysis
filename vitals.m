function hands = vitals (totals)
    
    % Plots difference in score
    sDiff = totals(:,1) - totals(:,2);
    figure
    plot(sDiff);
    title('Score difference')
    xlabel('Hand number')
    grid on
    
    oTot = [0,0;totals];
    hTot = [totals; totals(end,:)];
    hands = hTot - oTot;
    swing = hands(:, 1) - hands(:,2);
    
    vitals = [];
    Total_hands_played = length(hands)
    oCurrentLead = sDiff(end)
    [oMode freq] = mode(hands(:,1))
    [tMode freq] = mode(hands(:,2))
    oMean = mean(hands(:,1))
    tMean = mean(hands(:,2))
    [oMax hand] = max(hands(:,1))
    [tMax hand] = max(hands(:,2))
    [oMin hand] = min(hands(:,1))
    [tMin hand] = min(hands(:,2))
    [oMaxSwing hand] = max(swing)
    [tMaxSwing hand] = (min(swing))
    [oMaxDiff hand] = max(sDiff)
    [tMaxDiff hand] = (min(sDiff))
    
endfunction
