function [tenRecords] = tenRecords(totals)
    
    tl = [zeros(10,2); totals];
    th = [totals; repmat(totals(end,:), 10, 1)];
    tenScore = th-tl;
    tenDiff = tenScore(:,1)-tenScore(:,2);
    
    tenRecords = {};

    % TODO: Any of these that used to return a second result (eg. index/hand number)
    % don't, as they need a 2x1 array as the return container for that to work.

    tenRecords{1,1} = "Best ten hand score";
    tenRecords{1,2} = max(tenScore(:,1));
    tenRecords{1,3} = max(tenScore(:,2));

    tenRecords{2,1} = "Worst ten hand score";
    tenRecords{2,2} = min(tenScore(11:end-10,1));
    tenRecords{2,3} = min(tenScore(11:end-10,2));

    tenRecords{3,1} = "Biggest ten hand swing";
    tenRecords{3,2} = max(tenDiff);
    tenRecords{3,3} = abs(min(tenDiff));
    
endfunction
