function [fastRecords] = fastRecords(totals)
    
    N = length(totals);
    
    % Fastest 1000 points
    oFast1000 = [1000 0 0];
    tFast1000 = [1000 0 0];
    oSlow1000 = [0 0 0];
    tSlow1000 = [0 0 0];
    
    fastRecords = {};

    for handNum = 1:N
        if totals(handNum, 1) > 1000
            j = find(totals(:,1) < totals(handNum,1)-1000);
            if length(j) ~= 0
                j = j(end);
                if oFast1000(1) > (handNum-j)
                    oFast1000 = [handNum-j, j];
                end
                if oSlow1000(1) < (handNum-j)
                    oSlow1000 = [handNum-j, j];
                end                
            end
        end
        if totals(handNum, 2) > 1000
            j = find(totals(:,2) < totals(handNum,2)-1000);
            if length(j) ~= 0
                j = j(end);
                if tFast1000(1) > (handNum-j)
                    tFast1000 = [handNum-j, j];
                end
                if tSlow1000(1) < (handNum-j)
                    tSlow1000 = [handNum-j, j];
                end
            end
        end
    end 

    %Fastest 10000 points
    oFast10000 = [1000 0 0];
    tFast10000 = [1000 0 0];
    %Slowest 10000 points
    oSlow10000 = [0 0 0];
    tSlow10000 = [0 0 0];
    
    for i = 1:N
        if totals(i, 1) > 10000
            j = find(totals(:,1) < totals(i,1)-10000);
            if length(j) ~= 0
                j = j(end);
                if oFast10000(1) > (i-j)
                    oFast10000 = [i-j, j];
                end
                if oSlow10000(1) < (i-j)
                    oSlow10000 = [i-j, j];
                end
            end
        end
        if totals(i, 2) > 10000
            j = find(totals(:,2) < totals(i,2)-10000);
            if length(j) ~= 0
                j = j(end);
                if tFast10000(1) > (i-j)
                    tFast10000 = [i-j, j];
                end
                if tSlow10000(1) < (i-j)
                    tSlow10000 = [i-j, j];
                end
            end
        end
    end
    
    %Fastest 1000 point swing
    oFast1000Swing = [1000 0 0];
    tFast1000Swing = [1000 0 0];
    
    sDiff = totals(:,1)-totals(:,2);
    
    for i = 1:N
        prevDif = sDiff(1:i);
        j = find(prevDif < sDiff(i)-1000);
        if length(j) ~= 0 
            j = j(end);
            if oFast1000Swing(1) > (i-j)
                oFast1000Swing = [(i-j), j];
            end
        end
        j = find(prevDif > sDiff(i)+1000);
        if length(j) ~= 0
            j = j(end);
            if tFast1000Swing(1) > (i-j)
                tFast1000Swing = [(i-j), j];
            end
        end
    end
    
    fastRecords{1,1} = "Fastest 1000 points (in hands)";
    fastRecords{1,2} = oFast1000(1);
    fastRecords{1,3} = tFast1000(1);
    fastRecords{2,1} = "Slowest 1000 points (in hands)";
    fastRecords{2,2} = oSlow1000(1);
    fastRecords{2,3} = tSlow1000(1);

    fastRecords{3,1} = "Fastest 10000 points (in hands)";
    fastRecords{3,2} = oFast10000(1);
    fastRecords{3,3} = tFast10000(1);

    fastRecords{4,1} = "Slowest 10000 points (in hands)";
    fastRecords{4,2} = oSlow10000(1);
    fastRecords{4,3} = tSlow10000(1);

    fastRecords{5,1} = "Fastest 1000 swing (in hands)";
    fastRecords{5,2} = oFast1000Swing(1);
    fastRecords{5,3} = tFast1000Swing(1);

endfunction
