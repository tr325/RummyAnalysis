function [hands vitals] = vitals(totals, RECORDS)
    
    % Plots difference in score
    sDiff = totals(:,1)-totals(:,2);
    figure
    plot(sDiff);
    title('Score difference')
    xlabel('Hand number')
    grid on
    
    oTot = [0,0; totals];
    hTot = [totals; totals(end,:)];
    hands = hTot-oTot;
    swing = hands(:,1)-hands(:,2);
    
    % To store and return records in readable format    
    vitals = {};

    % TODO: Any of these that used to return a second result (eg. index/hand number)
    % don't, as they need a 2x1 array as the return container for that to work.

    vitals{1,1} = "Total hands played";
    vitals{1,2} = length(hands);

    vitals{2,1} = "Oli's current lead";
    vitals{2,2} = sDiff(end);

    vitals{3,1} = "Modes";
    vitals{3,2} = mode(hands(:,1));
    vitals{3,3} = mode(hands(:,2));

    vitals{4,1} = "Mean scores :-(";
    vitals{4,2} = mean(hands(:,1));
    vitals{4,3} = mean(hands(:,2));

    vitals{5,1} = "Maxes";
    vitals{5,2} = max(hands(:,1));
    vitals{5,3} = max(hands(:,2));
    vitals{6,1} = "Mins";
    vitals{6,2} = min(hands(:,1));
    vitals{6,3} = min(hands(:,2));

    vitals{7,1} = "Max swings";
    vitals{7,2} = max(swing);
    vitals{7,3} = -(min(swing));
    
    vitals{8,1} = "Max lead";
    vitals{8,2} = max(sDiff);
    vitals{8,3} = -(min(sDiff));
    
endfunction
