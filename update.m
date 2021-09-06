function update()

    scoreIn = "newscore.txt";
    scoreOut = "SCORE.txt";
    fRecords = fopen("RECORDS.txt", 'r+');

    d = dir(scoreIn);
    if d.bytes ~= 0
        score = addScore(scoreIn, scoreOut);
    else
        score = load(scoreOut);
    endif

    [hands vitals] = vitals(score);
    fastests = fastRecords(score);
    tens = tenRecords(score);
    freqs = frequencies(hands);
    handRecs = handRecords(hands);

    records = [vitals; fastests; tens; freqs; handRecs];
    for i = 1:length(records)
        % Check for integer
        if (floor(records{i,2}) == records{i,2})
            fprintf(fRecords, '\n%s:\t %d, %d', records{i,:});
        else
            fprintf(fRecords, '\n%s:\t %0.3f, %0.3f', records{i,:});
        end
    end
    fclose(fRecords);

endfunction
