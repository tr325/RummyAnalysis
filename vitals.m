function h = vitals (totals)
    
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
    figure
    plot(swing);
    title('Swing')
    
    Total_hands_played = length(hands)
    oMode = mode(hands(:,1))
    tMode = mode(hands(:,2))
    oMean = mean(hands(:,1))
    tMean = mean(hands(:,2))
    oMax = max(hands(:,1))
    tMax = max(hands(:,2))
    oMin = min(hands(:,1))
    tMin = min(hands(:,2))
    oMaxSwing = max(swing)
    tMaxSwing = abs(min(swing))
    oMaxDiff = max(sDiff)
    tMaxDiff = abs(min(sDiff))   

    h = hands;
    
endfunction
