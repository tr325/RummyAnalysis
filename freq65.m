function freq65 (hands)
    
    oIdx = find(hands(:,1) == 65);
    tIdx = find(hands(:,2) == 65);
    handNum = 1:length(hands);
    o65 = zeros(handNum, 1);
    t65 = zeros(handNum, 1);
    o65(oIdx) = 1;
    t65(tIdx) = 1;
    
    figure
    hist(oIdx, 20);
    title('Olis 65 scoring rate')
    
endfunction
