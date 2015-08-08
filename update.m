function update()

    scoreIn = "newscore.ascii";
    scoreOut = "SCORE.ascii";
    fRecords = fopen("RECORDS.txt", 'r+');

    d = dir(scoreIn);
    if d.bytes ~= 0        
        score = addScore(scoreIn, scoreOut);
    else
        score = load(scoreOut);
    endif
    
    [hands records] = vitals(score);
    fastRecords(score);
    tenRecords(score);
    frequencies(hands);

    for i = 1:length(records)
        % Check for integer
        if (floor(records{i,2}) == records{i,2})
            fprintf(fRecords, '\n%s: %d, %d', records{i,:});
        else
            fprintf(fRecords, '\n%s: %0.3f, %0.3f', records{i,:});
        end
    end
    fclose(fRecords);


endfunction
