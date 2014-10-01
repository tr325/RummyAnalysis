function tenRecords (totals)
    
    tl = [zeros(10, 2); totals];
    th = [totals; repmat(totals(end, :), 10, 1)];
    tenScore = th - tl;
    tenDiff = tenScore(:,1) - tenScore(:,2);
    
    [oBestTen hand] = max(tenScore(:,1))
    [tBestTen hand] = max(tenScore(:,2))
    [oWorstTen hand] = min(tenScore(11:end-10,1))
    [tWorstTen hand] = min(tenScore(11:end-10,2))
    [oBestSwingTen hand] = max(tenDiff)
    [tBestSwingTen hand] = min(tenDiff);
    tBestSwingTen = abs(tBestSwingTen)
    hand = hand
    
    
    
endfunction
