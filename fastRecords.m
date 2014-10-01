function fastRecords (totals)
    
    N = length(totals);
    
    % Fastest 1000 points
    oFast1000 = [1000 0 0];
    tFast1000 = [1000 0 0];
    
    for i = 1:N
        if totals(i, 1) > 1000
            j = find(totals(:,1) < totals(i,1) - 1000);
            if length(j) ~= 0
                j = j(end);
                if oFast1000(1) > (i-j)
                    oFast1000 = [i-j, j, i];
                end
            end
        end
        if totals(i, 2) > 1000
            j = find(totals(:,2) < totals(i,2) - 1000);
            if length(j) ~= 0
                j = j(end);
                if tFast1000(1) > (i-j)
                    tFast1000 = [i-j, j, i];
                end
            end
        end
    end
    
    oFast1000 = oFast1000
    tFast1000 = tFast1000
    
    %Fastest 10000 points
    oFast10000 = [1000 0 0];
    tFast10000 = [1000 0 0];
    
    for i = 1:N
        if totals(i, 1) > 10000
            j = find(totals(:,1) < totals(i,1) - 10000);
            if length(j) ~= 0
                j = j(end);
                if oFast10000(1) > (i-j)
                    oFast10000 = [i-j, j, i];
                end
            end
        end
        if totals(i, 2) > 10000
            j = find(totals(:,2) < totals(i,2) - 10000);
            if length(j) ~= 0
                j = j(end);
                if tFast10000(1) > (i-j)
                    tFast10000 = [i-j, j, i];
                end
            end
        end
    end
    
    oFast10000 = oFast10000
    tFast10000 = tFast10000
    
    %Fastest 1000 point swing
    oFast1000Swing = [1000 0 0];
    tFast1000Swing = [1000 0 0];
    
    sDiff = totals(:,1) - totals(:,2);
    
    for i = 1:N
        prevDif = sDiff(1:i);
        j = find(prevDif < sDiff(i) - 1000);
        if length(j) ~= 0 
            j = j(end);
            if oFast1000Swing(1) > (i-j)
                oFast1000Swing = [(i-j), j, i];
            end
        end
        j = find(prevDif > sDiff(i) + 1000);
        if length(j) ~= 0
            j = j(end);
            if tFast1000Swing(1) > (i-j)
                tFast1000Swing = [(i-j), j, i];
            end
        end
    end
    
    oFast1000Swing = oFast1000Swing
    tFast1000Swing = tFast1000Swing
    
endfunction
